// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:kp_express_final/screens/usuario/admin/pedidos/ver_pedidos/clientes/clientes.dart';
import 'package:kp_express_final/screens/usuario/admin/pedidos/ver_pedidos/selector_photocards/s_photocard.dart';
import 'package:kp_express_final/screens/usuario/admin/pedidos/ver_pedidos/t_precio/tabla_precio.dart';

class ver_pedidos extends StatelessWidget {
  const ver_pedidos({
    super.key,
  });
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      
      appBar: AppBar(

        title: const Text('TWICE',

        style:TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),

        centerTitle: true,

        backgroundColor:const Color.fromARGB(255, 49, 1, 112)

      ),

      

      body : ListView(

        children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("Fase de pedido: Abierto", style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)  
              ),
            ),
          ),

        SizedBox(
        height: 110,
        width: 290,
        child: Center(
          child: ElevatedButton(
            style:ElevatedButton.styleFrom(
              backgroundColor:const Color.fromARGB(255, 0, 150, 225),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              ),
              fixedSize: const Size(300, 50)
            ),
            onPressed: () {Navigator.pushNamed(context, '/fasecaja01');},
            child: const  Text('Cambiar Fase', style: TextStyle(fontWeight: 
            FontWeight.bold, 
            color: Colors.white,
            fontSize: 15))
            ),
          )
        ),


        const Center(
          child: Padding(
            padding: EdgeInsets.only(),
            child: Text("Photocards", style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)  
              ),
            ),
          ),

          SizedBox(
            width: 240,
            height: 240,
            child: Image.asset('assets/photocards2.png')
          ),

          
          SizedBox(
            height: 50,
            child: Image.asset('assets/significado_colores.png')
          ),

          seleccion_photocads(),




          Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Center(
          child: Table(
            border: TableBorder.all(),
            defaultColumnWidth: const FixedColumnWidth(170),
            children:const <TableRow>[
               TableRow(
              children:<Widget>[
                Padding(padding: EdgeInsets.only(left: 10, right: 10),
                child: Text('Precio Ingresado', textAlign: TextAlign.center),
                ), 
                Padding(padding: EdgeInsets.only(left: 10, right: 10),
                child: Text('Precio Convertido', textAlign: TextAlign.center),
                )
              ]
              
            )],
          ))),
          t_precio(),
          
           const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text("Clientes", style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)  
              ),
            ),
          ),

          
      Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
          child: Table(
            border: TableBorder.all(),
            defaultColumnWidth: const FixedColumnWidth(120),
            children: <TableRow>[
              const TableRow(
              children:<Widget>[
                Padding(padding: EdgeInsets.only(left: 10, right: 10, top:20, bottom: 20),
                child: Text('Clientes', textAlign: TextAlign.center)
                ), 
                Padding(padding: EdgeInsets.only(left: 10, right: 10 , top:20, bottom: 20),
                child: Text('Estado de pedidos', textAlign: TextAlign.center)
                ),
                Padding(padding: EdgeInsets.only(left: 10, right: 10),
                child: Text('Información del cliente y pedido', textAlign: TextAlign.center)
                )
              ]
          )]))),




          t_precios(),

        ],
      ),
    );
  }
}
