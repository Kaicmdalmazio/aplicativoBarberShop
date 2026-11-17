
import 'package:flutter/material.dart';

class EditarPerfilScreen extends StatefulWidget {

  // Dados recebidos da tela Meu Perfil.
  final String nome;
  final String email;
  final String telefone;

  const EditarPerfilScreen({
    super.key,
    required this.nome,
    required this.email,
    required this.telefone,
  });

  @override
  State<EditarPerfilScreen> createState() =>
      _EditarPerfilScreenState();
}

class _EditarPerfilScreenState
    extends State<EditarPerfilScreen> {

  static const Color _dourado = Color(0xFFD9AB62);
  static const Color _fundo = Color(0xFF171717);

  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nomeController;
  late final TextEditingController _emailController;
  late final TextEditingController _telefoneController;

  @override
  void initState() {
    super.initState();

    // Preenche os campos com os dados recebidos.
    _nomeController = TextEditingController(
      text: widget.nome,
    );

    _emailController = TextEditingController(
      text: widget.email,
    );

    _telefoneController = TextEditingController(
      text: widget.telefone,
    );
  }

  // Configuração visual dos campos.
  InputDecoration _decoracao(
      String dica,
      IconData icone,
      ) {
    return InputDecoration(
      hintText: dica,
      prefixIcon: Icon(icone),
      filled: true,
      fillColor: const Color(0xFF292929),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  // Valida e retorna os dados atualizados.
  void _salvar() {
    if (_formKey.currentState!.validate()) {

      Navigator.pop(context, <String, String>{
        'nome': _nomeController.text.trim(),
        'email': _emailController.text.trim(),
        'telefone': _telefoneController.text.trim(),
      });

    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _telefoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _fundo,

      appBar: AppBar(
        title: const Text('Editar Perfil'),
        backgroundColor: _fundo,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                const CircleAvatar(
                  radius: 45,
                  backgroundColor: Color(0xFF362C20),
                  child: Icon(
                    Icons.person,
                    color: _dourado,
                    size: 55,
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  'Editar informações pessoais',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 32),

                // NOME
                const Text('Nome completo'),
                const SizedBox(height: 8),

                TextFormField(
                  controller: _nomeController,
                  decoration: _decoracao(
                    'Digite seu nome',
                    Icons.person_outline,
                  ),

                  validator: (valor) {
                    if (valor == null ||
                        valor.trim().length < 3) {
                      return 'Informe um nome válido';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // TELEFONE
                const Text('Telefone'),
                const SizedBox(height: 8),

                TextFormField(
                  controller: _telefoneController,
                  keyboardType: TextInputType.phone,
                  decoration: _decoracao(
                    '(27) 99999-9999',
                    Icons.phone_outlined,
                  ),

                  validator: (valor) {
                    final numeros = (valor ?? '')
                        .replaceAll(RegExp(r'\D'), '');

                    if (numeros.length != 10 &&
                        numeros.length != 11) {
                      return 'Informe um telefone com DDD';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // E-MAIL
                const Text('E-mail'),
                const SizedBox(height: 8),

                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _decoracao(
                    'Digite seu e-mail',
                    Icons.email_outlined,
                  ),

                  validator: (valor) {
                    final emailValido = RegExp(
                      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                    ).hasMatch((valor ?? '').trim());

                    if (!emailValido) {
                      return 'Informe um e-mail válido';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 32),

                // SALVAR
                ElevatedButton.icon(
                  onPressed: _salvar,
                  icon: const Icon(Icons.save_outlined),
                  label: const Text('SALVAR ALTERAÇÕES'),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: _dourado,
                    foregroundColor: _fundo,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // CANCELAR
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('CANCELAR'),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
