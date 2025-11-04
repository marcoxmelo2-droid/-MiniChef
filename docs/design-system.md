# Design System Nutrimãe

## Identidade
- Tom: acolhedor, claro, sem julgamento.
- Mascote: Luma.IA (avatar animado suave).

## Tokens
| Token | Valor Light | Valor Dark |
| --- | --- | --- |
| `color.primary` | #6CC24A | #93E07A |
| `color.secondary` | #FFB703 | #FFB703 |
| `color.accent` | #FF6B6B | #FF6B6B |
| `color.background` | #FFFFFF | #0B1220 |
| `color.surface` | #F7FAF7 | #121A2B |
| `color.text.primary` | #1F2937 | #E5E7EB |
| `color.text.muted` | #6B7280 | #93A0C0 |
| `color.success` | #22C55E | #22C55E |
| `color.warning` | #F59E0B | #F59E0B |
| `color.error` | #EF4444 | #EF4444 |

### Tipografia
- Família títulos: **Poppins** (700, 600).
- Família texto UI: **Inter** (400, 500, 600).
- Tamanhos: 32, 24, 20, 16, 14.

### Espaçamentos
Escala 4, 8, 12, 16, 24, 32 px.

### Raios
XS 6, SM 10, LG 16, XL 24.

### Sombras
- Elevação suave: `0 4 12 rgba(0,0,0,0.12)`.
- FAB: `0 8 24 rgba(108,194,74,0.32)`.

## Componentes
- **AppBar Nutrimãe**: Título + avatar da criança, ações (notificações, perfil).
- **FAB Escanear**: botão primário com ícone câmera.
- **Cartões de alimento**: imagem mini, nome, kcal.
- **Chips de filtro**: bordas arredondadas, estado selecionado com preenchimento primário 16%.
- **Barra de progresso diário**: rótulo, meta e progress bar 12px.
- **Tabela nutricional compacta**: linhas com rótulo + valor + % meta.
- **Card Dica 1 minuto**: ícone lâmpada + CTA "Quero mais dicas".
- **Avatar Luma.IA**: animação Lottie, fundo suave.

## Acessibilidade
- Contraste mínimo AA (texto primário > 4.5:1).
- Tamanho de toque ≥ 44px.
- Texto escalável (suporte até 200%).
- Ícones com `SemanticsLabel`.
- Feedback háptico leve no scanner (uso `HapticFeedback.lightImpact`).

## Estados
- Vazio: ilustração leve + CTA.
- Erro: mensagem clara, botões "Tentar de novo".
- Sucesso: banner verde com ícone check.

## Modo Infantil
- Ícones maiores, fontes 18+, linguagem lúdica ("Vamos cumprir a missão água?").
- Avatar reage a conquistas (animações curtas).

## Documentação Figma
- Bibliotecas: Cores, Tipografia, Componentes.
- Variantes: Card (default, alerta, sucesso), Botões (filled, tonal, outlined).
- Tokens exportáveis via estilo global (Color Styles + Text Styles).
