import 'package:finalmp/account/snack_bar.dart';
import 'package:finalmp/home_page.dart';
import 'package:flutter/material.dart';

import '../textfield_input.dart';
import 'auth.dart';
import 'login_page.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    addressController.dispose();
  }

  void signupUser() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }

    String res = await AuthMethod().signupUser(
      email: emailController.text,
      password: passwordController.text,
      address: addressController.text,
      name: nameController.text,
    );

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }

    if (res == "success" && mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (res != "success" && mounted) {
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 4.3),
              TextFieldInput(
                textEditingController: nameController,
                hintText: 'Enter your name',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 24),
              TextFieldInput(
                textEditingController: emailController,
                hintText: 'Enter your email',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 24),
              TextFieldInput(
                textEditingController: passwordController,
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 24),
              TextFieldInput(
                textEditingController: addressController,
                hintText: 'Enter your address',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: signupUser,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      color: Colors.blue,
                    ),
                    child: const Text("Sign up"),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
