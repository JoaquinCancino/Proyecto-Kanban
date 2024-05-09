import 'package:flutter/material.dart';
import 'package:kp_express_final/screens/usuario/admin/cajas/crear_cajas/widget/form_crear_cajas.dart';

class CrearCaja extends StatefulWidget {
  const CrearCaja({Key? key}) : super(key: key);

  @override
  State<CrearCaja> createState() => _CrearCajaState();
}

class _CrearCajaState extends State<CrearCaja> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crear Caja',
          style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 49, 1, 112),
      ),

      body: form_crear_cajas(),
    );
  }
}
