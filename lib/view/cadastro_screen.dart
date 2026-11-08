
import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {

  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();

  bool _mostrarSenha = false;
  bool _mostrarConfirmacao = false;

  static const _dourado = Color(0xFFD9AB62);

  // Configuração visual reutilizada nos campos.
  InputDecoration _decoracao(
      String dica,
      IconData icone, {
        Widget? suffixIcon,
      }) {
    return InputDecoration(
      hintText: dica,
      prefixIcon: Icon(icone),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: const Color(0xFF292929),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  // Valida os dados antes de simular o cadastro.
  void _cadastrar() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Formulário válido! Cadastro ainda não conectado ao banco.',
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _telefoneController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
        backgroundColor: const Color(0xFF171717),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                const Icon(
                  Icons.person_add_alt_1,
                  size: 70,
                  color: _dourado,
                ),

                const SizedBox(height: 16),

                const Text(
                  'Cadastre-se para agendar seu corte',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 32),

                // NOME
                const Text('Nome completo'),
                const SizedBox(height: 8),

                TextFormField(
                  controller: _nomeController,
                  textCapitalization: TextCapitalization.words,
                  decoration: _decoracao(
                    'Digite seu nome',
                    Icons.person_outline,
                  ),
                  validator: (valor) {
                    if (valor == null ||
                        valor.trim().length < 3) {
                      return 'Informe seu nome completo';
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
                    'exemplo@email.com',
                    Icons.email_outlined,
                  ),
                  validator: (valor) {
                    if (valor == null ||
                        valor.trim().isEmpty) {
                      return 'Informe seu e-mail';
                    }

                    final emailValido = RegExp(
                      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                    ).hasMatch(valor.trim());

                    if (!emailValido) {
                      return 'Digite um e-mail válido';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // SENHA
                const Text('Senha'),
                const SizedBox(height: 8),

                TextFormField(
                  controller: _senhaController,
                  obscureText: !_mostrarSenha,
                  decoration: _decoracao(
                    'Mínimo de 8 caracteres',
                    Icons.lock_outline,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _mostrarSenha
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _mostrarSenha = !_mostrarSenha;
                        });
                      },
                    ),
                  ),
                  validator: (valor) {
                    if (valor == null || valor.length < 8) {
                      return 'A senha deve ter no mínimo 8 caracteres';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // CONFIRMAR SENHA
                const Text('Confirmar senha'),
                const SizedBox(height: 8),

                TextFormField(
                  controller: _confirmarSenhaController,
                  obscureText: !_mostrarConfirmacao,
                  decoration: _decoracao(
                    'Digite novamente sua senha',
                    Icons.lock_outline,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _mostrarConfirmacao
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _mostrarConfirmacao =
                          !_mostrarConfirmacao;
                        });
                      },
                    ),
                  ),
                  validator: (valor) {
                    if (valor != _senhaController.text) {
                      return 'As senhas não coincidem';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 32),

                // BOTÃO CADASTRAR
                ElevatedButton(
                  onPressed: _cadastrar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _dourado,
                    foregroundColor: const Color(0xFF171717),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                  ),
                  child: const Text('CRIAR CONTA'),
                ),

                const SizedBox(height: 12),

                // VOLTAR AO LOGIN
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Já tenho conta'),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
