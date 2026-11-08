
import 'package:flutter/material.dart';
import 'perfil_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Cores que utilizaremos nesta tela.
  static const Color _dourado = Color(0xFFD9AB62);
  static const Color _fundo = Color(0xFF171717);
  static const Color _cartao = Color(0xFF292929);

  // Exibe uma mensagem para funções ainda não implementadas.
  void _avisar(BuildContext context, String funcionalidade) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$funcionalidade será implementado em breve.'),
      ),
    );
  }


  void _abrirPerfil(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PerfilScreen(),
      ),
    );
  }


  // Cria um botão de acesso rápido.
  Widget _acessoRapido(
      BuildContext context,
      IconData icone,
      String titulo,
      ) {
    return Expanded(
      child: InkWell(
        onTap: () => _avisar(context, titulo),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 92,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _cartao,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icone, color: _dourado, size: 27),
              const SizedBox(height: 8),
              Text(
                titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Cria um cartão com o nome e preço de um serviço.
  Widget _cardServico(
      String nome,
      String preco,
      IconData icone,
      ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _cartao,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icone, color: _dourado, size: 36),
            const SizedBox(height: 12),
            Text(
              nome,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              preco,
              style: const TextStyle(
                color: _dourado,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Cria um cartão para representar um barbeiro.
  Widget _cardBarbeiro(
      BuildContext context,
      String nome,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _cartao,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundColor: Color(0xFF3A3023),
            child: Icon(
              Icons.person,
              color: _dourado,
              size: 30,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nome,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Barbeiro profissional',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            tooltip: 'Contato pelo WhatsApp',
            icon: const Icon(
              Icons.chat_outlined,
              color: Colors.greenAccent,
            ),
            onPressed: () {
              _avisar(context, 'WhatsApp do $nome');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _fundo,

      appBar: AppBar(
        backgroundColor: _fundo,
        title: const Row(
          children: [
            Icon(Icons.content_cut, color: _dourado),
            SizedBox(width: 10),
            Text(
              'BARBER SHOP',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              color: _dourado,
            ),
            onPressed: () {
              _abrirPerfil(context);
            },
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // SAUDAÇÃO
              const Text(
                'Olá, cliente! 👋',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Pronto para renovar o visual?',
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 24),

              // BANNER DE AGENDAMENTO
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF49351F),
                      Color(0xFF26211B),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Seu próximo corte começa aqui.',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Escolha seu barbeiro e reserve seu horário.',
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton.icon(
                      onPressed: () {
                        _avisar(context, 'Agendamento');
                      },
                      icon: const Icon(Icons.calendar_month),
                      label: const Text('AGENDAR HORÁRIO'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _dourado,
                        foregroundColor: _fundo,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ACESSO RÁPIDO
              const Text(
                'Acesso rápido',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              Row(
                children: [
                  _acessoRapido(
                    context,
                    Icons.content_cut,
                    'Serviços',
                  ),
                  const SizedBox(width: 10),
                  _acessoRapido(
                    context,
                    Icons.calendar_today,
                    'Reservas',
                  ),
                  const SizedBox(width: 10),
                  _acessoRapido(
                    context,
                    Icons.location_on_outlined,
                    'Localização',
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // SERVIÇOS EM DESTAQUE
              const Text(
                'Nossos serviços',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              Row(
                children: [
                  _cardServico(
                    'Corte Masculino',
                    'R\$ 35,00',
                    Icons.content_cut,
                  ),
                  const SizedBox(width: 12),
                  _cardServico(
                    'Barba',
                    'R\$ 25,00',
                    Icons.face,
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // BARBEIROS
              const Text(
                'Nossos barbeiros',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              _cardBarbeiro(context, 'Carlos Silva'),
              _cardBarbeiro(context, 'Pedro Santos'),
              _cardBarbeiro(context, 'Lucas Oliveira'),
            ],
          ),
        ),
      ),

      // MENU INFERIOR
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF222222),
        indicatorColor: _dourado,
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 3) {
            _abrirPerfil(context);
          } else if (index != 0) {
            _avisar(context, 'Esta seção ainda será implementada.');
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
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
