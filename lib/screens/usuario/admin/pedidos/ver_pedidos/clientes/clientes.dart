import 'package:flutter/material.dart';

class t_precio extends StatelessWidget {
  const t_precio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Center(
          child: Table(
            border: TableBorder.all(),
            defaultColumnWidth: const FixedColumnWidth(170),
            children:const <TableRow>[
              TableRow(
              children:<Widget>[
              Padding(padding: EdgeInsets.only(left: 10, right: 10),
              child: Text('0.1', textAlign: TextAlign.center),
              ), 
              Padding(padding: EdgeInsets.only(left: 10, right: 10),
              child: Text('900', textAlign: TextAlign.center),
              )
            ]
          ),
           TableRow(
          children:<Widget>[
            Padding(padding: EdgeInsets.only(left: 10, right: 10),
            child: Text('0.5', textAlign: TextAlign.center),
            ), 
            Padding(padding: EdgeInsets.only(left: 10, right: 10),
            child: Text('4500', textAlign: TextAlign.center),
            )
          ]
        ),
         TableRow(
          children:<Widget>[
            Padding(padding: EdgeInsets.only(left: 10, right: 10),
            child: Text('1', textAlign: TextAlign.center),
            ), 
            Padding(padding: EdgeInsets.only(left: 10, right: 10),
            child: Text('9000', textAlign: TextAlign.center),
            )
          ]
        )
    
    
            ],
          ),
      ),
    );
  }
}
