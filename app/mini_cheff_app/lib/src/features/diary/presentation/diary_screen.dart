import 'package:flutter/material.dart';
import 'package:mini_cheff/src/core/theme/design_tokens.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key});

  static const routeName = '/diary';

  @override
  Widget build(BuildContext context) {
    final entries = [
      ('Hoje', 'Almoço', '👍 Sofia adorou o brócolis ao vapor!'),
      ('Ontem', 'Lanche da tarde', '👎 Rejeitou o patê, tentar versão com cenoura.'),
      ('Domingo', 'Checklist', 'Missão água completada 5/5 copos.'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diário da criança'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(NutriMaeTokens.space16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(NutriMaeTokens.space16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Metas da semana', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: NutriMaeTokens.space12),
                  _GoalProgress(title: '3 cores no prato', value: 0.7),
                  _GoalProgress(title: 'Proteína diária', value: 0.5),
                  _GoalProgress(title: 'Missão água', value: 0.9),
                ],
              ),
            ),
          ),
          const SizedBox(height: NutriMaeTokens.space16),
          Text('Histórico', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: NutriMaeTokens.space12),
          ...entries.map((entry) => Card(
                child: ListTile(
                  title: Text('${entry.$1} · ${entry.$2}'),
                  subtitle: Text(entry.$3),
                  trailing: IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {},
                    tooltip: 'Compartilhar',
                  ),
                ),
              )),
          const SizedBox(height: NutriMaeTokens.space24),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.summarize),
            label: const Text('Ver relatório semanal'),
          ),
        ],
      ),
    );
  }
}

class _GoalProgress extends StatelessWidget {
  const _GoalProgress({required this.title, required this.value});

  final String title;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: NutriMaeTokens.space12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: NutriMaeTokens.space8),
          LinearProgressIndicator(
            value: value,
            backgroundColor: NutriMaeTokens.softBackground,
            valueColor: AlwaysStoppedAnimation(NutriMaeTokens.primary),
            minHeight: 8,
          ),
        ],
      ),
    );
  }
}
