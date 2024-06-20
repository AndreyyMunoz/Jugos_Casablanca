import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jugos_casablanca/pages/bottomnav.dart';
import 'package:jugos_casablanca/pages/forgotpassword.dart';
import 'package:jugos_casablanca/pages/signup.dart';
import 'package:jugos_casablanca/service/database_service.dart';
import 'package:jugos_casablanca/service/shared_pref.dart';
import 'package:jugos_casablanca/widget/widget_support.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  String email = "", password = "";

  // TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // TextEditingController idController = TextEditingController();
  // TextEditingController walletController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _userLogin() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        await DatabaseService().getUserDataAndSaveToPrefs(_emailController.text);
        // await SharedPreferenceHelper().saveUserName(name);
        await SharedPreferenceHelper().saveUserEmail(_emailController.text);
        // await SharedPreferenceHelper().saveUserWallet(wallet);
        // await SharedPreferenceHelper().saveUserId(id);
        ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
          backgroundColor: Color.fromARGB(255, 81, 212, 74),
          content: Text(
            "Inicio de Sesión Exitoso",
            style: TextStyle(fontSize: 18.0),
          ),
        )));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNav()),
        );
      } on FirebaseAuthException catch (e) {
        String message = 'Error desconocido';
        if (e.code == 'user-not-found') {
          message = "No se encontró ningún usuario relacionado a esta cuenta";
        } else if (e.code == 'wrong-password') {
          message = "Contraseña incorrecta";
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message, style: const TextStyle(fontSize: 18.0)),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 48, 255, 210),
                  Color.fromARGB(255, 74, 26, 231),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: MediaQuery.of(context).size.width / 1.5,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 50.0),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 30.0),
                          Text("Inicio de Sesión", style: AppWidget.headlineTextFeildStyle()),
                          const SizedBox(height: 30.0),
                          TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor introduzca su correo electronico.';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: AppWidget.semiBoldTextFeildStyle(),
                              prefixIcon: const Icon(Icons.email_outlined),
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          TextFormField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor introduzca una contraseña.';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Contraseña',
                              hintStyle: AppWidget.semiBoldTextFeildStyle(),
                              prefixIcon: const Icon(Icons.password_outlined),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgotPassword(),
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                "¿Olvidaste tu contraseña?",
                                style: AppWidget.blueTextFeildStyle(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 80.0),
                          GestureDetector(
                            onTap: _userLogin,
                            child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                width: 200,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 34, 71, 255),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text(
                                    "ACCEDER",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontFamily: 'Poppins1',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 70.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿Aún no tienes una cuenta? ",
                        style: AppWidget.semiBoldTextFeildStyle(),
                      ),
                      Text(
                        "Registrate",
                        style: AppWidget.blueTextFeildStyle(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
