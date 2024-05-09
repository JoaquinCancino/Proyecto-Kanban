import 'package:flutter/material.dart';
import 'package:kp_express_final/screens/usuario/register/widgets/form_register.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        appBar: AppBar(
        title: const Text('KP-EXPRESS',
        style:TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:const Color.fromARGB(255, 49, 1, 112),
    
      ),

      body: form_register()
    );

  }

}

