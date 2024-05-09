// aqui el usuario escogera si es admin o cliente
import 'package:flutter/material.dart';
import 'package:kp_express_final/services/firebase_service.dart';

// ignore: camel_case_types
class Grupos extends StatefulWidget {
  const Grupos({super.key});

  @override
  State<Grupos> createState() => _GruposState();
}

// ignore: camel_case_types
class _GruposState extends State<Grupos> {
  @override
  Widget build(BuildContext context) {

    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;

    return Scaffold( 
        appBar: AppBar(
        title: const Text('Administrador',
        style:TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:const Color.fromARGB(255, 49, 1, 112),
    
      ),

      body: Column(
        
         children: [
          SizedBox(
          height: 110,
          width: 290,
          child: Center(
            child: ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 4, 166, 147),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                ),
                fixedSize: const Size(510, 50)
              ),
              onPressed: () {Navigator.pushNamed(context, '/editar_grupo');},
              child: const Text('Editar Grupo', style: TextStyle(fontWeight: 
              FontWeight.bold, 
              color: Colors.white,
              fontSize: 15))
              ),
            )
          ),
          SizedBox (
          height: 110,
          width: 290,
          child: Center(
            child: ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 0, 150, 225),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                ),
                fixedSize: const Size(510, 50)
              ),
              onPressed: () {Navigator.pushNamed(context, '/mi_baul');},
              child: const Text('Mi Baul', style: TextStyle(fontWeight: 
              FontWeight.bold, 
              color: Colors.white,
              fontSize: 15))
              ),
            )
          ),
           Center(
              child: Text(arguments['nombre_grupo'], 
              style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold,)
                          ),
          ),
          SizedBox (
          height: 110,
          width: 290,
          child: Center(
            child: ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 11, 218, 111),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                ),
                fixedSize: const Size(510, 50)
              ),
              onPressed: () {Navigator.pushNamed(context, '/crearcajas', arguments: {"id_grupo": arguments['id_grupo'], "nombre_grupo": arguments['nombre_grupo']});},
              child: const Text('Nueva Caja', style: TextStyle(fontWeight: 
              FontWeight.bold, 
              color: Colors.white,
              fontSize: 15))
              ),
            )
          ),
          SizedBox (
          height: MediaQuery.of(context).size.height / 6, // Calcula la altura para mostrar 6 botones,,
          width: 290,
          child: Center(
            child: btn_caja(idGrupo: arguments['id_grupo']),
            )
          ),
      ],
    )
);
}

}

class btn_caja extends StatelessWidget {

  final String idGrupo;


  const btn_caja({
    Key? key,
    required this.idGrupo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: getCajasGrupo(idGrupo),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error al obtener las caja');
        } else if (snapshot.hasData && snapshot.data != null) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final nombreCaja = snapshot.data![index]['nombre_caja'];
              return _buildElevatedButton(
                nombreCaja != null ? nombreCaja.toString() : 'Nombre de caja predeterminado', // Manejar el caso de nombreCaja nulo
                () {
                  Navigator.pushNamed(context, '/cajas', arguments: {snapshot.data![index]['id_caja']});
                },
              );
            },
          );
        } else {
          return Text('Aun no ha creado ninguna caja');
        }
      },
    );
  }

  Widget _buildElevatedButton(String buttonText, void Function()? onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 72, 1, 138),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        fixedSize: const Size(510, 50),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}
