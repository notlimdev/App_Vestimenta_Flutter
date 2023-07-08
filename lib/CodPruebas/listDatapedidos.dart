import 'package:flutter/material.dart';
import 'package:app_vestimenta/Servicios/conection_firebase.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';

class ListaDataPedidos extends StatefulWidget {
  const ListaDataPedidos({super.key});

  @override
  State<ListaDataPedidos> createState() => _ListaDataPedidosState();
}

class _ListaDataPedidosState extends State<ListaDataPedidos> {
  final ScrollController _firstController = ScrollController();

  bool filledSelected = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPedidos(),
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
                                      const Icon(Icons.check_box,
                                          size: 30,
                                          color:
                                              Color.fromARGB(255, 6, 143, 17)),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text('Entregado ',
                                              style: TextStyle(
                                                  fontFamily: 'Ultra',
                                                  fontSize: 10)),
                                          Text(
                                            snapshot.data?[index]['vestimenta'],
                                            style: const TextStyle(fontSize: 8),
                                          ),
                                        ],
                                      ),
                                      FloatingActionButton.small(
                                        elevation: 3,
                                        onPressed: () {},
                                        child: const Icon(
                                            Icons.remove_red_eye_outlined),
                                      ),
                                      FloatingActionButton.small(
                                        elevation: 3,
                                        onPressed: () {},
                                        child: const Icon(Icons.edit_document),
                                      ),
                                      FloatingActionButton.small(
                                        elevation: 3,
                                        onPressed: () {},
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
