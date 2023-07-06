import 'package:app_vestimenta/Servicios/conection_firebase.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FormPedidos extends StatefulWidget {
  const FormPedidos({super.key});

  @override
  State<FormPedidos> createState() => _FormPedidosState();
}

class _FormPedidosState extends State<FormPedidos> {
  var _currentSelectedDate1 = DateTime(2023,7,7,0);
  var _currentSelectedDate2 = DateTime(2023, 7, 7, 0);
  void callDatePicker() async {
    DateTime? selectedDate = await getDatePickerWidget();
    setState(() {
      _currentSelectedDate1 = selectedDate!;

    });
  }

  void callDatePicker2() async { 
    DateTime? selectedDate = await getDatePickerWidget();
    setState(() {
      _currentSelectedDate2 = selectedDate!;
    });
  }

  Future<DateTime?> getDatePickerWidget() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2026),
      builder: (context, child) {
        return Theme(
            data: ThemeData.from(
                colorScheme:
                    ColorScheme.fromSwatch(primarySwatch: Colors.purple)),
            child: child!);
      },
    );
  }

  final List<String> clientes = [
    'Juan Rebosio',
    'Pedro Picapiedra',
    'Luis Velez',
    'Paris Torres',
    'JUanita Deris',
    'Carlos terrero',
    'Luisa Cavero',
    'Andres Jazz',
    'Lorena Sanchez',
  ];
  final List<String> vestimentas = [
    'Los Shapis',
    'Marinera',
    'Tango',
    'Carnaval de cajamarca',
    'Carnaval de Cusco',
    'Saras Pillu',
    'Festejo',
    'Danza de las Tijeras',
    'Huaylarsh',
  ];
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController userCliente = TextEditingController();
  TextEditingController listVestimentas = TextEditingController();
  TextEditingController cantidadcontroller = TextEditingController();

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

  List<Map> tallas = [
    {"name": "Concurso", "isChecked": false},
    {"name": "Luces", "isChecked": false},
    {"name": "presentación", "isChecked": false}
  ];
  bool isChecked = false;
  final datostemp = [];
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
                                      controller: userCliente,
                                      suggestions: clientes
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
                                      onPressed: () {
                                        Alert(
                                            context: context,
                                            title: "Nuevo usuario",
                                            content: const Column(
                                              children: <Widget>[
                                                TextField(
                                                  decoration: InputDecoration(
                                                    icon: Icon(
                                                        Icons.account_circle),
                                                    labelText: 'Nombre',
                                                  ),
                                                ),
                                                TextField(
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                    icon: Icon(Icons.lock),
                                                    labelText: 'Apellidos',
                                                  ),
                                                ),
                                                TextField(
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                    icon: Icon(Icons.lock),
                                                    labelText: 'DNI',
                                                  ),
                                                ),
                                                TextField(
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                    icon: Icon(Icons.lock),
                                                    labelText: 'Telefono',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            buttons: [
                                              DialogButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text(
                                                  "Guardar Cliente",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              )
                                            ]).show();
                                      },
                                      child: const Text("Nuevo"))
                                ],
                              ),
                            ),
                            //Busqueda de Vestimenta
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
                                    child: const Text('Vestimenta'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 240,
                                    child: SearchField(
                                      controller: listVestimentas,
                                      hint: 'Buscar Vestimenta',
                                      suggestions: vestimentas
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
                                    child: const Text('Entrega'),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.all(10),
                                          width: 200,
                                          child: ElevatedButton(
                                              onPressed: callDatePicker,
                                              child: const Text(
                                                  'Seleciona la Fecha'))),
                                      Text(_currentSelectedDate1.toString())
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //fecha de Decolución
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
                                    child: const Text('Devolución'),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.all(10),
                                          width: 200,
                                          child: ElevatedButton(
                                              onPressed: callDatePicker2,
                                              child: const Text(
                                                  'Seleciona la Fecha'))),
                                      Text(_currentSelectedDate2.toString())
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // tipo de Traje
                            Container(
                              margin: const EdgeInsets.fromLTRB(8, 20, 8, 20),
                              child: Row(
                                  children: tallas.map((elemento) {
                                return Expanded(
                                  child: CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    value: elemento['isChecked'],
                                    onChanged: (val) {
                                      setState(() {
                                        elemento['isChecked'] = val;
                                        if (elemento['isChecked'] == true) {
                                          datostemp.add(elemento['name']);
                                        } else {
                                          datostemp.remove(elemento['name']);
                                          print(datostemp);
                                        }
                                      });
                                    },
                                    title: Text(
                                      elemento['name'],
                                      style: const TextStyle(fontSize: 9),
                                    ),
                                  ),
                                );
                              }).toList()),
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
                                    child: const Text('Cantidad'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 200,
                                    child: TextFormField(
                                      controller: cantidadcontroller,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.blue,
                                        labelStyle:
                                            TextStyle(color: Colors.blueGrey),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                        labelText: 'N°',
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
                                    // print(userCliente.text);
                                    // print(listVestimentas.text);
                                    // print(_currentSelectedDate1);
                                    // print(_currentSelectedDate2);
                                    // print(datostemp);
                                    // print(cantidadcontroller.text);
                                    await addpedidos(
                                            userCliente.text,
                                            listVestimentas.text,
                                            _currentSelectedDate1,
                                            _currentSelectedDate2,
                                            datostemp,
                                            cantidadcontroller.text)
                                        .then((value) {
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('GUARDAR PEDIDO',
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
