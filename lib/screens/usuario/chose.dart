// aqui el usuario escogera si es admin o cliente
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Choose_User extends StatefulWidget {
  const Choose_User({super.key});

  @override
  State<Choose_User> createState() => _Choose_UserState();
}

// ignore: camel_case_types
class _Choose_UserState extends State<Choose_User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        appBar: AppBar(
        title: const Text('Home',
        style:TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:const Color.fromARGB(255, 49, 1, 112),
    
      ),

      body: Column(
        
         children: [
            const Center(
              child: Padding(
              padding: EdgeInsets.all(80),
              child: Text("¿A qué sección desea acceder?", 
              style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold,)
            ),
           ),
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
                fixedSize: const Size(510, 50)
              ),
              onPressed: () {Navigator.pushNamed(context, '/');},
              child: const Text('Cliente', style: TextStyle(fontWeight: 
              FontWeight.bold, 
              color: Colors.white,
              fontSize: 15))
              ),
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
              onPressed: () {Navigator.pushNamed(context, '/admin_home');},
              child: const Text('Administrador', style: TextStyle(fontWeight: 
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
