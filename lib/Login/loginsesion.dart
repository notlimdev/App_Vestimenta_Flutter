import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:app_vestimenta/mainpages/mainappbar.dart';

class LoginSesion extends StatefulWidget {
  const LoginSesion({Key? key} ) : super(key:key);

  @override
  State<LoginSesion> createState() => _LoginSesionState();


}

String validatorcorreo(value) {
  if (value.isEmpty) {
    return 'El campo no debe estar vacio';
  } else {
    if (value.contains(' ')) {
      return 'El Email contiene espacio';
    } else {
      return value!;
    }
  }
}

String validatorpassword(value) {
  if (value.isEmpty) {
    return 'El campo no debe estar vacio';
  } else {
    if (value.length < 6) {
      return 'La contraseña es debil';
    } else {
      return value!;
    }
  }
}

class _LoginSesionState extends State<LoginSesion> {
  String agregarvalidator(value) {
    email = value;
    return email;
  }


final GlobalKey<FormState>  _formkey = GlobalKey<FormState>();

  String emailcorrecto = "maria05@gmail.com";
  String passwordcorrecto = "123456";

  String email = '';
  String password = '';

  void registrarse() {}
  void iniciarsesion(){
    if (_formkey.currentState!.validate()) {

      if (emailcorrecto.toLowerCase() == email.toLowerCase() &&
          passwordcorrecto == password) {
        print('Este es mi email : $email');
        print('este es mi contraseña: $password');
      } else {
        print('aqui hay una error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
      ),
      body:
          
      Column(
        children: <Widget>[
          //Expancion de Fondo Gradiente
          Expanded(
            //Contenedor General de Elementos del Home
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0x8659DAFF),
                  Color(0x4CAF50FF),
                  Color(0xC7BB57FF),
                  Color(0x1287E1FF),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
              )),
              child: Stack(
                children: [
                  Center(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          SvgPicture.asset('assets/images/logo_sesion.svg'),
                          const Text(
                            'INGRESA A',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Ultra',
                            ),
                          ),
                          const Text(
                            'TU SESIÓN',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Ultra',
                            ),
                          ),
                          Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color.fromARGB(197, 134, 30, 219),
                                      Color.fromARGB(198, 159, 76, 214),
                                    ]),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(50),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(50)),
                                  ),
                                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  width: 300,
                                  height: 300,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 15, 8, 20),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            fillColor: Colors.white,
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.white),
                                            ),
                                            labelText: 'Ingrese Su Correo',
                                          ),
                                          validator: (value) =>
                                              validatorcorreo(value),
                                          onSaved: (value) =>
                                              agregarvalidator(value),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 30, 8, 0),
                                        child: TextFormField(
                                          obscureText: true,
                                          decoration: const InputDecoration(
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.white),
                                            ),
                                            labelText: 'Ingrese su contraseña',
                                          ),
                                          validator: (value) =>
                                              validatorpassword(value),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromARGB(75, 132, 32, 214),
                                          Color.fromARGB(198, 141, 48, 204),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      borderRadius: BorderRadius.circular(30)),
                                  margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                                  width: 300,
                                  height: 60,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        shape: const StadiumBorder(),
                                      ),
                                      onPressed: () => iniciarsesion(),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('INICIAR'),
                                          Icon(
                                            Icons.arrow_circle_right_outlined,
                                            size: 40,
                                          )
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
