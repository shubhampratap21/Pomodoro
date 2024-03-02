// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => __loginState();
}

// ignore: camel_case_types
class __loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
        titleTextStyle: const TextStyle(
          fontSize: 30,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      // body: const Center(
      //   child:ElevatedButton(
      //     onPressed: login(),
      //     child: Text("Login"),
      //   )
      // ),
    );
  }
}
