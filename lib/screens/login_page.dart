import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:training_app/constants.dart';
import 'package:flutter/services.dart';
import 'package:training_app/screens/reset_password_page.dart';
import 'package:training_app/widgets/auth_input_field.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ///controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                kWhiteBackground,
                const Color(0xffE5E5E5),
              ]),
        ),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 120,
                  child:
                      Image.asset('images/wrkapplogo.png', fit: BoxFit.contain),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome back!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    color: kMainColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please Sign In',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    color: kMainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                ///
                ///Email TextField
                AuthInputField(
                  controller: _emailController,
                  hintText: 'Email',
                ),

                ///
                ///Password TextField
                AuthInputField(
                  controller: _passwordController,
                  hintText: 'Password',
                  hide: true,
                ),

                ///forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ResetPasswordPage();
                      }));
                    },
                    child: const Text(
                      'Forgot password',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.blueAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                ///
                ///Login button
                GestureDetector(
                  onTap: signIn,
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(
                        left: 15, right: 15, top: 0, bottom: 30),
                    decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffDCDCDC),
                            offset: Offset(1, 3),
                            blurRadius: 2,
                            spreadRadius: 2,
                          ),
                        ]),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: kWhiteBackground,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member? ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Color(0xff666666),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: const Text(
                        'Register now',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.blueAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
