import 'package:flutter/material.dart';
import 'package:pet_adoption/screens/registration/registration_screen.dart';
import 'package:pet_adoption/theme/color.dart';
import 'package:pet_adoption/widgets/rounded_button_widget.dart';
import 'package:pet_adoption/widgets/textformfield_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final Map<String, dynamic> _formData = {};
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Username: ${_formData['username']}');
      print('Password: ${_formData['password']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.close_rounded,
                                  color: AppColor.red,
                                ),
                                color: Colors.black87,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          Center(
                            child: Image.asset(
                              'assets/images/LoveAPaw-Logo.png',
                              height: 300,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Text(
                          'Hey there, Paw-some Human!\n'
                          'Ready to meet your new best fur-iend?\n'
                          'Log in and let the tail-wagging adventure begin! 🐾✨',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            TextFormFieldWidget(
                              controller: _username,
                              labelText: 'Username',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _formData['username'] = value;
                              },
                            ),
                            const SizedBox(height: 5),
                            TextFormFieldWidget(
                              controller: _password,
                              labelText: 'Password',
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.length < 8) {
                                  return 'Password must be at least 8 characters';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _formData['password'] = value;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButtonWidget(
                            label: 'Log in',
                            onPressed: () {},
                            backgroundColor: Colors.white,
                            borderColor: Colors.redAccent,
                            textColor: Colors.redAccent,
                            width: 150,
                          ),
                          const SizedBox(width: 12),
                          RoundedButtonWidget(
                            label: 'Sign up',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegistrationScreen()));
                            },
                            backgroundColor: Colors.redAccent,
                            textColor: Colors.white,
                            width: 150,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
