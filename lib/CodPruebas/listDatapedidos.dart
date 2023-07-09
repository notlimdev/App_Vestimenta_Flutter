import 'package:flutter/material.dart';
import 'package:app_vestimenta/Servicios/conection_firebase.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ListaDataPedidos extends StatefulWidget {
  const ListaDataPedidos({super.key});

  @override
  State<ListaDataPedidos> createState() => _ListaDataPedidosState();
}

class _ListaDataPedidosState extends State<ListaDataPedidos> {
  final ScrollController _firstController = ScrollController();
  List<dynamic> tipoves = [];
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
                                        heroTag: Text('btn1'),
                                        elevation: 3,
                                        onPressed: () async {
                                          DateTime fe = snapshot.data?[index]
                                                  ['fechaEntrega']
                                              .toDate();
                                          DateTime fv = snapshot.data?[index]
                                                  ['fechaDevolucion']
                                              .toDate();
                                          tipoves = snapshot.data?[index]
                                              ['categoria'];
                                          Alert(
                                              context: context,
                                              title: 'Datos de pedido',
                                              content: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                        const Row(
                                                          children: [
                                                              Icon(
                                                                  Icons.person),
                                                             Text('Cliente: '),
                                                          ],
                                                        ),
                                                        Text( snapshot.data?[ index]['cliente'])
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          const Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .dry_cleaning),
                                                              Text('Vestimenta: ' ),
                                                            ],
                                                          ),
                                                          Text(snapshot.data?[index]['vestimenta']),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.date_range),
                                                      Column(
                                                        children: [
                                                          const Text(
                                                              // ignore: prefer_interpolation_to_compose_strings
                                                              'Fecha Entrega:'),
                                                          Text(
                                                              // ignore: prefer_interpolation_to_compose_strings
                                                              '$fe'),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.date_range),
                                                      Column(
                                                        children: [
                                                          const Text(
                                                              // ignore: prefer_interpolation_to_compose_strings
                                                              'Fecha Devolución:'),
                                                          Text(
                                                              // ignore: prefer_interpolation_to_compose_strings
                                                              '$fv'),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  const Text('Tipo de Vestimenta:'),
                                                  Column(
                                                    children: tipoves
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
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.date_range),
                                                      Text(
                                                          // ignore: prefer_interpolation_to_compose_strings
                                                          'cantidad: ' +
                                                              snapshot.data?[
                                                                      index]
                                                                  ['cantidad']),
                                                    ],
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
                                        heroTag: Text('btn2'),
                                        elevation: 3,
                                        onPressed: () async{
                                           await Navigator.pushNamed(
                                              context, "/editformpedido",
                                              arguments: {
                                                "idkey": snapshot.data?[index]
                                                    ['idkey'],
                                                "cliente": snapshot.data?[index]
                                                    ['cliente'],
                                                "vestimenta": snapshot.data?[index]
                                                    ['vestimenta'],
                                                "fechaEntrega": snapshot.data?[index]
                                                    ['fechaEntrega'],
                                                "fechaDevolucion": snapshot
                                                    .data?[index]['fechaDevolucion'],
                                                "categoria":
                                                    snapshot.data?[index]
                                                        ['categoria'],
                                                "cantidad": snapshot
                                                    .data?[index]['cantidad'],
                                              });
                                        },
                                        child: const Icon(Icons.edit_document),
                                      ),
                                      FloatingActionButton.small(
                                        heroTag: Text('btn3'),
                                        elevation: 3,
                                        onPressed: () async{

                                          await Alert(
                                            context: context,
                                            type: AlertType.warning,
                                            title: "!Pedido",
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
                                                      fontSize: 20),
                                                ),
                                              ),
                                              DialogButton(
                                                onPressed: () async {
                                                  await deletepedidos(
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
                                                      fontSize: 20),
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
