import 'package:kp_express_final/screens/usuario/admin/cajas/nuevo_pedido/nuevo_pedido.dart';
import 'package:kp_express_final/screens/usuario/admin/cajas/nuevo_pedido/pedido_foto.dart';
import 'package:kp_express_final/screens/usuario/admin/cajas/nuevo_pedido/seleccion_photos.dart';
import 'package:kp_express_final/screens/usuario/admin/pedidos/ver_pedidos/pedidos.dart';




//widgets
import 'package:kp_express_final/screens/usuario/login/login.dart';
import 'package:kp_express_final/screens/usuario/register/widgets/confirm_register.dart';
import 'package:kp_express_final/screens/usuario/register/registrer.dart';
import 'package:kp_express_final/screens/usuario/admin/cajas/crear_cajas/crear_cajas.dart';
import 'package:kp_express_final/screens/usuario/admin/grupos/crear_grupo/crear_grupo.dart';
import 'package:kp_express_final/screens/usuario/admin/grupos/grupos.dart';
import 'package:kp_express_final/screens/usuario/admin/home.dart';
import 'package:kp_express_final/screens/usuario/chose.dart';
import 'package:kp_express_final/screens/usuario/forgot_pass/cod_forgot_pass.dart';
import 'package:kp_express_final/screens/usuario/forgot_pass/forgot_pass.dart';
import 'package:kp_express_final/screens/usuario/admin/cajas/cajas.dart';
import 'package:kp_express_final/screens/usuario/admin/grupos/editar_grupo/editar_grupo.dart';
import 'package:kp_express_final/screens/usuario/admin/grupos/mi_baul/mi_baul.dart';
import 'package:kp_express_final/screens/usuario/admin/lista_negra/lista_negra.dart';

var rutas = {
        '/':(context) => const Login(),
        '/register':(context) => const Register(),
        '/confirm_register':(context) => Confirm_Register(),
        '/forgot_password':(context) => const Forgot_Password(),
        '/confirm_password':(context) => const CODForgot_Password(),
        '/chose_user':(context) => const Choose_User(),
        '/admin_home':(context) => const Admin_Home(),
        '/crear_grupo':(context) => const CrearGrupo(),
        '/grupos':(context) => const Grupos(),
        '/crearcajas':(context) => const CrearCaja(),
        '/cajas':(context) => const Cajas(),
        '/lista_negra':(context) => const ListaNegra(),
        '/editar_grupo':(context) => const EditarGrupo(),
        '/mi_baul':(context) => const MiBaul(),
        '/crear_pedido':(context) => Crear_Pedido(),
        '/crear_pedido_fotos':(context) => const FotosPedido(),
        '/seleccion_photocards':(context) => const SeleccionPhotos(),
        '/ver_pedidos': (context) => const ver_pedidos(),
      };