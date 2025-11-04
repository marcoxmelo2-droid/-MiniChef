import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import OpenAI from 'openai';

type FoodDetection = {
  name: string;
  confidence: number;
  portionEstimateGrams: number;
};

type Nutrient = {
  energyKcal: number;
  proteinG: number;
  carbsG: number;
  fatG: number;
  fiberG: number;
  micronutrients: Record<string, number>;
};

admin.initializeApp();
const db = admin.firestore();

export const chatWithLuma = functions.region('southamerica-east1').https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError('unauthenticated', 'Faça login para usar o chat.');
  }

  const { prompt, childId } = data as { prompt: string; childId: string };
  if (!prompt) {
    throw new functions.https.HttpsError('invalid-argument', 'Prompt obrigatório.');
  }

  const childSnapshot = await db.collection('children').doc(childId).get();
  const child = childSnapshot.data() ?? {};

  const openai = new OpenAI({ apiKey: functions.config().openai.key });
  const systemPrompt = `Você é a Luma.IA, uma nutricionista virtual que fala com carinho e base em evidências para cuidadores de crianças brasileiras. Seja breve, dê passos práticos, traga alertas e lembre que não substitui o pediatra.`;

  const completion = await openai.chat.completions.create({
    model: 'gpt-4o-mini',
    max_tokens: 400,
    temperature: 0.4,
    messages: [
      { role: 'system', content: systemPrompt },
      {
        role: 'user',
        content: `Dados da criança: ${JSON.stringify(child)}. Pergunta: ${prompt}`,
      },
    ],
  });

  const answer = completion.choices[0].message?.content ?? 'Não consegui responder agora. Tente novamente em instantes.';
  await db
    .collection('chats')
    .doc(childId)
    .collection('messages')
    .add({
      prompt,
      answer,
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
    });

  return { answer };
});

export const logScan = functions.region('southamerica-east1').https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError('unauthenticated', 'Faça login para registrar pratos.');
  }

  const { childId, foods, nutrients } = data as {
    childId: string;
    foods: FoodDetection[];
    nutrients: Nutrient;
  };

  if (!childId || !foods || !nutrients) {
    throw new functions.https.HttpsError('invalid-argument', 'Dados incompletos.');
  }

  const scanRef = await db.collection('scans').add({
    childId,
    foods,
    nutrients,
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
  });

  await db.collection('children').doc(childId).collection('diary').doc(scanRef.id).set({
    ...nutrients,
    foods,
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
  });

  return { scanId: scanRef.id };
});
