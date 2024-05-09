import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kp_express_final/datos_logueado.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//get colecciones

getUsuarioColeccion() async{
  
  return db.collection('usuarios');

}

getGrupoColeccion() async{
  
  return db.collection('grupos');

}

getAdminColeccion() async{
  
  return db.collection('administradores');

}

getClienteColeccion() async{
  
  return db.collection('clientes');

}

getCajaColeccion() async{
  
  return db.collection('cajas');

}

//query y logica usuario

getUsuarioId() async{
  try{
    String idusuario="";
    CollectionReference collectionReferenceAdmin = await getUsuarioColeccion();
    QuerySnapshot queryUsuario = await collectionReferenceAdmin.where("nombre", isEqualTo: nombreLogueado).get();
    if (queryUsuario.docs.isNotEmpty){
      queryUsuario.docs.forEach((element) {
        Map elemento = element.data() as Map;
        idusuario = elemento['id_usuario'];
      });
      return idusuario;
    }else{
      return;
    }

  }catch(e){
    return;
  }

}

getUsuarioLogin(String numerotelefono, String contrasenna) async{

  CollectionReference collectionReferenceUsuario = await getUsuarioColeccion();

  QuerySnapshot queryUsuario = await collectionReferenceUsuario.where("numero_telefono", isEqualTo: numerotelefono)
  .where("contrasenna", isEqualTo: contrasenna).get();
  if (queryUsuario.docs.isNotEmpty){
    queryUsuario.docs.forEach((element) {
      Map elemento = element.data() as Map;
      setDatosLogueado(elemento['nombre'], elemento['numero_telefono']);
    });
    return true;
  }else{
    return false;
  }
}

getNumeroRegistro(String numerotelefono) async{
  try{
    CollectionReference collectionReferenceUsuario = await getUsuarioColeccion();
    QuerySnapshot queryexistencia = await collectionReferenceUsuario.where("numero_telefono", isEqualTo: numerotelefono).get();
    if(queryexistencia.docs.isEmpty){
      return false;
    }else{
      return true;
    }
  } catch(e){
    return;
  }
}

createUsuarioRegistro(String nombre, String numerotelefono, String contrasenna, String respuestapreg_1, String respuestapreg_2) async{
  
  
  try{

    bool exitencia = await getNumeroRegistro(numerotelefono);

    if(exitencia == false){

      CollectionReference collectionReferenceUsuario = await getUsuarioColeccion();
      CollectionReference collectionReferenceAdmin = await getAdminColeccion();
      CollectionReference collectionReferenceCliente = await getClienteColeccion();

      String idusuario = "USR-";
      String idadmin = "ADM-";
      String idcliente = "CLIE-";
      int? numeus = 0;
      await collectionReferenceUsuario.count().get().then(
        (res) => {
          numeus =  (res.count! + 1),

          idusuario = idusuario + numeus.toString(),
          idadmin = idadmin + numeus.toString(),
          idcliente = idcliente + numeus.toString()
        }
      );

      collectionReferenceUsuario.add(
        {"id_usuario": idusuario,"nombre" : nombre,
        "numero_telefono": numerotelefono, "contrasenna" : contrasenna,
         "respuesta_preg_1": respuestapreg_1, "respuesta_preg_2": respuestapreg_2}
      );

      collectionReferenceAdmin.add(
        {"id_admin": idadmin,"id_usuario" : idusuario,
        "pntuacion_conducta": 100, "pntuacion_evit_estafa" : 100,
         "pntuacion_info_clara": 100, "pntuacion_no_equivocaciones": 100,
         "pntuacion_tiemp_resp": 100}
      );

      collectionReferenceCliente.add(
        {"id_cliente": idcliente,"id_usuario" : idusuario,
        "pntuacion_demora": 100, "pntuacion_equivocacion" : 100,
         "pntuacion_mala_conducta": 100, "pntuacion_no_pago": 100,
         "pntuacion_nula_resp": 100}
      );

      return true;
    }else{
      return false;
    }

  } catch(e){
    return;
  }

}

//query y logica administrador

getUsuarioAdminId() async{
  try{
    String idusuario = await getUsuarioId();
    String idadmin = "";

    CollectionReference collectionReferenceAdmin = await getAdminColeccion();
    QuerySnapshot queryAdmin = await collectionReferenceAdmin.where("id_usuario", isEqualTo: idusuario).get();

    if (queryAdmin.docs.isNotEmpty){
      queryAdmin.docs.forEach((element) {
        Map elemento = element.data() as Map;
        idadmin = elemento['id_admin'];
      });
      return idadmin;
    }else{
      return;
    }
  }catch(e){
    return;
  }

}

//query y logica grupo

getGrupoNombreExistencia(String nombre) async{
  try{
    CollectionReference collectionReferenceGrupo = await getGrupoColeccion();
    QuerySnapshot queryexistencia = await collectionReferenceGrupo.where("nombre_grupo", isEqualTo: nombre).get();
    if(queryexistencia.docs.isEmpty){
      return false;
    }else{
      return true;
    }
  } catch(e){
    return;
  }
}

createGrupoAdmin(String nombre, String contrasenna) async{
  
  
  try{

    bool exitencia = await getGrupoNombreExistencia(nombre);

    if(exitencia == false){
      CollectionReference collectionReferenceGrupo = await getGrupoColeccion();
      String idgrupo = "GRP-";
      int? numeus = 0;
      await collectionReferenceGrupo.count().get().then(
        (res) => {
          numeus =  (res.count! + 1),
          idgrupo = idgrupo + numeus.toString()
        }
      );
      bool exitenciaadmin = await getNumeroRegistro(numeroLogueado);
      if(exitenciaadmin == true){
        String idadmin = await getUsuarioAdminId();

        collectionReferenceGrupo.add(
          {"id_grupo": idgrupo,"id_admin" : idadmin,
          "nombre_grupo": nombre, "contrasenna" : contrasenna}
        );

      }

      return true;
    }else{
      return false;
    }

  } catch(e){
    return;
  }

}

getGruposAdmin() async{

  try{
    List grupos = [];
    CollectionReference collectionReferenceGrupo = await getGrupoColeccion();
    bool exitenciaadmin = await getNumeroRegistro(numeroLogueado);
    if(exitenciaadmin == true){

      String idadmin = await getUsuarioAdminId();

      QuerySnapshot queryGrupos = await collectionReferenceGrupo.where("id_admin", isEqualTo: idadmin).get();

      if (queryGrupos.docs.isNotEmpty){
        queryGrupos.docs.forEach((element) {
          grupos.add(element.data());
        });
      }

      return grupos;
    }
    


  }catch(e){
    return;
  }
}

// query y logica caja
getCajaNombreExistencia(String nombre, String idgrupo) async{
  try{
    CollectionReference collectionReferenceCaja = await getCajaColeccion();
    QuerySnapshot queryexistencia = await collectionReferenceCaja.where("id_grupo", isEqualTo: idgrupo)
    .where("nombre_caja", isEqualTo: nombre).get();
    if(queryexistencia.docs.isEmpty){
      return false;
    }else{
      return true;
    }
  } catch(e){
    return;
  }
}

createCajaAdmin(String nombre, String idgrupo) async{
  
  
  try{

    bool exitencia = await getCajaNombreExistencia(nombre,idgrupo);

    if(exitencia == false){
      CollectionReference collectionReferenceCaja = await getCajaColeccion();
      String idcaja = "CJA-";
      int? numeus = 0;
      await collectionReferenceCaja.count().get().then(
        (res) => {
          numeus =  (res.count! + 1),
          idcaja = idcaja + numeus.toString()
        }
      );

      collectionReferenceCaja.add(
        {"id_caja": idgrupo,"id_grupo" : idgrupo,
        "nombre_caja": nombre, "id_fase_caja" : "FCJA-1"}
      );

      return true;
    }else{
      return false;
    }

  } catch(e){
    return;
  }

}

getCajasGrupo(String idgrupo) async{

  try{
    List cajas = [];
    CollectionReference collectionReferenceCaja = await getCajaColeccion();

    QuerySnapshot queryGrupos = await collectionReferenceCaja.where("id_grupo", isEqualTo: idgrupo).get();

    if (queryGrupos.docs.isNotEmpty){
      queryGrupos.docs.forEach((element) {
        cajas.add(element.data());
      });
    }

    return cajas;

  }catch(e){
    return;
  }
}