import 'package:app_vestimenta/Servicios/conection_firebase.dart';
import 'package:flutter/material.dart';

class FormPedidos extends StatefulWidget {
  const FormPedidos({super.key});

  @override
  State<FormPedidos> createState() => _FormPedidosState();
}

class _FormPedidosState extends State<FormPedidos> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController nombrecontroller = TextEditingController();
  TextEditingController apellidoscontroller = TextEditingController();
  TextEditingController dnicontroller = TextEditingController();
  TextEditingController telefonocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seleciona la vestimenta')),
      body: Column(
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
                    child: Form(
                      key: _formkey,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
                              child: TextFormField(
                                controller: nombrecontroller,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.blue,
                                  labelStyle: TextStyle(color: Colors.blueGrey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  labelText: 'Nombre',
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "Campo Requerido ";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
                              child: TextFormField(
                                controller: apellidoscontroller,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.blue,
                                  labelStyle: TextStyle(color: Colors.blueGrey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  labelText: 'Apellidos',
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Campo vacio";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.blue,
                              )),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: const Text('DNI'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 200,
                                    child: TextFormField(
                                      controller: dnicontroller,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.blue,
                                        labelStyle:
                                            TextStyle(color: Colors.blueGrey),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                        labelText: 'Ingrese dni',
                                      ),
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return "Campo vacio";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.blue,
                              )),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: const Text('Teléfono'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 200,
                                    child: TextFormField(
                                      controller: telefonocontroller,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.blue,
                                        labelStyle:
                                            TextStyle(color: Colors.blueGrey),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                        labelText: 'Numero de Celular',
                                      ),
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return "Campo vacio";
                                        }
                                        return null;
                                      },
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
                                  borderRadius: BorderRadius.circular(10)),
                              width: 300,
                              height: 60,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: const StadiumBorder(),
                                  ),
                                  onPressed: () async {
                                    await addclientes(
                                            nombrecontroller.text,
                                            apellidoscontroller.text,
                                            dnicontroller.text,
                                            telefonocontroller.text)
                                        .then((value) {
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('GUARDAR',
                                          style:
                                              TextStyle(fontFamily: 'Ultra')),
                                      Icon(
                                        Icons.note_add_outlined,
                                        size: 40,
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
