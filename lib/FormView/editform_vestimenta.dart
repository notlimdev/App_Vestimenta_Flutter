import 'package:flutter/material.dart';
import 'package:app_vestimenta/Servicios/conection_firebase.dart';

class EditFormVestiment extends StatefulWidget {
  const EditFormVestiment({super.key});

  @override
  State<EditFormVestiment> createState() => _EditFormVestimentState();
}

class _EditFormVestimentState extends State<EditFormVestiment> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> change = GlobalKey<FormState>();
  final GlobalKey<FormState> otheraccesorios = GlobalKey<FormState>();
  final GlobalKey<FormState> cantidadkey = GlobalKey<FormState>();

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.green;
  }
  List<Map> tallas2 = [
    {"name": "S", "isChecked": false},
    {"name": "M", "isChecked": false},
    {"name": "L", "isChecked": false},
    {"name": "XL", "isChecked": false},
  ];
  List<Map> tallas1 = [
    {"name": "6", "isChecked": false},
    {"name": "8", "isChecked": false},
    {"name": "10", "isChecked": false},
    {"name": "12", "isChecked": false},
  ];
  List<Map> prendas = [
    {"name": "Pantalon", "isChecked": false},
    {"name": "Camisa", "isChecked": false},
    {"name": "Falda", "isChecked": false},
    {"name": "Manta", "isChecked": false},
    {"name": "Faja", "isChecked": false},
    {"name": "Sombrero", "isChecked": false},
    {"name": "Monteras", "isChecked": false},
  ];
  List<String> sexper = ['H', 'M'];

  String selectsex = 'M';
  // cajas de texto controladores

  TextEditingController nameVestimenta = TextEditingController();
  TextEditingController descripcionVestimenta = TextEditingController();
  TextEditingController cantidadVestimenta = TextEditingController();
  bool isChecked = false;
  final datostemp = [];
  final datostemp2 = [];
  final datostempprendas = [];
  String datostemprad = '';

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameVestimenta.text = arguments['nombre'];
    descripcionVestimenta.text = arguments['descripcion'];
    cantidadVestimenta.text = arguments['cantidad'];

    return Scaffold(
      appBar: AppBar(title: const Text('Nueva vestimenta')),
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
                                controller: nameVestimenta,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.blue,
                                  labelStyle: TextStyle(color: Colors.blueGrey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  labelText: 'Nombre de la Vestimenta',
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "Campo Requerido ";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(8, 20, 8, 20),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.blue,
                              )),
                              child: Column(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.all(8),
                                      child: const Row(
                                        children: [
                                          Text('Tallas Pequeñas'),
                                        ],
                                      )),
                                  Row(
                                      children: tallas1.map((elemento) {
                                    return Expanded(
                                      child: CheckboxListTile(
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        value: elemento['isChecked'],
                                        onChanged: (val) {
                                          setState(() {
                                            elemento['isChecked'] = val;
                                            if (elemento['isChecked'] == true) {
                                              datostemp.add(elemento['name']);
                                              print(datostemp);
                                            } else {
                                              datostemp
                                                  .remove(elemento['name']);
                                              print(datostemp);
                                            }
                                          });
                                        },
                                        title: Text(
                                          elemento['name'],
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    );
                                  }).toList()),
                                  Container(
                                      margin: const EdgeInsets.all(8),
                                      child: const Row(
                                        children: [
                                          Text('Tallas Medianas y Grandes'),
                                        ],
                                      )),
                                  Row(
                                      children: tallas2.map((elemento) {
                                    return Expanded(
                                      child: CheckboxListTile(
                                        controlAffinity:
                                            ListTileControlAffinity.platform,
                                        value: elemento['isChecked'],
                                        onChanged: (val) {
                                          setState(() {
                                            elemento['isChecked'] = val;
                                            if (elemento['isChecked'] == true) {
                                              datostemp2.add(elemento['name']);
                                              print(datostemp2);
                                            } else {
                                              datostemp2
                                                  .remove(elemento['name']);
                                              print(datostemp2);
                                            }
                                          });
                                        },
                                        title: Text(
                                          elemento['name'],
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    );
                                  }).toList())
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.blue,
                              )),
                              child: Column(
                                children: [
                                  Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(5, 5, 0, 5),
                                      child: const Row(
                                        children: [
                                          Text('Sexo'),
                                        ],
                                      )),
                                  Row(
                                      children: sexper.map((element) {
                                    return Expanded(
                                      child: ListTile(
                                        title: Text(element),
                                        leading: Radio(
                                            value: element,
                                            groupValue: selectsex,
                                            onChanged: (val) {
                                              setState(() {
                                                selectsex = val.toString();
                                                if (selectsex == 'M') {
                                                  datostemprad = 'M';
                                                  print(datostemprad);
                                                } else if (selectsex == 'H') {
                                                  datostemprad = 'H';
                                                  print(datostemprad);
                                                }
                                              });
                                            }),
                                      ),
                                    );
                                  }).toList()),
                                ],
                              ),
                            ),
                            Column(
                                children: prendas.map((elemento) {
                              return CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.platform,
                                value: elemento['isChecked'],
                                onChanged: (val) {
                                  setState(() {
                                    elemento['isChecked'] = val;
                                    if (elemento['isChecked'] == true) {
                                      datostempprendas.add(elemento['name']);
                                      print(datostempprendas);
                                    } else {
                                      datostempprendas.remove(elemento['name']);
                                      print(datostempprendas);
                                    }
                                  });
                                },
                                title: Text(
                                  elemento['name'],
                                  style: const TextStyle(fontSize: 15),
                                ),
                              );
                            }).toList()),
                            Container(
                              key: otheraccesorios,
                              margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.blue,
                              )),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Otros Accesorios',
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 10, 8, 10),
                                    child: SizedBox(
                                      height: 200,
                                      child: TextFormField(
                                        maxLines: null,
                                        expands: true,
                                        keyboardType: TextInputType.multiline,
                                        controller: descripcionVestimenta,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          fillColor: Colors.blue,
                                          labelStyle:
                                              TextStyle(color: Colors.blueGrey),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue),
                                          ),
                                          labelText: 'Descripcion',
                                        ),
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return "Campo vacio";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              key: cantidadkey,
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
                                    child: const Text('Cantidad'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 200,
                                    child: TextFormField(
                                      controller: cantidadVestimenta,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.blue,
                                        labelStyle:
                                            TextStyle(color: Colors.blueGrey),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                        labelText: 'Ingrese Valor',
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
                              key: change,
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
                                    print(arguments['idkey']);
                                    await updatevestimentas(
                                            arguments['idkey'],
                                            nameVestimenta.text,
                                            datostemp,
                                            datostemp2,
                                            datostemprad,
                                            datostempprendas,
                                            descripcionVestimenta.text,
                                            cantidadVestimenta.text)
                                        .then((value) {
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('ACTUALIZAR',
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
