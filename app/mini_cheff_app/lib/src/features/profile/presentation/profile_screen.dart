import 'package:flutter/material.dart';
import 'package:mini_cheff/src/core/theme/design_tokens.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil da criança'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(NutriMaeTokens.space16),
        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.child_friendly)),
              title: const Text('Sofia, 5 anos'),
              subtitle: const Text('Peso 18kg · Restrição: sem lactose'),
              trailing: TextButton(onPressed: () {}, child: const Text('Editar')),
            ),
          ),
          const SizedBox(height: NutriMaeTokens.space16),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text('Objetivo', style: Theme.of(context).textTheme.titleLarge),
                  subtitle: const Text('Ampliar variedade e reforçar ferro'),
                ),
                const Divider(),
                SwitchListTile(
                  title: const Text('Modo infantil ativo'),
                  subtitle: const Text('Interface lúdica e missões divertidas'),
                  value: true,
                  onChanged: (_) {},
                ),
                const Divider(),
                ListTile(
                  title: const Text('Preferências'),
                  subtitle: const Text('Ama: morango, brócolis · Recusa: beterraba'),
                  trailing: TextButton(onPressed: () {}, child: const Text('Atualizar')), 
                ),
              ],
            ),
          ),
          const SizedBox(height: NutriMaeTokens.space16),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Acompanhamento de crescimento', style: Theme.of(context).textTheme.titleLarge),
                  subtitle: const Text('Percentil altura 60 · peso 55'),
                ),
                ListTile(
                  title: const Text('Consultas registradas'),
                  subtitle: const Text('Próxima: 12/08 com pediatra'),
                  trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.calendar_month)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
