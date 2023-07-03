import 'package:app_vestimenta/Servicios/conection_firebase.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class FormPedidos extends StatefulWidget {
  const FormPedidos({super.key});

  @override
  State<FormPedidos> createState() => _FormPedidosState();
}

class _FormPedidosState extends State<FormPedidos> {
  void callDatePicker() async {
    setState(() {
    });
  }

  Future<DateTime?> getDatePickerWidget() {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2026),
        builder: (context,child){
          return Theme(data: ThemeData.dark(),child: const Text('calendar'));
        },
        );
  }

  final List<String> countries = [
    'United States',
    'Germany',
    'Washington',
    'Paris',
    'Jakarta',
    'Australia',
    'India',
    'Czech Republic',
    'Lorem Ipsum',
  ];
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
                            Container(
                              margin: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.blue,
                              )),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: const Text('Cliente'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 200,
                                    child: SearchField(
                                      suggestions: countries
                                          .map(
                                            (e) => SearchFieldListItem(
                                              e,
                                              item: e,
                                              // Use child to show Custom Widgets in the suggestions
                                              // defaults to Text widget
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    const CircleAvatar(
                                                      backgroundImage: NetworkImage(
                                                          "https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg"),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(e),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Nuevo"))
                                ],
                              ),
                            ),
                            //Busqueda de Cliente
                            Container(
                              margin: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.blue,
                              )),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: const Text('Cliente'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 280,
                                    child: SearchField(
                                      hint: 'Buscar Cliente',
                                      suggestions: countries
                                          .map(
                                            (e) => SearchFieldListItem(
                                              e,
                                              item: e,
                                              // Use child to show Custom Widgets in the suggestions
                                              // defaults to Text widget
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    const CircleAvatar(
                                                      backgroundImage: NetworkImage(
                                                          "https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg"),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(e),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //fecha de Entrega
                            Container(
                              margin: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.blue,
                              )),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: const Text('Fecha Entrega'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 280,
                                    child: ElevatedButton(onPressed: callDatePicker, child: const Text('Seleciona la Fecha'))
                                  ),
                                ],
                              ),
                            ),
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
