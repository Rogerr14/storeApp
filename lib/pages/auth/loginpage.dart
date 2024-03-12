import 'package:flutter/material.dart';

import 'package:store_app/validators/validator_login.dart';

class LoginPage extends StatefulWidget {
  static String name = 'loginScreen';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<FormState>();
  final txtCorreo = TextEditingController();
  final txtPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    txtCorreo.dispose();
    txtPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _scaffoldKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: _formView(emailController: txtCorreo, passwordController: txtPassword),
          ),
        ),
      ),
    );
  }

  Widget _formView({required TextEditingController emailController,required TextEditingController passwordController }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '-Iniciar Sesion-',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 50,
        ),
        customTextForm(
          'Correo',
          isEmail,
          controller: txtCorreo,
        ),
        const SizedBox(
          height: 20,
        ),
        customTextForm('Constraseña', isPassword,
            isPassword: true, controller: txtPassword),
        const SizedBox(
          height: 20,
        ),
        _loginButton(email: txtCorreo.text, psw: txtPassword.text),
      ],
    );
  }

  Widget customTextForm(String hint, String? Function(String?) validator,
      {required TextEditingController controller, bool isPassword = false}) {
    return SizedBox(
      width: 300,
      height: 75,
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: hint,
        ),
      ),
    );
  }

  _loginButton({required String email, required String psw}) {
    String correo = 'user01@gmail.com';
    String password = 'prueba01';

    return OutlinedButton(
      onPressed: () {
        if (_scaffoldKey.currentState!.validate()) {
          print('si aqui');
          print(email);
          if (email.trim() == correo && psw.trim() == password) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/homePage', (route) => false);
          } else {
            print('no sale');
          }
        }
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.black,
      ),
      child: const Text(
        'Ingresar',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
