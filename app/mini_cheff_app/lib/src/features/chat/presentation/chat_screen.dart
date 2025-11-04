import 'package:flutter/material.dart';
import 'package:mini_cheff/src/core/theme/design_tokens.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  static const routeName = '/chat';

  @override
  Widget build(BuildContext context) {
    final suggestions = [
      'Gerar checklist',
      'Trocas inteligentes',
      'Receita rápida',
      'Missão do legume',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Luma.IA'),
        actions: const [Padding(padding: EdgeInsets.only(right: 16), child: Icon(Icons.shield_moon))],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(NutriMaeTokens.space16),
              children: const [
                _ChatBubble(
                  message:
                      'Olá! Sou a Luma.IA. Posso sugerir cardápios, listas de compras e adaptações para alergias.',
                  isUser: false,
                ),
                _ChatBubble(
                  message: 'Pergunte algo: "ele não come legumes".',
                  isUser: false,
                  highlight: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: NutriMaeTokens.space16),
            child: Wrap(
              spacing: NutriMaeTokens.space8,
              runSpacing: NutriMaeTokens.space8,
              children: [
                for (final suggestion in suggestions)
                  ActionChip(
                    label: Text(suggestion),
                    onPressed: () {},
                  ),
              ],
            ),
          ),
          const SizedBox(height: NutriMaeTokens.space12),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(NutriMaeTokens.space16),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.photo_camera_back_outlined)),
                  const SizedBox(width: NutriMaeTokens.space8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Pergunte algo: "ele não come legumes".',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(NutriMaeTokens.radiusLg),
                        ),
                      ),
                      minLines: 1,
                      maxLines: 4,
                    ),
                  ),
                  const SizedBox(width: NutriMaeTokens.space8),
                  FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                    label: const Text('Enviar'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({
    required this.message,
    required this.isUser,
    this.highlight = false,
  });

  final String message;
  final bool isUser;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final alignment = isUser ? Alignment.centerRight : Alignment.centerLeft;
    final color = highlight
        ? NutriMaeTokens.secondary.withOpacity(0.2)
        : isUser
            ? NutriMaeTokens.primary
            : Theme.of(context).colorScheme.surfaceVariant;
    final textColor = isUser ? Colors.white : Theme.of(context).textTheme.bodyLarge?.color;

    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: NutriMaeTokens.space8),
        padding: const EdgeInsets.all(NutriMaeTokens.space16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(NutriMaeTokens.radiusLg),
            topRight: const Radius.circular(NutriMaeTokens.radiusLg),
            bottomLeft: Radius.circular(isUser ? NutriMaeTokens.radiusLg : NutriMaeTokens.radiusXs),
            bottomRight: Radius.circular(isUser ? NutriMaeTokens.radiusXs : NutriMaeTokens.radiusLg),
          ),
        ),
        child: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: textColor, fontWeight: highlight ? FontWeight.w600 : FontWeight.w400),
        ),
      ),
    );
  }
}
