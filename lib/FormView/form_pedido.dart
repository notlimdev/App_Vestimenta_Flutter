import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Vestimenta danza',
  'Vestimenta marinera',
  'vestimenta caporal',
  'vestimenta valicha'
];

class FormPedidos extends StatefulWidget {
  const FormPedidos({super.key});

  @override
  State<FormPedidos> createState() => _FormPedidosState();
}

class _FormPedidosState extends State<FormPedidos> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String dropdownValue = list.first;
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
                      child: Column(
                        children: [
                          
                          Container(
                            width: 300,
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:const  BorderSide(
                                        color: Colors.green, width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:const  BorderSide(
                                        color: Colors.green, width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  fillColor: Colors.amber),
                              isExpanded: true,
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 5,
                              style: const TextStyle(
                                color: Colors.deepPurple,
                              ),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          )
                        ],
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
