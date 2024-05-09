import 'package:flutter/material.dart';

class Crear_Pedido extends StatefulWidget {
 Crear_Pedido({
  super.key,
  });

  @override
  State<Crear_Pedido> createState() => _Crear_PedidoState();
}




// ignore: camel_case_types
class _Crear_PedidoState extends State<Crear_Pedido> {
  
    final nombrepedidoController = TextEditingController();
    final tablaprecioController = TextEditingController();
    final valorController = TextEditingController();

  nuevo_pedido(BuildContext context, String nombrepedidoController, String tablaprecioController, String valorController) async {

      
    if (nombrepedidoController.isEmpty || tablaprecioController.isEmpty || valorController.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Por favor complete todos los campos'),
      ));
      return;
    }


    if (nombrepedidoController.length < 4) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('El nombre del pedido debe der de minimo 4 caracteres'),
    ));
    return;
  } 


    Navigator.pushNamed(context, '/cajas', arguments: {
      "nombregrupo": nombrepedidoController, "tabla de precio": tablaprecioController, "valor": valorController
      
    });
}





  @override
  Widget build(BuildContext context) {

    TableRow tableRow = const TableRow(
      children:<Widget>[
        Padding(padding: EdgeInsets.all(10),
        child: Text('Content 1'),
        ), 
        Padding(padding: EdgeInsets.all(10),
        child: Text('Content 2'),
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

      body: Column(
        children: [
                const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text("Nombre del Pedido", style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
            ),
        ),
         
       Padding(
         padding: const EdgeInsets.all(10.0),
         child: TextField(
                controller:nombrepedidoController,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: ""
              )
          ),
       ),
       const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text("Tabla de precio", style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
            ),
        ),
        const Text("Indica el valor del precio 0,1 en tu pedido", style:TextStyle(fontSize: 10)  
        ),
        
        
       Padding(
         padding: const EdgeInsets.all(10.0),
         child: TextField(
                controller: tablaprecioController, 
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: ""
              ),
          ),
       ),
          Center(
              child: Table(
                border: TableBorder.all(),
                defaultColumnWidth: const FixedColumnWidth(120),
                children: <TableRow>[
                  tableRow,
                  tableRow,
                  tableRow
                ],
              ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text("Costo por servicio", style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
            ),
        ),
        const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text("Indica tipo de cobro de servicio", style:TextStyle(fontSize: 10)  
            ),
        ),
        const Row(mainAxisAlignment: MainAxisAlignment.center,

        children: [
          CheckBoxRow(),
          CobroFijoCheckBoxRow()

            ],
          ),   
          const Text("Indicar valor de cobro", 
          style:TextStyle(fontSize: 10),
          ), 
         Padding(
         padding: const EdgeInsets.only(right: 20, left: 20),
         child: TextField(
                controller: valorController,
                decoration: const InputDecoration(
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
            onPressed: () {nuevo_pedido(context,
             nombrepedidoController.text, 
             tablaprecioController.text, 
             valorController.text
          );
          },
            child: const Text('Siguiente', style: TextStyle(fontWeight: 
            FontWeight.bold, 
            color: Colors.white,
            fontSize: 15))
            ),
          )
        ),

        ],
        

      ),
);
} 
}

class CheckBoxRow extends StatefulWidget {

  

  const CheckBoxRow({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CheckBoxRowState createState() => _CheckBoxRowState();
}

class _CheckBoxRowState extends State<CheckBoxRow> {
  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            value: isChecked,
            activeColor: Colors.black,
            onChanged: (newBool) {
              setState(() {
                isChecked = newBool ?? false;
              });
            },
          ),
          const Text('Cobro por photocards'),
        ],
      ),
    );
  }
}

class CobroFijoCheckBoxRow extends StatefulWidget {
  const CobroFijoCheckBoxRow({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CobroFijoCheckBoxRowState createState() => _CobroFijoCheckBoxRowState();
}

class _CobroFijoCheckBoxRowState extends State<CobroFijoCheckBoxRow> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            value: isChecked,
            activeColor: Colors.black,
            onChanged: (newBool) {
              setState(() {
                isChecked = newBool ?? false;
              });
            },
          ),
          const Text('Cobro Fijo'),
        ],
      ),
    );
  }
}
