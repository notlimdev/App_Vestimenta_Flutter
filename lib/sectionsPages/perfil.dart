import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                Column(
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
                          borderRadius: BorderRadius.all(Radius.circular(30.0))
                        ),
                        margin: const EdgeInsets.all(15.0),
                        width: 340,
                        height: 100,
                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          Container(
                            key: key,
                            child: const Text('Perfil',style: TextStyle(fontSize: 20),),
                          ),
                          Container(
                            key: key,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 150,
                                  height: 60,
                                  //color: Colors.green,
                                  child:  Column(
                                    children: [
                                      Text('Maria, Remani',style: TextStyle(fontSize: 22),),
                                      Text('Dueña del Negocio',style: TextStyle(fontSize: 10),)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircleAvatar(backgroundImage: NetworkImage('https://png.pngtree.com/png-vector/20220531/ourlarge/pngtree-avatar-business-call-center-communication-png-image_4772913.png',),foregroundColor: Color.fromARGB(230, 200, 130, 100)),
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
                            key: key,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox(
                                  height: 60,
                                  width: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.email_outlined),
                                      Text('Maria@gmail.com')
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  width: 2.0,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 60,
                                  width: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.call),
                                      Text('452147846')
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
                                borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              height: 50,
                              width: 300,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18))),
                                onPressed: () {},
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
                                onPressed: () {},
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
                                onPressed: () {},
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
                                onPressed: () {},
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
                                onPressed: () {},
                                child: const Text('CERRAR SESIÓN'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
