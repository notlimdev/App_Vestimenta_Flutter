import 'package:flutter/material.dart';
import 'package:app_vestimenta/Servicios/conection_firebase.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> databuildercorreo = GlobalKey<FormState>();
  final datauser = getuser();
  
  TextEditingController correocontroller = TextEditingController();
  TextEditingController telefonocontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Column(
        children: <Widget>[
          //Expancion de Fondo Gradiente
          Expanded(
            //Contenedor General de Elementos del Home
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromARGB(59, 76, 56, 78),
                  Color.fromARGB(193, 94, 75, 109),
                  Color(0xC7BB57FF),
                  Color(0x1287E1FF),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
              )),
              child: Stack(children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // Contenedor de Nombre y foto
                      Center(
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(38, 177, 87, 199),
                                  Color.fromARGB(40, 135, 75, 184),
                                  Color.fromARGB(255, 84, 13, 131),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          margin: const EdgeInsets.all(15.0),
                          width: 340,
                          height: 100,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        height: 60,
                                        //color: Colors.green,
                                        child: Column(
                                          children: [
                                            Text(
                                              'Maria, Remani',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              'Dueña del Negocio',
                                              style: TextStyle(fontSize: 10),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              'https://png.pngtree.com/png-vector/20220531/ourlarge/pngtree-avatar-business-call-center-communication-png-image_4772913.png',
                                            ),
                                            foregroundColor: Color.fromARGB(
                                                230, 200, 130, 100)),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      //Contenedor de Telefono y Email
                      Center(
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 340,
                          height: 120,
                          child: Column(children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                              height: 2.0,
                              width: 300,
                              color: Colors.white,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Icon(Icons.email_outlined),
                                        Center(
                                          child: FutureBuilder<List<dynamic>>(
                                            key: databuildercorreo,
                                            future: getuser(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<List<dynamic>>
                                                    snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              } else if (snapshot.hasError) {
                                                return const Center(
                                                  child: Text(
                                                      'Error al obtener los datos'),
                                                );
                                              } else {
                                                List<dynamic> datos =
                                                    snapshot.data!;
                                                dynamic correo =
                                                    datos[0]['correo'];

                                                // Obtener el dato en el índice 2
                                                return Center(
                                                  child: Text(
                                                    '$correo',
                                                    style: const TextStyle(
                                                        fontSize: 12),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                        // Icon(Icons.email_outlined),
                                        // Text(
                                        //   'Maria@gmail.com',
                                        //   style: TextStyle(fontSize: 10),
                                        // )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    width: 2.0,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 60,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Icon(Icons.call),
                                        Center(
                                          child: FutureBuilder<List<dynamic>>(
                                            future: getuser(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<List<dynamic>>
                                                    snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              } else if (snapshot.hasError) {
                                                return const Center(
                                                  child: Text(
                                                      'Error al obtener los datos'),
                                                );
                                              } else {
                                                List<dynamic> datos =
                                                    snapshot.data!;
                                                dynamic telefono =
                                                    datos[0]['telefono'];
                                                // Obtener el dato en el índice 2
                                                return Center(
                                                  child: Text(
                                                    '$telefono',
                                                    style: const TextStyle(
                                                        fontSize: 12),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 2.0,
                              width: 300,
                              color: Colors.white,
                            ),
                          ]),
                        ),
                      ),
                      // Contenedor de Opciones de Perfil
                      Center(
                        child: SizedBox(
                          width: 340,
                          height: 440,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 149, 18, 182),
                                        Color.fromARGB(211, 204, 198, 209),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                height: 50,
                                width: 300,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18))),
                                  onPressed: () async {},
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Icon(Icons.image),
                                      Text('Cambiar Imagen de Perfil'),
                                      Icon(Icons.arrow_forward_ios)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 149, 18, 182),
                                        Color.fromARGB(211, 204, 198, 209),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                height: 50,
                                width: 300,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18))),
                                  onPressed: () {
                                    Alert(
                                        context: context,
                                        title: "Cambiar Correo",
                                        content: Column(
                                          children: <Widget>[
                                            TextFormField(
                                              controller: correocontroller,
                                              decoration: const InputDecoration(
                                                icon:
                                                    Icon(Icons.account_circle),
                                                labelText: 'Nuevo Correo',
                                              ),
                                              validator: (String? value) {
                                                if (value!.isEmpty) {
                                                  return "Campo vacio";
                                                }
                                                return null;
                                              },
                                            ),
                                          ],
                                        ),
                                        buttons: [
                                          DialogButton(
                                            color: Colors.red,
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text(
                                              "Cancelar",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          DialogButton(
                                            color: Colors.green[700],
                                            onPressed: () async {
                                              dynamic datos = getuser();
                                              Future<dynamic> leerDatos(
                                                  Future<dynamic>
                                                      futuro) async {
                                                dynamic resultado =
                                                    await futuro;
                                                return resultado;
                                              }

                                              leerDatos(datos).then((ds) async {
                                                await updateusercorreo(
                                                        ds[0]['idkey'],
                                                        correocontroller.text)
                                                    .then((value) {
                                                  Navigator.pop(context);
                                                });
                                                setState(() {
                                                  correocontroller;
                                                });
                                              });
                                            },
                                            child: const Text(
                                              "Actualizar",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          )
                                        ]).show();
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Icon(Icons.email),
                                      Text('Cambiar Correo'),
                                      Icon(Icons.arrow_forward_ios)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 149, 18, 182),
                                        Color.fromARGB(211, 204, 198, 209),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                height: 50,
                                width: 300,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18))),
                                  onPressed: () {
                                    Alert(
                                        context: context,
                                        title: "Cambiar telefono",
                                        content: Column(
                                          children: <Widget>[
                                            TextFormField(
                                              controller: telefonocontroller,
                                              decoration: const InputDecoration(
                                                icon:
                                                    Icon(Icons.account_circle),
                                                labelText: 'Nuevo Telefono',
                                              ),
                                              validator: (String? value) {
                                                if (value!.isEmpty) {
                                                  return "Campo vacio";
                                                }
                                                return null;
                                              },
                                            ),
                                          ],
                                        ),
                                        buttons: [
                                          DialogButton(
                                            color: Colors.red,
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text(
                                              "Cancelar",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          DialogButton(
                                            color: Colors.green[700],
                                            onPressed: () async {
                                               dynamic datos = getuser();
                                              Future<dynamic> leerDatos(
                                                  Future<dynamic>
                                                      futuro) async {
                                                dynamic resultado =
                                                    await futuro;
                                                return resultado;
                                              }

                                              leerDatos(datos).then((ds) async {
                                                await updateusertelefono(
                                                        ds[0]['idkey'],
                                                        telefonocontroller.text)
                                                    .then((value) {
                                                  Navigator.pop(context);
                                                });
                                                setState(() {
                                                  telefonocontroller;
                                                });
                                              });
                                            },
                                            child: const Text(
                                              "Actualizar",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          )
                                        ]).show();
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Icon(Icons.call),
                                      Text('Cambiar Teléfono'),
                                      Icon(Icons.arrow_forward_ios)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 149, 18, 182),
                                        Color.fromARGB(211, 204, 198, 209),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                height: 50,
                                width: 300,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18))),
                                  onPressed: () {
                                    Alert(
                                        context: context,
                                        title: "Cambiar Contraseña",
                                        content: Column(
                                          children: <Widget>[
                                            TextFormField(
                                              controller: passwordcontroller,
                                              decoration: const InputDecoration(
                                                icon:
                                                    Icon(Icons.account_circle),
                                                labelText: 'Nueva Contraseña',
                                              ),
                                              validator: (String? value) {
                                                if (value!.isEmpty) {
                                                  return "Campo vacio";
                                                }
                                                return null;
                                              },
                                            ),
                                          ],
                                        ),
                                        buttons: [
                                          DialogButton(
                                            color: Colors.red,
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text(
                                              "Cancelar",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          DialogButton(
                                            color: Colors.green[700],
                                            onPressed: () async {
                                               dynamic datos = getuser();
                                              Future<dynamic> leerDatos(
                                                  Future<dynamic>
                                                      futuro) async {
                                                dynamic resultado =
                                                    await futuro;
                                                return resultado;
                                              }

                                              leerDatos(datos).then((ds) async {
                                                await updateuserpassword(
                                                        ds[0]['idkey'],
                                                        passwordcontroller.text)
                                                    .then((value) {
                                                  Navigator.pop(context);
                                                });
                                                // ignore: use_build_context_synchronously
                                                Navigator.of(context)
                                                    .pushNamedAndRemoveUntil(
                                                        '/Login',
                                                        (Route<dynamic>
                                                                route) =>
                                                            false);
                                              });
                                            },
                                            child: const Text(
                                              "Actualizar",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          )
                                        ]).show();
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Icon(Icons.password),
                                      Text('Cambiar Contraseña'),
                                      Icon(Icons.arrow_forward_ios)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                width: 300,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.purple[900],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18))),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil('/Login',
                                            (Route<dynamic> route) => false);
                                  },
                                  child: const Text('CERRAR SESIÓN'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
