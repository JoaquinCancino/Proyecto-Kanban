import 'package:flutter/material.dart';
import 'package:kp_express_final/screens/usuario/forgot_pass/widgets/form_forgot_pass.dart';

// ignore: camel_case_types
class Forgot_Password extends StatefulWidget {
  const Forgot_Password({super.key});

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}

// ignore: camel_case_types
class _Forgot_PasswordState extends State<Forgot_Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        appBar: AppBar(
        title: const Text('KP-EXPRESS',
        style:TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:const Color.fromARGB(255, 49, 1, 112),
    
      ),

      body: const form_forgot_pass()
);
}

}
