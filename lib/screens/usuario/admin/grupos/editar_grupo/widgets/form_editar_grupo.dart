import 'package:flutter/material.dart';

class form_editar_grupo extends StatelessWidget {
  form_editar_grupo({
    super.key,
  });


  final editnombreController = TextEditingController();
  final editcontrasennaaController = TextEditingController();
  final editrepetircontrasennaController = TextEditingController();

  
  edit_grupo(BuildContext context, String editnombreController, String editcontrasennaaController, String editrepetircontrasennaController) async {


    if (editnombreController.isEmpty || editcontrasennaaController.isEmpty || editrepetircontrasennaController.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Por favor complete todos los campos'),
      ));
      return;
    }

     if (editcontrasennaaController != editrepetircontrasennaController) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Las contraseñas no coinciden'),
      ));
      return; 
    }


    if (editcontrasennaaController.length < 6) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('La contraseña debe tener minimo 6 caracteres'),
    ));
    return;
  } 


    
    Navigator.pushNamed(context, '/grupos', arguments: {
      "nombregrupo": editnombreController, "contragrupo": editcontrasennaaController,
      
    });
}





  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            "Nombre del Grupo",
            style: TextStyle(fontSize: 15),
          ),
        ),
    
    
        Padding(
          padding: const EdgeInsets.all(25),
          child: TextField(
            controller: editnombreController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "",
            ),
          ),
        ), 
    
    
        const Text(
          "Contraseña de grupo",
          style: TextStyle(fontSize: 15),
        ),
    
    
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: TextField(
            controller: editcontrasennaaController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "",
            ),
          ),
        ), 
    
    
    
        const Text(
          "Repetir contraseña",
          style: TextStyle(fontSize: 15),
        ),
    
    
    
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
          child: TextField(
            controller: editrepetircontrasennaController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "",
            ),
          ),
        ), 
    
    
    
        CheckBoxRow(),
    
    
    
        SizedBox(
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
                edit_grupo(context, editnombreController.text, editcontrasennaaController.text, 
                editrepetircontrasennaController.text);

                

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
    
    
    
        SizedBox(
          height: 110,
          width: 290,
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 215, 5, 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                fixedSize: const Size(510, 50),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/grupos');
              },
              child: const Text(
                'Eliminar Grupo',
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
