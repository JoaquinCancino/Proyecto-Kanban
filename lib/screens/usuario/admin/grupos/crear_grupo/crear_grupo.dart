import 'package:flutter/material.dart';
import 'package:kp_express_final/screens/usuario/admin/grupos/crear_grupo/widgets/form_crear_grupo.dart';

class CrearGrupo extends StatefulWidget {
  const CrearGrupo({Key? key}) : super(key: key);

  @override
  State<CrearGrupo> createState() => _CrearGrupoState();
}
      
class _CrearGrupoState extends State<CrearGrupo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text(
          'Crear Grupo',
          style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 49, 1, 112),
      ),


      body: form_crear_grupo(),
    );
  }
}
