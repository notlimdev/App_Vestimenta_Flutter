import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Vestimenta danza',
  'Vestimenta marinera',
  'vestimenta caporal',
  'vestimenta valicha'
];

class FormVestiment extends StatefulWidget {
  const FormVestiment({super.key});

  @override
  State<FormVestiment> createState() => _FormVestimentState();
}

enum SingingCharacter { lafayette, jefferson }

class _FormVestimentState extends State<FormVestiment> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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

SingingCharacter? _character = SingingCharacter.lafayette;


  bool isCheckedL = false;
  bool isCheckedM = false;
  bool isCheckedS = false;



  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
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
                                //controller: correocontroller,
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
                              child: TextFormField(
                                //controller: passwordcontroller,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.blue,
                                  labelStyle: TextStyle(color: Colors.blueGrey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  labelText: 'Tipo de Vestimenta',
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
                              margin: const EdgeInsets.fromLTRB(8, 20, 8, 20),
                              child: Row(
                                children: [
                                  const Text('Talla S',
                                      style: TextStyle(color: Colors.blueGrey)),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor: MaterialStateProperty.resolveWith(
                                        getColor),
                                    value: isCheckedS,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isCheckedS = value!;
                                      });
                                    },
                                  ),
                                  const Text('Talla M',
                                      style: TextStyle(color: Colors.blueGrey)),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor: MaterialStateProperty.resolveWith(
                                        getColor),
                                    value: isCheckedM,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isCheckedM = value!;
                                      });
                                    },
                                  ),
                                  const Text('Talla L',style: TextStyle(color: Colors.blueGrey)),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor: MaterialStateProperty.resolveWith(
                                        getColor),
                                    value: isCheckedL,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isCheckedL = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,
                                )
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: const Text('Hombre',
                                        style: TextStyle(color: Colors.blueGrey)),
                                    leading: Radio<SingingCharacter>(
                                      value: SingingCharacter.lafayette,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text('Mujer',
                                        style: TextStyle(color: Colors.blueGrey)),
                                    leading: Radio<SingingCharacter>(
                                      value: SingingCharacter.jefferson,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                color: Colors.blue,
                              )
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const  EdgeInsets.all(10),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Accesorios',
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                                    child: SizedBox(
                                      height: 200,
                                      child: TextFormField(
                                        maxLines: null,
                                        expands: true,
                                        keyboardType: TextInputType.multiline,
                                        //controller: passwordcontroller,
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
                              margin: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,
                                )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: const Text('Cantidad'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 200,
                                    child: TextFormField(
                                      //controller: passwordcontroller,
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
                                        onPressed: () {},
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text('GUARDAR',style: TextStyle(fontFamily: 'Ultra' )),
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
