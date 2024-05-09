import 'package:flutter/material.dart';
import 'package:kp_express_final/screens/usuario/forgot_pass/widgets/verify_cod.dart';

// ignore: camel_case_types
class CODForgot_Password extends StatefulWidget {
  const CODForgot_Password({super.key});

  @override
  State<CODForgot_Password> createState() => _CODForgot_PasswordState();
}

// ignore: camel_case_types
class _CODForgot_PasswordState extends State<CODForgot_Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        appBar: AppBar(
        title: const Text('KP-EXPRESS',
        style:TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:const Color.fromARGB(255, 49, 1, 112),
    
      ),

      body: const verify_cod()
);
}

}
