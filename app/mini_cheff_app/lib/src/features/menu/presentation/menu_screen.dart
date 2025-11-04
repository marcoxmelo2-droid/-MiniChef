import 'package:flutter/material.dart';
import 'package:mini_cheff/src/core/theme/design_tokens.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  static const routeName = '/menu';

  @override
  Widget build(BuildContext context) {
    final meals = [
      ('Café da manhã', ['Vitamina de mamão', 'Tapioca com queijo minas']),
      ('Lanche da manhã', ['Banana amassada com aveia']),
      ('Almoço', ['Arroz integral', 'Feijão', 'Frango desfiado', 'Salada colorida']),
      ('Lanche da tarde', ['Pão integral com patê de grão-de-bico']),
      ('Jantar', ['Sopa de legumes com carne magra']),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardápio de hoje'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(NutriMaeTokens.space16),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(NutriMaeTokens.space16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(meal.$1, style: Theme.of(context).textTheme.titleLarge),
                      TextButton(onPressed: () {}, child: const Text('Trocar')),
                    ],
                  ),
                  const SizedBox(height: NutriMaeTokens.space12),
                  ...meal.$2.map((item) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: NutriMaeTokens.space8),
                        child: Row(
                          children: [
                            const Icon(Icons.check_circle, color: NutriMaeTokens.primary),
                            const SizedBox(width: NutriMaeTokens.space12),
                            Expanded(child: Text(item)),
                          ],
                        ),
                      )),
                  const SizedBox(height: NutriMaeTokens.space12),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.swap_horiz),
                    label: const Text('Ver substituições regionais'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
