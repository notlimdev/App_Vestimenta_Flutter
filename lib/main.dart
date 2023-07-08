import 'package:app_vestimenta/FormView/editform_vestimenta.dart';
import 'package:app_vestimenta/FormView/form_cliente.dart';
import 'package:app_vestimenta/FormView/form_pedidos.dart';
import 'package:app_vestimenta/FormView/form_vestimentas.dart';
import 'package:app_vestimenta/mainpages/mainappbar.dart';
import 'package:app_vestimenta/sectionsPages/addtrajes.dart';
import 'package:flutter/material.dart';
import 'package:app_vestimenta/Login/login.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:app_vestimenta/firebase_options.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // useMaterial3: true,
      ),
      builder: (context, child) => Stack(
        children: [child!, const DropdownAlert()],
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      
      initialRoute: "/",
      routes: {
        "/": (context) => const  Login(),
        "/home": (context) => const MainAppBar(),
        "/Login": (context) => const Login(),
        '/formvestimenta':(context) => const FormVestiment(),
        '/add':(context) => const AddVestments(),
        '/formclientes': (context) => const FormClientes(),
        '/formpedidos': (context) => const FormPedidos(),
        '/editformvestimenta': (context) => const EditFormVestiment(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

