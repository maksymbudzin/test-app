import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    usernameController.addListener(updateButtonState);
    passwordController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = usernameController.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Hero(
                  tag: 'logo',
                  child: SvgPicture.asset(
                    'assets/olearis_logo.svg',
                    width: 375,
                  ),
                ),
              ),
              LoginForm(
                usernameController: usernameController,
                passwordController: passwordController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ContinueButton(
        isButtonEnabled: isButtonEnabled,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginForm({
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  final bool isButtonEnabled;
  final VoidCallback onTap;

  const ContinueButton({
    required this.isButtonEnabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 18),
      child: ElevatedButton(
        onPressed: isButtonEnabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          primary: isButtonEnabled ? Colors.blue : Colors.grey,
        ),
        child: const Text('Continue'),
      ),
    );
  }
}
