import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helper/app_navigation/app_navigation.dart';
import 'package:spotify_clone/common/helper/message/display_message.dart';
import 'package:spotify_clone/data/auth/models/signin_req_params.dart';
import 'package:spotify_clone/domain/auth/usecases/signin.dart';
import 'package:spotify_clone/presentation/auth/pages/signup.dart';
import 'package:spotify_clone/presentation/home/pages/home.dart';
import 'package:spotify_clone/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                // Title
                const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),
                const Text(
                  "Welcome back, please login to continue",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 32),

                // Email Field
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "example@email.com",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!value.contains("@")) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Password Field
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Sign In Button
                ReactiveButton(
                  title: "Sign In",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      return await sl<SigninUseCase>().call(
                        SigninReqParams(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        ),
                      );
                    }
                  },
                  onSuccess: () {
                    AppNavigation.pushAndRemove(context, HomePage());
                  },
                  onFailure: (error) => DisplayMessage.errorMessage(
                    context: context,
                    message: error,
                  ),
                ),

                const Spacer(),

                // Sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        AppNavigation.push(context, SignupPage());
                      },
                      child: const Text("Sign Up"),
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
