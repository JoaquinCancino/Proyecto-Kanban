
import 'package:flutter/material.dart';

// ignore: camel_case_types
class SeleccionPhotos extends StatefulWidget {
  const SeleccionPhotos({super.key});

  @override
  State<SeleccionPhotos> createState() => _SeleccionPhotosState();
}

// ignore: camel_case_types
class _SeleccionPhotosState extends State<SeleccionPhotos> {
  @override
  Widget build(BuildContext context) {
    TableRow photocards = const TableRow(
      children:<Widget>[
        Padding(padding: EdgeInsets.all(10),
        child: Text('Cambiar', textAlign: TextAlign.center),
        ), 
        Padding(padding: EdgeInsets.all(10),
        child: Text('Cambiar', textAlign: TextAlign.center),
        ),
        Padding(padding: EdgeInsets.all(10),
        child: Text('Cambiar', textAlign: TextAlign.center),
        )
      ]


    );

    
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
              child: Text("Ajustar Disponibilidad", style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)  
              ),
            ),
          ),



        SizedBox(
        width: 300,
        height: 300,
        child: Image.asset('assets/imagenphotocards.png')
        ),

         const Padding(
          padding: EdgeInsets.only(top: 8.0),
            child: Center(
              child: Text("Significado de los colores", style:TextStyle(fontSize: 10)  
              ),
            ),
          ),

           const Padding(
          padding: EdgeInsets.only(top: 3.0),
            child: Center(
              child: Text("🟩 Habilitado  ⬛ No Habilitado", style:TextStyle(fontSize: 10)  
              ),
            ),
          ),



         Center(
              child: Table(
                border: TableBorder.all(),
                defaultColumnWidth: const FixedColumnWidth(120),
                children: <TableRow>[
                  photocards,
                  photocards,
                  photocards
                ],
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
