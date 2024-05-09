import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kp_express_final/services/firebase_service.dart';

// ignore: camel_case_types
class Confirm_Register extends StatefulWidget {

  Confirm_Register({super.key});

  @override
  State<Confirm_Register> createState() => _Confirm_RegisterState();
}

// ignore: camel_case_types
class _Confirm_RegisterState extends State<Confirm_Register> {

  final codigoController = TextEditingController();

  registrarse(BuildContext context, String nombre, String numerotelefono, 
  String contrasenna, int codigo, String respuestapreg_1, String respuestapreg_2) async{

    if(codigo==1111){
      bool validacion = await createUsuarioRegistro(nombre,numerotelefono,contrasenna,respuestapreg_1,respuestapreg_2);
      if (validacion == true){
        Navigator.pushNamed(context, '/');
      }
    }else{
      //que pasa si esta malo el codigo
    }

  }


  @override
  Widget build(BuildContext context) {
    
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;

    return Scaffold( 
        appBar: AppBar(
        title: const Text('KP-EXPRESS',
        style:TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:const Color.fromARGB(255, 49, 1, 112),
    
      ),

      body: Column(
         children: [
            const Center(
              child: Padding(
              padding: EdgeInsets.all(40),
              child: Text("Ingresa el código que hemos enviado a tu número telefónico registrado", style:TextStyle(fontSize: 15)  
            ),
           ),
          ),
            Padding(
              padding: EdgeInsets.all(40.0),
              child: TextField(
                controller: codigoController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Ingresa código"
                )
              ),
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

              onPressed: () {
                registrarse(context, arguments['nombre'], arguments['numerotelefono'],
                arguments['contrasenna'], int.parse(codigoController.text) ,arguments['respuestapreg_1'], arguments['respuestapreg_2']);
              },

              child: const Text('Validar código', style: TextStyle(fontWeight: 
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
