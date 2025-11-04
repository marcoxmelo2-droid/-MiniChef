# Publicação Android & iOS

## Pré-requisitos
- Conta Google Play Console e Apple Developer Program.
- Certificados e perfis de provisionamento.
- Configurar `google-services.json` e `GoogleService-Info.plist`.

## Android
1. `flutter build appbundle --target-platform=android-arm64`.
2. Assinar com chave `keystore` (`key.properties`).
3. Upload AAB no Play Console (Closed Testing → Beta fechado com 50 mães).
4. Configurar permissões: câmera, armazenamento, notificações.
5. Preencher seções de segurança de dados (processamento on-device, opção opt-out).

## iOS
1. `flutter build ipa --release` com Xcode 15.
2. Configurar `Runner.xcworkspace` → Signing & Capabilities.
3. Adicionar descrição de uso da câmera (`NSCameraUsageDescription`).
4. TestFlight → Beta testers → 50 mães.
5. Preencher App Store Privacy (dados da criança pseudonimizados, exclusão sob demanda).

## Checklist QA
- Fonte 120% sem quebrar layout.
- Scanner latência < 2,5s em Android intermediário (Moto G família).
- Paywall vs Free: limites respeitados via Remote Config.
- Offline básico: histórico e receitas acessíveis sem rede.

## Roll-out
- Semana 0: Beta fechado + NPS.
- Semana 2: Ajustes, abrir para mais 200 usuários.
- Semana 4: Lançamento Brasil, monitorar eventos `retention_day7` / `paywall_viewed`.

## Suporte
- Canal in-app com Zendesk ou Firebase In-App Messaging.
- FAQ em `mini.cheff.br/ajuda`.
- Política de privacidade hospedada e atualizada.
