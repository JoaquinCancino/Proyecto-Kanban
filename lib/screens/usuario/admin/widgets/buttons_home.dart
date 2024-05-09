import 'package:flutter/material.dart';
import 'package:kp_express_final/services/firebase_service.dart';

// ignore: camel_case_types
class buttonsHome extends StatelessWidget {
  // ignore: use_super_parameters
  const buttonsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          height: 110,
          width: 290,
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                fixedSize: const Size(510, 50),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/lista_negra');
              },
              child: const Text('Lista Negra', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
            ),
          ),
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Mis Grupos",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 110,
          width: 290,
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 42, 169, 31),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                fixedSize: const Size(510, 50),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/crear_grupo');
              },
              child: const Text('Nuevo Grupo', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 6, // Calcula la altura para mostrar 6 botones,
          width: 290,
          child: Center(
            child: BtnGrupo(),
          ),
        ),
      ],
    );
  }
}

class BtnGrupo extends StatelessWidget {
  const BtnGrupo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getGruposAdmin(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Widget de carga mientras se obtienen los datos
        } else if (snapshot.hasError) {
          return Text('Error al obtener los grupos'); // Manejo de error si ocurre algún problema
        } else if (snapshot.hasData && snapshot.data != null) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final nombreGrupo = snapshot.data![index]['nombre_grupo'] ?? '';
              return _buildElevatedButton(
                nombreGrupo,
                () {
                  Navigator.pushNamed(context, '/grupos', arguments: {"id_grupo": snapshot.data![index]['id_grupo'], "nombre_grupo": nombreGrupo});
                },
              );
            },
          );
        } else {
          return Text('Aún no ha creado ningún grupo'); // Manejo de datos nulos
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
