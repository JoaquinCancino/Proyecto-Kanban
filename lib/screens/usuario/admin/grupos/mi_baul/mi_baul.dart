// aqui el usuario escogera si es admin o cliente
import 'package:flutter/material.dart';
import 'package:kp_express_final/screens/usuario/admin/grupos/mi_baul/widgets/baul_button.dart';

// ignore: camel_case_types
class MiBaul extends StatefulWidget {
  const MiBaul({super.key});

  @override
  State<MiBaul> createState() => _MiBaulState();
}

// ignore: camel_case_types
class _MiBaulState extends State<MiBaul> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        appBar: AppBar(
        title: const Text('Mi Baúl',
        style:TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:const Color.fromARGB(255, 49, 1, 112),
    
      ),

      body: const buttons_baul()
);
} 
}
