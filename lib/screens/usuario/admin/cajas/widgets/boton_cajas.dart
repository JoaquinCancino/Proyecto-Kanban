import 'package:flutter/material.dart';


class button_cajas extends StatelessWidget {
  const button_cajas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
       children: [
        const Padding(
        padding: EdgeInsets.all(10),
        child: Text("Fase de la caja: ", 
        style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)
                  ),
                 ),
        SizedBox(
        height: 110,
        width: 290,
        child: Center(
          child: ElevatedButton(
            style:ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 150, 225),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              ),
              fixedSize: const Size(300, 50)
            ),
            onPressed: () {Navigator.pushNamed(context, '/fasecaja01');},
            child: const Text('Cambiar Fase', style: TextStyle(fontWeight: 
            FontWeight.bold, 
            color: Colors.white,
            fontSize: 15))
            ),
          )
        ),
        SizedBox(
        height: 110,
        width: 290,
        child: Center(
          child: ElevatedButton(
            style:ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 72, 1, 138),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              ),
              fixedSize: const Size(300, 50)
            ),
            onPressed: () {Navigator.pushNamed(context, '/admin_home');},
            child: const Text('Respuestas de formularios', style: TextStyle(fontWeight: 
            FontWeight.bold, 
            color: Colors.white,
            fontSize: 15))
            ),
          )
        ),
        const Center(
            child: Text("Pedidos", 
            style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold,)
                        ),
        ),
        SizedBox (
        height: 110,
        width: 290,
        child: Center(
          child: ElevatedButton(
            style:ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 11, 218, 111),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              ),
              fixedSize: const Size(300, 50)
            ),
            onPressed: () {Navigator.pushNamed(context, '/crear_pedido');},
            child: const Text('Nuevo Pedido', style: TextStyle(fontWeight: 
            FontWeight.bold, 
            color: Colors.white,
            fontSize: 15))
            ),
          )
        ),
        SizedBox (
        height: 110,
        width: 290,
        child: Center(
          child: ElevatedButton(
            style:ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 72, 1, 138),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              ),
              fixedSize: const Size(300, 50)
            ),
            onPressed: () {Navigator.pushNamed(context, '/admin_home');},
            child: const Text('Boy groups 2', style: TextStyle(fontWeight: 
            FontWeight.bold, 
            color: Colors.white,
            fontSize: 15))
            ),
          )
        ),
       SizedBox (
        height: 110,
        width: 290,
        child: Center(
          child: ElevatedButton(
            style:ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 72, 1, 138),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              ),
              fixedSize: const Size(300, 50)
            ),
            onPressed: () {Navigator.pushNamed(context, '/ver_pedidos');},
            child: const Text('Twice', style: TextStyle(fontWeight: 
            FontWeight.bold, 
            color: Colors.white,
            fontSize: 15))
            ),
          )
        ),
    ],
        );
  }
}
