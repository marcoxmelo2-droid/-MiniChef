# MiniCheff — IA de Alimentação Infantil

> "Aponte a câmera para o prato. A IA identifica alimentos, calcula nutrientes e monta refeições adequadas à idade. Chat integrado com dicas, checklists e cardápios." (PT-BR)

## Visão Geral
- Público: mães/pais de crianças de 6 meses a 10 anos.
- Princípios: segurança, praticidade, evidência científica.
- App multilíngue focado no Brasil, com tom acolhedor e sem julgamentos.

### Repositório
```
.
├── app/mini_cheff_app        # Projeto Flutter (Material 3)
├── firebase/functions        # Cloud Functions (Node/TypeScript)
├── ai                        # Pipeline YOLOv8 + inferência
├── data                      # Scripts banco nutricional (TACO + USDA)
├── scripts                   # Regras nutricionais e utilitários
├── docs                      # Arquitetura, design system, analytics, publicação
└── design                    # Artefatos Figma (protótipo navegável)
```

## Setup Rápido
1. **Flutter**
   ```bash
   cd app/mini_cheff_app
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   flutter run
   ```
2. **Firebase Functions**
   ```bash
   cd firebase/functions
   npm install
   npm run build
   firebase emulators:start --only functions
   ```
3. **IA (opcional)**
   ```bash
   cd ai
   pip install -r requirements.txt  # gerar conforme ambiente (ultralytics, numpy)
   python train.py  # exige dataset anotado
   python train.py  # reexecuta para fine-tuning
   python -c "from infer import run_inference"
   ```
4. **Importar TACO**
   ```bash
   cd data
   python import_nutrition.py  # requer Application Default Credentials
   ```

## Requisitos
- Flutter 3.16+, Dart 3.1+
- Firebase CLI 12+
- Node 18+
- Python 3.10+

## Funcionalidades Principais
- Scanner de alimentos com YOLOv8 on-device + fallback cloud.
- Painel nutricional por faixa etária (6-12m, 1-3a, 4-6a, 7-10a).
- Cardápio inteligente com substituições regionais.
- Chat Luma.IA com prompts rápidos, checklists, alertas.
- Diário com metas, preferências, alergias e gamificação.
- Modo infantil com UI lúdica.
- Onboarding coletando idade/peso/rotina/objetivos.
- Conteúdos curtos e educativos.

## Design System Nutrimãe
- Paleta primária #6CC24A, secundária #FFB703, acento #FF6B6B.
- Tipos: Poppins (títulos), Inter (texto).
- Espaçamentos 4-32px, raios 6-24px, sombras suaves.
- Componentes: AppBar com avatar, FAB Escanear, cartões de alimento, chips filtros, barra progresso, tabela nutricional compacta, cards "Dica de 1 minuto", avatar Luma.IA.
- Acessibilidade: contraste AA, toque ≥44px, texto escalável, alt text.

## Analytics & A/B
- Eventos principais `scan_started`, `scan_success`, `meal_added`, `chat_prompt_sent`, `paywall_viewed`, `subscribed`, `retention_day7`, `retention_day30`.
- Remote Config: `scan_limit_free`, `chat_free_daily`, `paywall_variant`, `motd_text`.

## Banco Nutricional
- Coleções Firestore: `foods_br` (TACO), `foods_usda` (fallback FoodData Central via API oficial).
- Script `data/import_nutrition.py` normaliza CSV TACO (licença pública sob citação) e orienta uso legal da API USDA.

## IA Visual
- Treinamento `ai/train.py` com YOLOv8s.
- Exportação ONNX/TFLite com `YOLO.export`.
- Inferência `ai/infer.py` (tflite_runtime) com limiar 0.35.
- Pós-processamento mapeia rótulos → Firestore e calcula porções.
- Edição manual via autocomplete.

## Chat Nutri IA
- Cloud Function `chatWithLuma` usa OpenAI (contrato gpt-4o-mini) com mensagens curtas e seguras.
- Disclaimers e registros no Firestore (`chats/{childId}/messages`).

## Estrutura de Dados
- `users/{userId}` → dados do responsável.
- `children/{childId}` → idade, peso, alergias, objetivos.
- `scans/{scanId}` → imagem (Storage), alimentos detectados, nutrientes.
- `meals/{mealId}` → composição, horário, aceitação (👍/👎).
- `prompts/` → templates (checklists, cardápio 7d, trocas).

## Testes & QA
- Flutter: `flutter test` (tema, lógica de estado).
- Functions: `npm test` (criar testes jest - pending).
- Python: `pytest` (adicionar testes para `scripts/nutrient_rules.py`).
- Beta fechado: 50 mães, NPS, heatmaps.

## Segurança & Privacidade
- Consentimento explícito (armazenado em Firestore).
- Opção "processar imagens apenas no dispositivo".
- Pseudonimização e exclusão sob demanda via função Cloud.

## Monetização
- Free: 3 scans/dia, chat limitado.
- Premium R$19,90/mês: ilimitado, cardápios completos, modo família, relatórios.
- Paywall detalhado com comparação de planos.

## Protótipo Figma
Arquivo `.fig` em `design/mini_cheff.fig` com fluxo completo (onboarding → home → scanner → resultado → cardápio → chat → diário → perfil → paywall) incluindo modo infantil e estados vazios/erro.

## Documentação adicional
- [Arquitetura](docs/architecture.md)
- [Design System](docs/design-system.md)
- [UX Writing](docs/ux-writing.md)
- [Analytics & A/B](docs/analytics.md)
- [Publicação Android/iOS](docs/publication.md)

## Licenciamento dados TACO/USDA
- **TACO**: disponível gratuitamente pelo NEPA/UNICAMP. Cite a fonte e mantenha dados íntegros.
- **USDA FoodData Central**: uso permitido via API pública com chave (respeitar termos de serviço, sem redistribuição comercial sem consentimento).

## Próximos Passos
- Implementar camadas de repositórios e providers (Firestore + cache).
- Adicionar testes instrumentados e golden tests.
- Integrar Crashlytics, Performance Monitoring e App Check.
- Automatizar CI/CD (Flutter + Firebase Deploy).
