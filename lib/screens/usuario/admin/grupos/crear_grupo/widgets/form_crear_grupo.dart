import 'package:flutter/material.dart';
import 'package:kp_express_final/services/firebase_service.dart';

class form_crear_grupo extends StatelessWidget {
  form_crear_grupo({
    super.key,
  });

  final nombreController = TextEditingController();
  final contrasennaController = TextEditingController();

  crearGrupo(BuildContext context, String nombre, String contrasenna) async {
    if (nombre.isEmpty || contrasenna.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Por favor complete todos los campos'),
      ));
      return;
    }

    
    if (nombre.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('El nombre del grupo debe tener al menos 4 caracteres'),
      ));
      return;
    } 

    if (contrasenna.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('La contraseña debe tener minimo 6 caracteres'),
      ));
      return;
    }

    var validacion = await createGrupoAdmin(nombre, contrasenna);
    if (await validacion == true){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Grupo creado correctamente'),
      ));
      await Navigator.pushNamed(context, '/admin_home');
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('No se pudo crear el grupo, puede que exista un grupo con el mismo nombre, pruebe con otro nombre'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
    
      
      children: [
    
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Nombre del grupo",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
    
    
        Padding(
          padding: const EdgeInsets.all(30),
          child: TextField(
            controller: nombreController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "",
            ),
          ),
        ),
    
    
        const Text(
          "Contraseña",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
    
    
        Padding(
          padding: const EdgeInsets.all(30),
          child: TextField(
            controller: contrasennaController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "",
            ),
          ),
        ), 
    
    
        CheckBoxRow(),
    
    
        Container (
          padding: const EdgeInsets.only(top: 10),
          height: 110,
          width: 290,
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 72, 1, 138),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                fixedSize: const Size(510, 50),
              ),
              onPressed: () {
                crearGrupo(context, nombreController.text, contrasennaController.text);
              },
              child: const Text(
                'Crear Grupo',
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CheckBoxRow extends StatefulWidget {
  @override
  _CheckBoxRowState createState() => _CheckBoxRowState();
}

class _CheckBoxRowState extends State<CheckBoxRow> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            value: isChecked,
            activeColor: Colors.black,
            onChanged: (newBool) {
              setState(() {
                isChecked = newBool ?? false;
              });
            },
          ),
          const Text('Cantidad min/max de integrantes'),
        ],
      ),
    );
  }
}
