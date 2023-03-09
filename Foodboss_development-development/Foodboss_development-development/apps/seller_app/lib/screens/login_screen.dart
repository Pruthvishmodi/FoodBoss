import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Text('Welcome Back'),
              const Text('Please enter your account details here.'),
              const SizedBox(height: 50.00,),
              TextFormField(decoration: const InputDecoration(labelText: 'Email',icon: Icon(Icons.email)),),
              const SizedBox(height: 50.00,),
              TextFormField(decoration: const InputDecoration(labelText: 'Email',icon: Icon(Icons.email)),),
              const SizedBox(height: 50.00,),
              Expanded(child: TextButton(onPressed: (){}, child: const Text('Login')))
            ],
          ),
        ));
  }
}
