// aqui el usuario escogera si es admin o cliente
import 'package:flutter/material.dart';
import 'package:kp_express_final/screens/usuario/admin/cajas/widgets/boton_cajas.dart';

// ignore: camel_case_types
class Cajas extends StatefulWidget {
  const Cajas({super.key});

  @override
  State<Cajas> createState() => _CajasState();
}

// ignore: camel_case_types
class _CajasState extends State<Cajas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        appBar: AppBar(
        title: const Text('Caja 16',
        style:TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:const Color.fromARGB(255, 49, 1, 112),
    
      ),

      body: button_cajas()
);
}

}
