import 'package:flutter/material.dart';
import 'package:pet_adoption/theme/color.dart';
import 'package:pet_adoption/widgets/rounded_button_widget.dart';
import 'package:pet_adoption/widgets/textformfield_widget.dart';
import 'package:validators/validators.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> regForm = {};
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? _confirmPasswordError;
  String? _confirmPasswordStatus;
  String? _passwordError;
  String? _passwordErrorStatus;
  Color _passwordStatusColor = AppColor.red;
  Color _confirmPasswordStatusColor = AppColor.red;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validatePasswordLive);
    _passwordController.addListener(_validateConfirmPasswordLive);
    _confirmPasswordController.addListener(_validateConfirmPasswordLive);
  }

  void _validateConfirmPasswordLive() {
    final confirm = _confirmPasswordController.text;
    final password = _passwordController.text;

    setState(() {
      if (confirm.isEmpty) {
        _confirmPasswordStatus = null;
      } else if (confirm == password) {
        _confirmPasswordStatus = 'Password match';
        _confirmPasswordStatusColor = Colors.green;
      } else {
        _confirmPasswordStatus = 'Password do not match';
        _confirmPasswordStatusColor = AppColor.red;
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validatePasswordLive() {
    final value = _passwordController.text;
    setState(() {
      if (value.isEmpty) {
        _passwordError = 'Please enter your password';
        _passwordStatusColor = Colors.red;
      } else if (value.length < 8) {
        _passwordError = 'Password must be at least 8 characters long';
        _passwordStatusColor = Colors.red;
      } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
        _passwordError = 'Password must contain at least one uppercase letter';
        _passwordStatusColor = Colors.red;
      } else if (!RegExp(r'\d').hasMatch(value)) {
        _passwordError = 'Password must contain at least one number';
        _passwordStatusColor = Colors.red;
      } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
        _passwordError = 'Password must contain at least one special character';
        _passwordStatusColor = Colors.red;
      } else {
        _passwordError = 'Password looks good!';
        _passwordStatusColor = Colors.green;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
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
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Join the Paw-ty!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const Text(
                      'Create an account and start your adoption journey!',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.labelColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormFieldWidget(
                      controller: _nameController,
                      labelText: 'Full name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormFieldWidget(
                      controller: _emailController,
                      labelText: 'Email',
                      validator: (value) => !isEmail(value!)
                          ? "Please enter a valid email"
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormFieldWidget(
                      controller: _passwordController,
                      obscureText: true,
                      labelText: 'Password',
                      validator: (_) => _passwordError,
                      onSaved: (value) => regForm['password'] = value,
                    ),
                    const SizedBox(height: 4),
                    if (_passwordError != null)
                      Text(
                        _passwordError!,
                        style: TextStyle(
                          color: _passwordStatusColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    const SizedBox(height: 16),
                    TextFormFieldWidget(
                      controller: _confirmPasswordController,
                      labelText: 'Confirm Password',
                      obscureText: true,
                      validator: (_) => _confirmPasswordError,
                      onSaved: (value) => regForm['_confirmPassword'] = value,
                    ),
                    const SizedBox(height: 4),
                    if (_confirmPasswordStatus != null)
                      Text(
                        _confirmPasswordStatus!,
                        style: TextStyle(
                          color: _confirmPasswordStatusColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: RoundedButtonWidget(
                        label: 'Register',
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        backgroundColor: AppColor.red,
                        textColor: AppColor.textBoxColor,
                        useFullWidth: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
