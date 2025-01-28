import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("TEXTFORMFIELD"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(children: [
          const SizedBox(height: 20),
          Text(
            "FORM",
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: _userNameController,
            decoration: InputDecoration(
              hintText: "Enter Username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: Icon(Icons.person),
            ),
            validator: (value) {
              print("In username validator");

              if (value == null || value.isEmpty) {
                return "Please Enter Username";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: Icon(Icons.lock),
              hintText: "Enter Password",
              suffixIcon: Icon(Icons.remove_red_eye_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Password";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
              
                  bool loginValidated = _formKey.currentState!.validate();

                if (loginValidated) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("LogIn Successful"),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("LogIn Failed"),
                    ),
                  );
                }
              },
              child: Text("LogIn"))
        ]),
      ),
    );
  }
}
