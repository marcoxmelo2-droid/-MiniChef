# Analytics & Experimentos

## Eventos Firebase Analytics
| Evento | Trigger | Parâmetros |
| --- | --- | --- |
| `scan_started` | Usuário abre câmera | `child_id`, `mode` (on_device/cloud) |
| `scan_success` | IA retorna resultado | `items_detected`, `latency_ms`, `confidence_avg` |
| `scan_fail` | Falha na inferência | `reason` |
| `meal_added` | Usuário adiciona ao diário | `meal_type`, `calories` |
| `meal_swapped` | Usuário troca item | `from_item`, `to_item` |
| `chat_opened` | Tela chat aberta | `entry_point` |
| `chat_prompt_sent` | Mensagem enviada | `tokens_estimated`, `mode` (adult/child) |
| `plan_viewed` | Cardápio aberto | `daypart` |
| `paywall_viewed` | Paywall exibido | `variant` |
| `subscribe_clicked` | CTA assinatura | `variant` |
| `subscribed` | Compra concluída | `plan`, `value` |
| `retention_day7` | Usuário ativo D7 | `child_age_range` |
| `retention_day30` | Usuário ativo D30 | `child_age_range` |

## Funil Free → Premium
1. `paywall_viewed`
2. `subscribe_clicked`
3. `subscribed`

Meta inicial: conversão ≥ 5%.

## Remote Config
- `paywall_variant` (A/B copy).
- `scan_limit_free` (default 3).
- `chat_free_daily` (default 5 prompts).
- `motd_text` (mensagem do dia no home).

## Dashboards sugeridos
- Retenção por faixa etária.
- Distribuição de alertas nutricionais.
- Tempo médio do scanner.
- Engajamento Modo Infantil.

## Testes
- Testes unitários (Flutter, Functions, Python) conforme `README`.
- Beta fechado 50 mães: formulário NPS + heatmaps (Hotjar mobile ou Firebase UX).
