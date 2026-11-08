
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  static const Color _dourado = Color(0xFFD9AB62);
  static const Color _fundo = Color(0xFF171717);
  static const Color _cartao = Color(0xFF292929);

  // Mensagem para funcionalidades futuras.
  void _avisar(BuildContext context, String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  // Cria um campo visual de informação pessoal.
  Widget _informacao(
      IconData icone,
      String titulo,
      String valor,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icone, color: _dourado),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(valor),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Cria uma opção clicável da conta.
  Widget _opcao(
      IconData icone,
      String titulo,
      VoidCallback aoClicar,
      ) {
    return Card(
      color: _cartao,
      child: ListTile(
        leading: Icon(icone, color: _dourado),
        title: Text(titulo),
        trailing: const Icon(Icons.chevron_right),
        onTap: aoClicar,
      ),
    );
  }

  // Solicita confirmação antes de sair.
  Future<void> _confirmarSaida(BuildContext context) async {
    final confirmou = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Sair da conta'),
          content: const Text(
            'Deseja realmente voltar para a tela de Login?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              },
              child: const Text('Cancelar'),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, true);
              },
              child: const Text('Sair'),
            ),
          ],
        );
      },
    );

    if (confirmou == true && context.mounted) {
      Navigator.of(context).popUntil(
            (route) => route.isFirst,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _fundo,

      appBar: AppBar(
        title: const Text('Meu Perfil'),
        backgroundColor: _fundo,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // FOTO E NOME DO CLIENTE
              const CircleAvatar(
                radius: 45,
                backgroundColor: Color(0xFF362C20),
                child: Icon(
                  Icons.person,
                  size: 55,
                  color: _dourado,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'João Silva',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Cliente da Barber Shop',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 30),

              // INFORMAÇÕES PESSOAIS
              Card(
                color: _cartao,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        'INFORMAÇÕES PESSOAIS',
                        style: TextStyle(
                          color: _dourado,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      _informacao(
                        Icons.person_outline,
                        'Nome',
                        'João Silva',
                      ),

                      const Divider(),

                      _informacao(
                        Icons.email_outlined,
                        'E-mail',
                        'joao@email.com',
                      ),

                      const Divider(),

                      _informacao(
                        Icons.phone_outlined,
                        'Telefone',
                        '(27) 99999-9999',
                      ),

                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // EDITAR PERFIL
              ElevatedButton.icon(
                onPressed: () {
                  _avisar(
                    context,
                    'Tela Editar Perfil será implementada.',
                  );
                },
                icon: const Icon(Icons.edit_outlined),
                label: const Text('EDITAR PERFIL'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _dourado,
                  foregroundColor: _fundo,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'MINHA CONTA',
                style: TextStyle(
                  color: _dourado,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              _opcao(
                Icons.calendar_month_outlined,
                'Meus Agendamentos',
                    () {
                  _avisar(
                    context,
                    'Meus Agendamentos será implementado.',
                  );
                },
              ),

              _opcao(
                Icons.lock_outline,
                'Alterar Senha',
                    () {
                  _avisar(
                    context,
                    'Alteração de senha será implementada.',
                  );
                },
              ),

              const SizedBox(height: 25),

              // SAIR DA CONTA
              OutlinedButton.icon(
                onPressed: () => _confirmarSaida(context),
                icon: const Icon(Icons.logout),
                label: const Text('SAIR DA CONTA'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.redAccent,
                  side: const BorderSide(
                    color: Colors.redAccent,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

      // MENU INFERIOR
      bottomNavigationBar: NavigationBar(
        selectedIndex: 3,
        backgroundColor: const Color(0xFF222222),
        indicatorColor: _dourado,

        onDestinationSelected: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index != 3) {
            _avisar(
              context,
              'Esta seção ainda será implementada.',
            );
          }
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.content_cut),
            label: 'Serviços',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Reservas',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
