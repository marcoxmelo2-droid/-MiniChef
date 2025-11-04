import 'package:flutter/material.dart';
import 'package:mini_cheff/src/core/theme/design_tokens.dart';

class ScanResultBottomSheet extends StatelessWidget {
  const ScanResultBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      expand: false,
      builder: (_, controller) => Container(
        padding: const EdgeInsets.all(NutriMaeTokens.space24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(NutriMaeTokens.radiusXl)),
        ),
        child: ListView(
          controller: controller,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: NutriMaeTokens.textSoft,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: NutriMaeTokens.space24),
            Text(
              'Prato detectado! Que tal deixar mais colorido?',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: NutriMaeTokens.space16),
            _FoodRow(name: 'Arroz integral', calories: '120 kcal', portion: '1/2 xíc.'),
            _FoodRow(name: 'Feijão carioca', calories: '90 kcal', portion: '1 concha'),
            _FoodRow(name: 'Frango grelhado', calories: '150 kcal', portion: '1 filé'),
            _FoodRow(name: 'Brócolis', calories: '35 kcal', portion: '1/2 xíc.'),
            const SizedBox(height: NutriMaeTokens.space24),
            _NutrientSummary(
              calories: '395 kcal',
              macros: 'Carb 45g · Prot 28g · Fibra 9g',
              micros: 'Ferro 3mg · Vit C 22mg',
              alerts: const [
                'Adicionar fruta rica em vitamina C pode melhorar absorção do ferro.',
                'Proteína adequada para faixa 4-6 anos.',
              ],
            ),
            const SizedBox(height: NutriMaeTokens.space24),
            FilledButton(
              onPressed: () {},
              child: const Text('Adicionar ao diário'),
            ),
            const SizedBox(height: NutriMaeTokens.space12),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Gerar prato ideal'),
            ),
          ],
        ),
      ),
    );
  }
}

class _FoodRow extends StatelessWidget {
  const _FoodRow({
    required this.name,
    required this.calories,
    required this.portion,
  });

  final String name;
  final String calories;
  final String portion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: NutriMaeTokens.space8),
      child: Row(
        children: [
          const CircleAvatar(child: Icon(Icons.fastfood)),
          const SizedBox(width: NutriMaeTokens.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: Theme.of(context).textTheme.bodyLarge),
                Text(portion, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          Text(calories, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}

class _NutrientSummary extends StatelessWidget {
  const _NutrientSummary({
    required this.calories,
    required this.macros,
    required this.micros,
    required this.alerts,
  });

  final String calories;
  final String macros;
  final String micros;
  final List<String> alerts;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(NutriMaeTokens.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Resumo nutricional', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: NutriMaeTokens.space12),
            Text(calories, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: NutriMaeTokens.space8),
            Text(macros),
            const SizedBox(height: NutriMaeTokens.space8),
            Text(micros),
            const SizedBox(height: NutriMaeTokens.space12),
            ...alerts.map(
              (alert) => Padding(
                padding: const EdgeInsets.only(bottom: NutriMaeTokens.space8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.lightbulb, color: NutriMaeTokens.secondary),
                    const SizedBox(width: NutriMaeTokens.space8),
                    Expanded(child: Text(alert)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
