
import 'package:flutter/material.dart';
import 'package:kp_express_final/screens/usuario/admin/widgets/buttons_home.dart';

// ignore: camel_case_types
class Admin_Home extends StatefulWidget {
  const Admin_Home({super.key});

  @override
  State<Admin_Home> createState() => _Admin_HomeState();
}

// ignore: camel_case_types
class _Admin_HomeState extends State<Admin_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        appBar: AppBar(
        title: const Text('Administrador',
        style:TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:const Color.fromARGB(255, 49, 1, 112),
    
      ),

      body: buttonsHome()
);
}

  }
