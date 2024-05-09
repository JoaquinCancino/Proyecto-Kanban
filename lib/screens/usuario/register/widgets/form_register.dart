import 'package:flutter/material.dart';
import 'package:kp_express_final/services/firebase_service.dart';


class form_register extends StatelessWidget {
  form_register({
    super.key,
  });

  final nombreController = TextEditingController();
  final telefonoController = TextEditingController();
  final contrasennaController = TextEditingController();
  final contrasennaRepetidaController = TextEditingController();
  final respPregunta1Controller = TextEditingController();
  final respPregunta2Controller = TextEditingController();

  guardar_registro(BuildContext context, String nombre, String numerotelefono, String contrasenna,
  String contrasennaRepetida, String respuestapreg_1, String respuestapreg_2) async {
    
    if (nombre.isEmpty || numerotelefono.isEmpty || contrasenna.isEmpty || contrasennaRepetida.isEmpty || respuestapreg_1.isEmpty || respuestapreg_2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Por favor complete todos los campos'),
      ));
      return;
    } 



    if (numerotelefono.isEmpty || !numerotelefono.startsWith("+569")) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Por favor ingresa un número de teléfono válido que comience con "+569"'),
      ));
      return;
    }


    bool existe = await getNumeroRegistro(numerotelefono);
    if (existe) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('El número de teléfono ya está registrado'),
      ));
      return; 
    }

    if (nombre.length < 5) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('El nombre de usuario debe tener al menos 5 caracteres'),
      ));
      return;
    }


    if (contrasenna.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('La contraseña debe tener al menos 8 caracteres'),
      ));
      return;
    } 
     // Verificar si el nombre contiene al menos una mayúscula
    if (!RegExp(r'[A-Z]').hasMatch(contrasenna)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('El nombre debe contener al menos una mayúscula'),
      ));
      return; // Detener la función si el nombre no contiene una mayúscula
    }

    // Verificar si el nombre contiene al menos un número
    if (!RegExp(r'[0-9]').hasMatch(contrasenna)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('El nombre debe contener al menos un número'),
      ));
      return; // Detener la función si el nombre no contiene un número
    }

    if (contrasenna != contrasennaRepetida) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Las contraseñas no coinciden'),
      ));
      return; 
    }


    Navigator.pushNamed(context, '/confirm_register', arguments: {
      "nombre": nombre, "numerotelefono": numerotelefono, "contrasenna": contrasenna,
      "respuestapreg_1": respuestapreg_1, "respuestapreg_2": respuestapreg_2
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: ListView(
      children: [
       SizedBox(
          width: 120,
          height: 120,
          child: Image.asset('assets/kpexpress2.png')
        ),
      
      const Center(
        child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Registro", style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold)  
              ),
          ),
      ),
      
      const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("Nombre de Usuario", style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
            ),
        ),
    
    
      TextField(
        controller: nombreController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: ""
        )
      ),
    
      const Padding(
            padding: EdgeInsets.only(right: 210),
            child: Text("Minimo de 5 caracteres", style:TextStyle(fontSize: 12, color: Colors.grey)  
            ),
        ),
    
      const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("Ingresa número telefonico", style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
            ),
        ),
    
      TextField(
        controller: telefonoController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: ""
        )
      ),
    
    
        const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("Crear Contraseña", style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
            ),
        ),
    
    
      TextField(
        controller: contrasennaController,
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: ""
        )
      ),
    
      const Column(
        children: [
           Padding(
                padding: EdgeInsets.only(right: 210),
                child: Text("Minimo de 8 caracteres", style:TextStyle(fontSize: 12, color: Colors.grey),  
                ),
              ),
             Padding(
                padding: EdgeInsets.only(right: 210),
                child: Text("Minimo una mayuscúla", style:TextStyle(fontSize: 12, color: Colors.grey),  
                ),
              ), 
              Padding(
                padding: EdgeInsets.only(right: 235),
                child: Text("Minimo un numero", style:TextStyle(fontSize: 12, color: Colors.grey),  
                ),
              )
        ],
      ),
       const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("Repetir Contraseña", style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
            ),
        ),
    
    
      TextField(
        controller: contrasennaRepetidaController,
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: ""
        )
      ),
         const Center(
              child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text("Preguntas de Seguridad", style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
              ),
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("Grupo/Cantante favorito?", style:TextStyle(fontSize: 15)  
            ),
        ),
    
      TextField(
        controller: respPregunta1Controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: ""
        )
      ),
    
        const Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text("Cual es el nombre de tu primera mascota?", style:TextStyle(fontSize: 15)  
            ),
        ),
        
      TextField(
        controller: respPregunta2Controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: ""
        )
      ),
      Container (
        padding: const EdgeInsets.only(top: 10),
        height: 110,
        width: 290,
        child: Center(
          child: ElevatedButton(
            style:ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 72, 1, 138),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              ),
              fixedSize: const Size(510, 50)
            ),
            onPressed: () {
              guardar_registro(context, nombreController.text, telefonoController.text, contrasennaController.text, 
              contrasennaRepetidaController.text, respPregunta1Controller.text, respPregunta2Controller.text);
            },
            child: const Text('Siguiente', style: TextStyle(fontWeight: 
            FontWeight.bold, 
            color: Colors.white,
            fontSize: 15))
            ),
          )
        ),
    
      ],
      )
        );
  }
}