import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});
  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final validator = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "EXCESS",
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Text(
                "Welcome to ERC",
                style: TextStyle(
                  fontSize: 25,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Form(
                  key: validator,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Email";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 14, 194, 53),
                          hintText: "Enter your Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Password";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 31, 136, 206),
                            hintText: "Enter your password",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.amberAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (validator.currentState!.validate()) {
                      if (emailController.text.toString() ==
                              "hippo124@gmail.com" &&
                          passwordController.text.toString() == "12345678") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          snackBarAnimationStyle: AnimationStyle(
                            duration: Duration(seconds: 1),
                          ),
                          SnackBar(
                            content: Text(
                              "You are Authenticated!",
                              style: TextStyle(color: Colors.amberAccent),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        snackBarAnimationStyle:
                        AnimationStyle(duration: Duration(seconds: 1));
                        print("You are wrong,User authentication failed");
                      }
                    }
                    print("Button Pressed");
                  },
                  icon: Icon(
                    Icons.login,
                    size: 50,
                    color: Colors.deepOrangeAccent,
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
