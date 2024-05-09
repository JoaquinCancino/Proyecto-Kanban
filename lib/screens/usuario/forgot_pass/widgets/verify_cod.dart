import 'package:flutter/material.dart';

class verify_cod extends StatelessWidget {
  const verify_cod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
          const Center(
            child: Padding(
            padding: EdgeInsets.all(40),
            child: Text("Introduzca el código que se le envió a sus mensajes", 
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
            onPressed: () {Navigator.pushNamed(context, '/');},
            child: const Text('Siguiente', style: TextStyle(fontWeight: 
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
