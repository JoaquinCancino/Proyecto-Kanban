import 'package:flutter/material.dart';

class button_login extends StatelessWidget {
  const button_login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.only(top: 20),
    child:Row(

      mainAxisAlignment: MainAxisAlignment.center,    

      children: [

        TextButton(onPressed: (){Navigator.pushNamed(context, '/forgot_password');}, 
        child: const Text('Olvidaste La contraseña', style:TextStyle(color: Colors.black))),


        TextButton(onPressed: (){Navigator.pushNamed(context, '/register');}, 
        child: const Text('Registrarse'))
      ],
    ),
            );
  }
}
