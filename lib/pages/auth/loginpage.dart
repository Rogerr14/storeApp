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
            child: _formView(
                emailController: txtCorreo, passwordController: txtPassword),
          ),
        ),
      ),
    );
  }

  Widget _formView(
      {required TextEditingController emailController,
      required TextEditingController passwordController}) {
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
          controller: emailController,
        ),
        const SizedBox(
          height: 20,
        ),
        customTextForm('Constraseña', isPassword,
            isPassword: true, controller: passwordController),
        const SizedBox(
          height: 20,
        ),
        _loginButton(),
      ],
    );
  }

  Widget customTextForm(String hint, String? Function(String?) validator,
      {required TextEditingController controller, bool isPassword = false}) {
        final focusNode = FocusNode();
    return SizedBox(
      width: 300,
      height: 75,
      child: TextFormField(
        focusNode: focusNode,
        onTapOutside: (event) => focusNode.unfocus(),
        obscureText: isPassword,
        controller: controller,
        validator: validator,
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

  _loginButton() {
    
    String correo = 'user01@gmail.com';
    String password = 'prueba01';

    return OutlinedButton(
      onPressed: () {
        if (_scaffoldKey.currentState!.validate()) {
          
          if (txtCorreo.text == correo && txtPassword.text == password) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/homePage', (route) => false);
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
