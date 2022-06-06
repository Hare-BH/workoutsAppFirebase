import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:training_app/constants.dart';
import 'package:training_app/widgets/auth_input_field.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _emailController = TextEditingController();

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
                content: Text('Reset link sent\nCheck your email!'));
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(content: Text(e.message.toString()));
          });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 150,
            height: 120,
            child: Image.asset('images/wrkapplogo.png', fit: BoxFit.contain),
          ),
          const SizedBox(height: 10),
          const Text(
            'Please enter your email',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Raleway',
              color: kMainColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          AuthInputField(
            controller: _emailController,
            hintText: 'Email',
          ),

          const SizedBox(height: 20),

          ///button
          GestureDetector(
            onTap: resetPassword,
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
                  'Reset Password',
                  style: TextStyle(
                    color: kWhiteBackground,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: kWhiteBackground,
        child: const FaIcon(
          FontAwesomeIcons.angleLeft,
          size: 40.0,
          color: kMainColor,
        ),
      ),
    );
  }
}
