import 'package:flutter/material.dart';
import 'package:kp_express_final/services/firebase_service.dart';

class form_crear_cajas extends StatelessWidget {
  form_crear_cajas({
    super.key,
  });

  final nombreController = TextEditingController();

  crearCaja(BuildContext context, String nombre, String idgrupo, String nombreGrupo) async {
    
    if (nombre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Por favor introduzca un nombre a la caja'),
      ));
      return;
    }

    if (nombre.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('El nombre de la caja debe tener al menos 4 caracteres'),
      ));
      return;
    }

    var validacion = await createCajaAdmin(nombre, idgrupo);
    if (await validacion == true){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Se creo la caja exitosamente'),
      ));
      await Navigator.pushNamed(context, '/grupos', arguments: {"id_grupo": idgrupo, "nombre_grupo": nombreGrupo});
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('No se pudo crear la caja, puede que exista una caja con el mismo nombre en el grupo, pruebe con otro nombre'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {

    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    
    return Column(
      children: [
    
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Nombre de la caja",
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
    
    
        CheckBoxRow(),
    
    
        Container(
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
                crearCaja(context, nombreController.text, arguments['id_grupo'], arguments['nombre_grupo']);
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
          const Text('Cantidad min/max de photocards'),
        ],
      ),
    );
  }
}
