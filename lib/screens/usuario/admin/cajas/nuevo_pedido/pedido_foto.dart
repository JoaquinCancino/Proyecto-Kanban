
import 'package:flutter/material.dart';

// ignore: camel_case_types
class FotosPedido extends StatefulWidget {
  const FotosPedido({super.key});

  @override
  State<FotosPedido> createState() => _FotosPedidoState();
}

// ignore: camel_case_types
class _FotosPedidoState extends State<FotosPedido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        appBar: AppBar(
        title: const Text('Crear Pedido',
        style:TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:const Color.fromARGB(255, 49, 1, 112),
    
      ),


      body: Column(children: [




        const Padding(

          padding: EdgeInsets.only(top: 8.0),
            child: Center(
              child: Text("Subir foto de las photocards", style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)  
              ),
            ),
          ),



        SizedBox(
      width: 120,
      height: 120,
      child: Image.asset('assets/imagentest.jpg')
        ),




        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text("Indica el largo de la fila mas larga de la foto", style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
          ),
        ),
        
        
        const Padding(
         padding: EdgeInsets.all(10.0),
         child: TextField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: ""
              ),
          ),
       ),

        const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text("Indica el largo de la columna mas larga de la foto", style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
            ),
          ),
        
        
        const Padding(
         padding: EdgeInsets.all(10.0),
         child: TextField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: ""
              ),
          ),
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
              fixedSize: const Size(510, 50)
            ),
            onPressed: () {Navigator.pushNamed(context, '/seleccion_photocards');},
            child: const Text('Siguiente', style: TextStyle(fontWeight: 
            FontWeight.bold, 
            color: Colors.white,
            fontSize: 15))
            ),
          )
        ),


      ],)

);
}

  }
