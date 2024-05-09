// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:kp_express_final/screens/usuario/login/widgets/button_login.dart';
import 'package:kp_express_final/screens/usuario/login/widgets/form_login.dart';

class Login extends StatelessWidget {
  const Login({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('KP-EXPRESS',

        style:TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),

        centerTitle: true,

        backgroundColor:const Color.fromARGB(255, 49, 1, 112)

      ),

      body : Column(

        children: [

          form_login(),

          button_login()

        ],
      ),
    );
  }
}
