import 'package:flutter/material.dart';
class seleccion_photocads extends StatelessWidget {
  const seleccion_photocads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
       child: Table(
         border: TableBorder.all(),
         defaultColumnWidth: const FixedColumnWidth(100),
         children: <TableRow>[
           TableRow(
           children: [
             TableCell(
               child: Container(
                 color: Colors.green,
                 padding: EdgeInsets.all(10),
                 child: Text('A1', textAlign: TextAlign.center),
               ),
             ), 
             TableCell(
               child: Container(
                 color: Color.fromARGB(255, 229, 255, 0), 
                 padding: EdgeInsets.all(10),
                 child: Text('B1', textAlign: TextAlign.center),
               ),
             ),
             TableCell(
               child: Container(
                 color: Colors.green, 
                 padding: EdgeInsets.all(10),
                 child: Text('C1', textAlign: TextAlign.center),
               ),
             ),
           ],
         ),
         TableRow(
         children: [
           TableCell(
             child: Container(
               color: Color.fromARGB(255, 229, 255, 0), 
               padding: EdgeInsets.all(10),
               child: Text('A2', textAlign: TextAlign.center,),
             ),
           ), 
           TableCell(
             child: Container(
               color: Color.fromARGB(255, 229, 255, 0), 
               padding: EdgeInsets.all(10),
               child: Text('B2', textAlign: TextAlign.center),
             ),
           ),
           TableCell(
             child: Container(
               color: Colors.green,
               padding: EdgeInsets.all(10),
               child: Text('C2', textAlign: TextAlign.center),
             ),
           )
         ],
       ),
        TableRow(
         children:[
           TableCell(
             child: Container(
               color: Color.fromARGB(255, 229, 255, 0), 
               padding: EdgeInsets.all(10),
               child: Text('A3', textAlign: TextAlign.center,),
             ),
           ), 
           TableCell(
             child: Container(
               color:Color.fromARGB(255, 229, 255, 0),
               padding: EdgeInsets.all(10),
               child: Text('B3', textAlign: TextAlign.center),
             ),
           ),
           TableCell(
             child: Container(
               color: Colors.green, 
               padding: EdgeInsets.all(10),
               child: Text('C3', textAlign: TextAlign.center),
             ),
           )
         ],
       )
    
    
    
    
    
           
         ],
       ),
              );
  }
}
