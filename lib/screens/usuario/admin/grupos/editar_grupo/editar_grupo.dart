import 'package:flutter/material.dart';
import 'package:kp_express_final/screens/usuario/admin/grupos/editar_grupo/widgets/form_editar_grupo.dart';


class EditarGrupo extends StatefulWidget {
  const EditarGrupo({Key? key}) : super(key: key);

  @override
  State<EditarGrupo> createState() => _EditarGrupoState();
}

class _EditarGrupoState extends State<EditarGrupo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text(
          'Editar Grupo',
          style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 49, 1, 112),
      ),

      body: form_editar_grupo(),
    );
  }
}
