import 'package:flutter/material.dart';

class t_precios extends StatelessWidget {
  const t_precios({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Center(
          child: Table(
            border: TableBorder.all(),
            defaultColumnWidth: const FixedColumnWidth(120),
            children: <TableRow>[

        TableRow(
            children:<Widget>[
              const Padding(padding: EdgeInsets.only(left: 10, right: 10, top:20, bottom: 20),
              child: Text('Emuotori', textAlign: TextAlign.center)
              ), 
              const Padding(padding: EdgeInsets.only(left: 10, right: 10, top:20, bottom: 20),
              child: Text('Esperando aprobacion', textAlign: TextAlign.center)
              ),
              Padding(padding: EdgeInsets.only(left: 10, right: 10, top:20, bottom: 20),
              child:  ElevatedButton(
                style:ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 111, 201),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  ),
                  fixedSize: const Size(200, 20)
                ),
                onPressed: () {Navigator.pushNamed(context, '/');},
                child: Text('Ver', style: TextStyle(fontWeight: 
                FontWeight.bold, 
                color: Colors.white,
                fontSize: 15))
                ),
              )
            ]
          )
            ],
          ),
      ),
    );
  }
}
