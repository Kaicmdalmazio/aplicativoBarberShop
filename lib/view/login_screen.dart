
import 'package:flutter/material.dart';
import 'cadastro_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Chave utilizada para validar o formulário.
  final _formKey = GlobalKey<FormState>();

  // Controladores dos campos.
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  bool _mostrarSenha = false;



  // Método executado ao pressionar Entrar.
  void _entrar() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),

            child: Form(
              key: _formKey,

              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  const Icon(
                    Icons.content_cut,
                    size: 70,
                    color: Color(0xFFD9AB62),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'BARBER SHOP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Seu estilo começa aqui.',
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),

                  // CAMPO E-MAIL
                  const Text('E-mail'),
                  const SizedBox(height: 8),

                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,

                    decoration: InputDecoration(
                      hintText: 'Digite seu e-mail',
                      prefixIcon: const Icon(Icons.email_outlined),
                      filled: true,
                      fillColor: const Color(0xFF292929),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),

                    validator: (valor) {
                      if (valor == null || valor.trim().isEmpty) {
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

                  // CAMPO SENHA
                  const Text('Senha'),
                  const SizedBox(height: 8),

                  TextFormField(
                    controller: _senhaController,
                    obscureText: !_mostrarSenha,

                    decoration: InputDecoration(
                      hintText: 'Digite sua senha',
                      prefixIcon: const Icon(Icons.lock_outline),
                      filled: true,
                      fillColor: const Color(0xFF292929),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),

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
                      if (valor == null || valor.isEmpty) {
                        return 'Informe sua senha';
                      }

                      if (valor.length < 8) {
                        return 'A senha deve ter no mínimo 8 caracteres';
                      }

                      return null;
                    },
                  ),

                  // ESQUECEU A SENHA
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Recuperação de senha será implementada.',
                            ),
                          ),
                        );
                      },
                      child: const Text('Esqueceu a senha?'),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // BOTÃO ENTRAR
                  ElevatedButton(
                    onPressed: _entrar,



                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD9AB62),
                      foregroundColor: const Color(0xFF171717),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                    ),

                    child: const Text('ENTRAR'),
                  ),

                  const SizedBox(height: 20),

                  // BOTÃO CADASTRAR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Não tem uma conta?'),


                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CadastroScreen(),
                            ),
                          );
                        },
                        child: const Text('Cadastre-se'),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
