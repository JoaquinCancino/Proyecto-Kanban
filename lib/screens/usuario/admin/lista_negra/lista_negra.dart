// aqui el usuario escogera si es admin o cliente
import 'package:flutter/material.dart';

// ignore: camel_case_types
class ListaNegra extends StatefulWidget {
  const ListaNegra({super.key});

  @override
  State<ListaNegra> createState() => _ListaNegraState();
}

// ignore: camel_case_types
class _ListaNegraState extends State<ListaNegra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        appBar: AppBar(
        title: const Text('Lista Negra',
        style:TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:const Color.fromARGB(255, 49, 1, 112),
    
      ),

      body: Column(

         children: [
            const Center(
              child: Padding(
              padding: EdgeInsets.all(30),
              child: Text("Acá puedes ver las personas que no podrán unirse a tus grupos de pedidos", 
              style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
            ),
           ),
          ),
           
          SizedBox(
          height: 110,
          width: 290,
          child: Center(
            child: ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                ),
                fixedSize: const Size(510, 50)
              ),
              onPressed: () {},
              child: const Text('TheLoveScenario', style: TextStyle(fontWeight: 
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
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                ),
                fixedSize: const Size(510, 50)
              ),
              onPressed: () {},
              child: const Text('Necrosaw', style: TextStyle(fontWeight: 
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

