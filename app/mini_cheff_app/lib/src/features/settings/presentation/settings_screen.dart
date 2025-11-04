import 'package:flutter/material.dart';
import 'package:mini_cheff/src/core/theme/design_tokens.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(NutriMaeTokens.space16),
        children: [
          SwitchListTile(
            title: const Text('Processar imagens apenas no dispositivo'),
            subtitle: const Text('Maior privacidade, pode reduzir velocidade'),
            value: false,
            onChanged: (_) {},
          ),
          SwitchListTile(
            title: const Text('Notificações de lembretes'),
            value: true,
            onChanged: (_) {},
          ),
          ListTile(
            title: const Text('Idioma'),
            subtitle: const Text('Português (Brasil)'),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            title: const Text('Plano atual'),
            subtitle: const Text('Premium · R$19,90/mês'),
            trailing: TextButton(onPressed: () {}, child: const Text('Gerenciar')),
          ),
          ListTile(
            title: const Text('Privacidade e consentimentos'),
            subtitle: const Text('Gerencie dados da criança e exclusão'),
            trailing: const Icon(Icons.shield_outlined),
          ),
          ListTile(
            title: const Text('Ajuda e suporte'),
            trailing: const Icon(Icons.support_agent),
          ),
          ListTile(
            title: const Text('Sair'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
