import 'package:flutter/material.dart';
import 'package:app_vestimenta/Servicios/conection_firebase.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ListaDataVestimenta extends StatefulWidget {
  const ListaDataVestimenta({super.key});

  @override
  State<ListaDataVestimenta> createState() => _ListaDataVestimentaState();
}

class _ListaDataVestimentaState extends State<ListaDataVestimenta> {
  final ScrollController _firstController = ScrollController();

  List<dynamic> accesorios = [];
  bool filledSelected = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getVestEspesific(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.hasError) {
              AlertController.show("Datos No Disponibles", "Error de Servidor!",
                  TypeAlert.error);
            }

            return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Row(
                children: <Widget>[
                  SizedBox(
                      width: constraints.maxWidth,
                      child: Scrollbar(
                        thumbVisibility: true,
                        controller: _firstController,
                        child: ListView.builder(
                            controller: _firstController,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(242, 17, 157, 221),
                                        Color.fromARGB(185, 242, 242, 243),
                                      ],
                                      // begin: Alignment.bottomLeft,
                                      // end: Alignment.bottomRight
                                    ),
                                  ),
                                  height: 80,
                                  margin: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://cdn-icons-png.flaticon.com/512/2790/2790087.png"),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(snapshot.data?[index]['nombre'],
                                              style: const TextStyle(
                                                  fontFamily: 'Ultra',
                                                  fontSize: 10)),
                                          Text(
                                            snapshot.data?[index]['cantidad'] +
                                                'Ud',
                                            style: const TextStyle(fontSize: 8),
                                          ),
                                        ],
                                      ),
                                      FloatingActionButton.small(
                                        heroTag: UniqueKey(),
                                        elevation: 3,
                                        onPressed: () async {
                                          accesorios = snapshot.data?[index]
                                              ['accesorios'];
                                          Alert(
                                              context: context,
                                              title: snapshot.data?[index]
                                                  ['nombre'],
                                              content: Column(
                                                children: [
                                                  const Row(
                                                    children: [
                                                      Icon(Icons.dry_cleaning),
                                                      Text(
                                                          'Acesorios Adquiridos'),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: accesorios
                                                        .map((dynamic e) {
                                                      return Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                Icons.check,
                                                                color: Colors
                                                                    .green,
                                                              ),
                                                              Text(
                                                                  e.toString()),
                                                            ],
                                                          )
                                                        ],
                                                      );
                                                    }).toList(),
                                                  ),
                                                ],
                                              ),
                                              buttons: [
                                                DialogButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: const Text(
                                                    "Cerrar",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                )
                                              ]).show();
                                        },
                                        child: const Icon(
                                            Icons.remove_red_eye_outlined),
                                      ),
                                      FloatingActionButton.small(
                                        heroTag: UniqueKey(),
                                        elevation: 3,
                                        onPressed: () async {
                                          await Navigator.pushNamed(
                                              context, "/editformvestimenta",
                                              arguments: {
                                                "idkey": snapshot.data?[index]
                                                    ['idkey'],
                                                "nombre": snapshot.data?[index]
                                                    ['nombre'],
                                                "tallas": snapshot.data?[index]
                                                    ['tallas'],
                                                "sexo": snapshot.data?[index]
                                                    ['sexo'],
                                                "accesorios": snapshot
                                                    .data?[index]['accesorios'],
                                                "descripcion":
                                                    snapshot.data?[index]
                                                        ['descripcion'],
                                                "cantidad": snapshot
                                                    .data?[index]['cantidad'],
                                              });
                                        },
                                        child: const Icon(Icons.edit_document),
                                      ),
                                      FloatingActionButton.small(
                                        heroTag: UniqueKey(),
                                        elevation: 3,
                                        onPressed: () async {
                                          await Alert(
                                            context: context,
                                            type: AlertType.warning,
                                            title: snapshot.data?[index]
                                                ['nombre'],
                                            desc: "!Estas Seguro de eliminar?.",
                                            buttons: [
                                              DialogButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                color: const Color.fromRGBO(
                                                    0, 179, 134, 1.0),
                                                child: const Text(
                                                  "No, Cancelar",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              DialogButton(
                                                onPressed: () async {
                                                  
                                                  await deletevestimenta(
                                                          snapshot.data?[index]
                                                              ['idkey'])
                                                      .then((value) {
                                                    Navigator.pop(context);
                                                  });
                                                  
                                                  setState(() {
                                                    
                                                    snapshot.data
                                                        ?.removeAt(index);
                                                  });
                                                },
                                                gradient: const LinearGradient(
                                                    colors: [
                                                      Color.fromRGBO(
                                                          116, 116, 191, 1.0),
                                                      Color.fromRGBO(
                                                          52, 138, 199, 1.0)
                                                    ]),
                                                child: const Text(
                                                  "Si, Eliminar",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                              )
                                            ],
                                          ).show();
                                        },
                                        child: const Icon(
                                            Icons.delete_forever_rounded),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )),
                ],
              );
            });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
