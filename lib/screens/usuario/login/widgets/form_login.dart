

import 'package:flutter/material.dart';
import 'package:kp_express_final/datos_logueado.dart';
import 'package:kp_express_final/services/firebase_service.dart';

class form_login extends StatelessWidget {
  form_login({
    super.key,
  });

  final telefonoController = TextEditingController();
  final contrasennaController = TextEditingController();

  validacion(BuildContext context, String numeroTelefono, String contrasenna) async {

    if (numeroTelefono.isEmpty || contrasenna.isEmpty) {
      // Validación adicional para el número de teléfono
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Porfavor complete los campos'),
      ));
      return;
    } 
    
    if (numeroTelefono.isEmpty || !numeroTelefono.startsWith("+569")) {
      // Validación adicional para el número de teléfono
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Por favor ingresa un número de teléfono válido que comience con "+569"'),
      ));
      return;
    }

    
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9]).{6,}$');
      if (!regex.hasMatch(contrasenna)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('La contraseña debe contener al menos una mayúscula, un número'),
        ));
        return;
    }

    iniciarSesion(context, numeroTelefono, contrasenna);
    
  }

  iniciarSesion(BuildContext context, String numerotelefono, String contrasenna) async {
    var validacion = await getUsuarioLogin(numerotelefono, contrasenna);
    if (await validacion == true){
      print(nombreLogueado);
      await Navigator.pushNamed(context, '/chose_user');
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Numero de telefono y/o contraseña incorrecta'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(  
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
    
            // Imagenes, login (numero de telefono y contraseña) y Boton de Iniciar Sesion
            children: [
    SizedBox(
      width: 120,
      height: 120,
      child: Image.asset('assets/kpexpress2.png')
    ),
    Column(
    
    children: [
      const Text("Iniciar Sesión", style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold)  
      ),
    
      const Padding(
        padding: EdgeInsets.only(top: 20),
        child: Text("Numero de Telefono", style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
        ),
      ),
     
      TextField(
        controller: telefonoController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Numero de telefono",
          hintText: "+569XXXXXXXX"
        )
      ),
    
      Padding(
        padding: EdgeInsets.only(top:20),
        child: Text("Contraseña", style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
        ),
      ),
    
      TextField(
        controller: contrasennaController,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Contraseña"
      )
      ),
    ],   
            ),
    
            // botones de "olvide contraseña" y "registrarse"
            Container (
    padding: const EdgeInsets.only(top: 20),
    child: Center(
      child: ElevatedButton(
        style:ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 72, 1, 138),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7)
          ),
          fixedSize: const Size(520, 50)
        ),
        onPressed: () {validacion(context, telefonoController.text, contrasennaController.text);},
        child: const Text('Iniciar Sesión', style: TextStyle(fontWeight: 
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