import 'package:flutter/material.dart';
import 'package:mini_cheff/src/core/theme/design_tokens.dart';
import 'package:mini_cheff/src/features/chat/presentation/chat_screen.dart';
import 'package:mini_cheff/src/features/diary/presentation/diary_screen.dart';
import 'package:mini_cheff/src/features/menu/presentation/menu_screen.dart';
import 'package:mini_cheff/src/features/scanner/presentation/scanner_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(child: Icon(Icons.child_care)),
            const SizedBox(width: NutriMaeTokens.space12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bom dia!', style: Theme.of(context).textTheme.bodyMedium),
                Text('Pequena Sofia', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).pushNamed(ScannerScreen.routeName),
        icon: const Icon(Icons.center_focus_strong),
        label: const Text('Escanear'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(NutriMaeTokens.space16),
        children: [
          _QuickActionCard(
            title: 'Escanear prato',
            subtitle: 'Aponte a câmera para o prato do dia',
            icon: Icons.camera_alt_outlined,
            onTap: () => Navigator.of(context).pushNamed(ScannerScreen.routeName),
          ),
          _QuickActionCard(
            title: 'Ver cardápio de hoje',
            subtitle: 'Sugestões equilibradas para cada refeição',
            icon: Icons.restaurant,
            onTap: () => Navigator.of(context).pushNamed(MenuScreen.routeName),
          ),
          _QuickActionCard(
            title: 'Atualizar diário',
            subtitle: 'Acompanhe progresso, preferências e metas',
            icon: Icons.calendar_today,
            onTap: () => Navigator.of(context).pushNamed(DiaryScreen.routeName),
          ),
          const SizedBox(height: NutriMaeTokens.space24),
          Text('Progresso diário', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: NutriMaeTokens.space12),
          _DailyProgressBar(
            label: 'Calorias',
            value: 0.6,
            goalText: '960 / 1600 kcal',
            color: NutriMaeTokens.primary,
          ),
          _DailyProgressBar(
            label: 'Proteínas',
            value: 0.45,
            goalText: '22 / 50 g',
            color: NutriMaeTokens.secondary,
          ),
          _DailyProgressBar(
            label: 'Fibras',
            value: 0.3,
            goalText: '7 / 20 g',
            color: NutriMaeTokens.accent,
          ),
          const SizedBox(height: NutriMaeTokens.space24),
          Text('Dica de 1 minuto', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: NutriMaeTokens.space12),
          _TipCard(
            title: 'Prato colorido: 3 cores mín.',
            description: 'Convide a criança para escolher um alimento de cada cor para o prato.',
          ),
          _TipCard(
            title: 'Troca inteligente: suco → fruta inteira.',
            description: 'Mais fibras, saciedade e menos açúcar livre.',
          ),
          const SizedBox(height: NutriMaeTokens.space24),
          FilledButton.icon(
            onPressed: () => Navigator.of(context).pushNamed(ChatScreen.routeName),
            icon: const Icon(Icons.chat),
            label: const Text('Perguntar para a Luma.IA'),
          ),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  const _QuickActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: NutriMaeTokens.primary),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class _DailyProgressBar extends StatelessWidget {
  const _DailyProgressBar({
    required this.label,
    required this.value,
    required this.goalText,
    required this.color,
  });

  final String label;
  final double value;
  final String goalText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: NutriMaeTokens.space12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: Theme.of(context).textTheme.bodyLarge),
              Text(goalText, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: NutriMaeTokens.space8),
          ClipRRect(
            borderRadius: BorderRadius.circular(NutriMaeTokens.radiusLg),
            child: LinearProgressIndicator(
              minHeight: 12,
              value: value,
              valueColor: AlwaysStoppedAnimation(color),
              backgroundColor: color.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  const _TipCard({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(NutriMaeTokens.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: NutriMaeTokens.space12),
            Text(description),
            const SizedBox(height: NutriMaeTokens.space12),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed(ChatScreen.routeName),
              child: const Text('Quero mais dicas'),
            ),
          ],
        ),
      ),
    );
  }
}
