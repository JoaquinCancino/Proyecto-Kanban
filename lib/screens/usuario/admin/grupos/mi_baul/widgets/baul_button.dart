import 'package:flutter/material.dart';

class buttons_baul extends StatelessWidget {
  const buttons_baul({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      
       children: [
        Padding(
          padding: const EdgeInsets.all(50),
          child: SizedBox(
          height: 110,
          width: 290,
          child: Center(
            child: ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 4, 166, 147),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                ),
                fixedSize: const Size(510, 50)
              ),
              onPressed: () {Navigator.pushNamed(context, '/editar_grupo');},
              child: const Text('Habilitar baúl', style: TextStyle(fontWeight: 
              FontWeight.bold, 
              color: Colors.white,
              fontSize: 15))
              ),
            )
          ),
        ),
    
        Padding(
          padding: const EdgeInsets.all(50),
          child: SizedBox (
          height: 110,
          width: 290,
          child: Center(
            child: ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 150, 225),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                ),
                fixedSize: const Size(510, 50)
              ),
          
              onPressed: () {Navigator.pushNamed(context, '/admin_home');},
              child: const Text('Solicitudes Clientes', style: TextStyle(fontWeight: 
              FontWeight.bold, 
              color: Colors.white,
              fontSize: 15))
              ),
            )
          ),
        ),
    ],
        );
  }
}
