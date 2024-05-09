import 'package:flutter/material.dart';

class form_forgot_pass extends StatelessWidget {
  const form_forgot_pass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
          const Center(
            child: Padding(
            padding: EdgeInsets.all(40),
            child: Text("No te preocupes, introduce el numero celular con el que te registraste para una verificación con código", 
            style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
          ),
         ),
        ),
          const Padding(
            padding: EdgeInsets.all(40.0),
            child: TextField(
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: ""
            )
          ),
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
            onPressed: () {Navigator.pushNamed(context, '/confirm_password');},
            child: const Text('Enviar Codigo', style: TextStyle(fontWeight: 
            FontWeight.bold, 
            color: Colors.white,
            fontSize: 15))
            ),
          )
        ),
        
          TextButton(onPressed: (){Navigator.pushNamed(context, '/');}, child:
          const Text('Ya recordé mi contraseña', style:TextStyle(color: Colors.black))),
    ],
        );
  }
}
