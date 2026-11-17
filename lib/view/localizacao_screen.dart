
import 'package:flutter/material.dart';
import '../service/mapa_service.dart';

class LocalizacaoScreen extends StatelessWidget {
  const LocalizacaoScreen({super.key});

  static const Color _dourado = Color(0xFFD9AB62);
  static const Color _fundo = Color(0xFF171717);
  static const Color _cartao = Color(0xFF292929);

  // Preencha com o endereço da barbearia.
  static const String _endereco =
      'Rua da Barbearia, 100, Centro, Cidade - ES';

  // Horários fictícios para o protótipo.
  static const String _segundaSexta = '09h às 18h';
  static const String _sabado = '09h às 14h';
  static const String _domingo = 'Fechado';

  // Exibe uma mensagem na tela.
  void _mostrarAviso(BuildContext context, String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(texto)),
    );
  }

  // Abre a rota utilizando o MapaService.
  Future<void> _abrirRota(BuildContext context) async {

    if (_endereco.trim().isEmpty) {
      _mostrarAviso(
        context,
        'Cadastre o endereço da barbearia primeiro.',
      );
      return;
    }

    try {
      final abriu = await MapaService.abrirRota(_endereco);

      if (!abriu && context.mounted) {
        _mostrarAviso(
          context,
          'Não foi possível abrir o Google Maps.',
        );
      }
    } catch (erro) {
      if (context.mounted) {
        _mostrarAviso(
          context,
          'Ocorreu um erro ao abrir o mapa.',
        );
      }
    }
  }

  // Componente reutilizável para os horários.
  Widget _linhaHorario(String dia, String horario) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              dia,
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
          Text(
            horario,
            style: const TextStyle(
              color: _dourado,
              fontWeight: FontWeight.bold,
            ),
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
        title: const Text('Nossa Localização'),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              const Text(
                'Venha nos visitar! 📍',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Estamos esperando por você.',
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 24),

              // FOTO ILUSTRATIVA DA BARBEARIA
              Container(
                height: 170,
                decoration: BoxDecoration(
                  color: _cartao,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.storefront,
                      size: 65,
                      color: _dourado,
                    ),
                    SizedBox(height: 10),
                    Text('Foto da Barbearia'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // INFORMAÇÕES DO ENDEREÇO
              Card(
                color: _cartao,
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: _dourado,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'JESSE BARBEARIA',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      Text(
                        _endereco.isEmpty
                            ? 'Endereço ainda não cadastrado'
                            : _endereco,
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // LOCALIZAÇÃO E BOTÃO COMO CHEGAR
              Card(
                color: _cartao,
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      const Row(
                        children: [
                          Icon(
                            Icons.map_outlined,
                            color: _dourado,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Onde estamos',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Espaço reservado para um mapa.
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xFF353535),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.map,
                              size: 50,
                              color: _dourado,
                            ),
                            SizedBox(height: 8),
                            Text('Mapa da Barbearia'),
                            Text(
                              'Prévia ilustrativa',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      ElevatedButton.icon(
                        onPressed: () => _abrirRota(context),
                        icon: const Icon(Icons.navigation),
                        label: const Text('COMO CHEGAR'),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: _dourado,
                          foregroundColor: _fundo,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // HORÁRIO DE FUNCIONAMENTO
              Card(
                color: _cartao,
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: _dourado,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Horário de Funcionamento',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      _linhaHorario(
                        'Segunda a sexta',
                        _segundaSexta,
                      ),

                      const Divider(),

                      _linhaHorario(
                        'Sábado',
                        _sabado,
                      ),

                      const Divider(),

                      _linhaHorario(
                        'Domingo',
                        _domingo,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
