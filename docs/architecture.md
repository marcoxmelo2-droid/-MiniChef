# Arquitetura MiniCheff

## Visão Geral
- **Mobile**: Flutter (Material 3) com Riverpod para estado, integração Firebase e suporte a modo offline via `shared_preferences` + fila Firestore.
- **Backend**: Firebase Auth, Firestore, Storage, Cloud Functions (Node/TypeScript).
- **IA Visual**: YOLOv8 small com fine-tuning em pratos brasileiros, exportado para ONNX/TFLite. Inferência on-device com fallback cloud.
- **Chat**: Função Cloud Functions -> OpenAI LLM (gpt-4o-mini) com camadas de segurança e limites.
- **Núcleo Nutricional**: Banco Firestore `foods_br` (TACO) + `foods_usda`. Scripts de importação e regras de cálculo em `scripts/nutrient_rules.py`.
- **Analytics**: Firebase Analytics + Remote Config para A/B.

## Componentes Mobile
- `lib/src/core/theme`: tokens e temas claro/escuro.
- `lib/src/features/*`: telas modulares (onboarding, home, scanner, cardápio, chat, diário, perfil, configurações).
- `lib/src/services`: (placeholder) para camada de dados (Firestore, offline cache, fila de sincronização).
- `lib/src/data/models`: modelos `freezed` + `json_serializable`.
- `test/`: testes unitários Flutter.

## Fluxos Principais
1. **Onboarding** → coleta idade, peso, preferências, objetivos. Salvo em `children/{childId}`.
2. **Scanner** → captura imagem, roda YOLO on-device. Se offline, enfileira. Caso baixa confiança, solicita edição manual.
3. **Pós-processamento** → mapeia rótulos para `foods_br`. Se não encontrado, fallback embeddings + `foods_usda`.
4. **Cálculo Nutricional** → porções estimadas + `TARGETS` → alertas e sugestões.
5. **Diário** → grava `meals/{mealId}` e exibe histórico com metas.
6. **Chat Luma.IA** → Cloud Function, logs no Firestore, limites diários (ver Remote Config).
7. **Cardápio** → gerador server-side (não incluso) baseado em preferências; substituições regionais via sinônimos.

## Offline
- Histórico e receitas armazenados localmente (`shared_preferences` / SQLite) com sincronização incremental ao reconectar.
- Fila de scans: `PendingScan` com imagem comprimida no Storage quando online.

## Segurança & Privacidade
- Firebase Auth (email/senha ou federado).
- Consentimento armazenado em `users/{userId}/consents`.
- Opção on-device: configurações definem se imagens podem sair do aparelho.
- Dados pseudonimizados; exclusão via função cloud.

## DevOps & Deploy
- GitHub Actions (sugerido) para CI (análise Flutter, testes, lint functions).
- Deploy Cloud Functions `firebase deploy --only functions`.
- Publicação app: ver `docs/publication.md`.

## Escalabilidade
- YOLO on-device reduz latência (<2.5s). Fallback cloud com Cloud Run + GPU opcional.
- Firestore escalável com índices compostos: `children` + `diary` por data, `scans` por `childId`.

## Observabilidade
- Firebase Crashlytics (não incluso no código) recomendado.
- Logging Cloud Functions com métricas (tempo resposta chat, quota OpenAI).
