import 'package:flutter/material.dart';
import 'package:mini_cheff/src/core/theme/design_tokens.dart';
import 'package:mini_cheff/src/features/home/presentation/home_screen.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  static const routeName = '/onboarding';

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  int currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  void _nextStep() {
    if (currentStep == 2) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } else {
      setState(() {
        currentStep++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final steps = [
      _OnboardingStep(
        title: 'Vamos conhecer seu pequeno?',
        description:
            'Conte para a Luma.IA idade, peso aproximado e rotina para personalizarmos os cardápios.',
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome da criança'),
            ),
            const SizedBox(height: NutriMaeTokens.space16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Faixa etária'),
              items: const [
                DropdownMenuItem(value: '6-12m', child: Text('6-12 meses')),
                DropdownMenuItem(value: '1-3a', child: Text('1-3 anos')),
                DropdownMenuItem(value: '4-6a', child: Text('4-6 anos')),
                DropdownMenuItem(value: '7-10a', child: Text('7-10 anos')),
              ],
              onChanged: (_) {},
            ),
          ],
        ),
      ),
      _OnboardingStep(
        title: 'Restrições e preferências',
        description: 'Alergias, alimentos amados e aqueles que não descem de jeito nenhum.',
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Alergias'),
            ),
            const SizedBox(height: NutriMaeTokens.space16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Preferidos'),
            ),
          ],
        ),
      ),
      _OnboardingStep(
        title: 'Objetivos',
        description: 'Conte qual seu foco: variedade, ganho de peso, rotina mais prática...',
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Objetivo principal'),
            ),
            const SizedBox(height: NutriMaeTokens.space16),
            SwitchListTile(
              title: const Text('Ativar modo infantil (interface lúdica)'),
              value: true,
              onChanged: (_) {},
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('MiniCheff'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(NutriMaeTokens.space24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: (currentStep + 1) / steps.length,
                backgroundColor: NutriMaeTokens.softBackground,
                valueColor: const AlwaysStoppedAnimation(NutriMaeTokens.primary),
              ),
              const SizedBox(height: NutriMaeTokens.space24),
              Text(
                steps[currentStep].title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: NutriMaeTokens.space12),
              Text(
                steps[currentStep].description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: NutriMaeTokens.space24),
              Expanded(child: SingleChildScrollView(child: steps[currentStep].child)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(NutriMaeTokens.space16),
          child: FilledButton(
            onPressed: _nextStep,
            child: Text(currentStep == steps.length - 1 ? 'Começar jornada' : 'Continuar'),
          ),
        ),
      ),
    );
  }
}

class _OnboardingStep {
  const _OnboardingStep({
    required this.title,
    required this.description,
    required this.child,
  });

  final String title;
  final String description;
  final Widget child;
}
