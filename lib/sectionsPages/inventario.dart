import 'package:app_vestimenta/CodPruebas/listdataclientes.dart';
import 'package:app_vestimenta/CodPruebas/listdatapedidos.dart';
import 'package:flutter/material.dart';

import '../CodPruebas/list_data_vestimentas.dart';


List<String> titles = <String>[
  'Vestimentas',
  'Pedidos',
  'Clientes',
];

class Inventario extends StatefulWidget {
  const Inventario({super.key});
  @override
  State<Inventario> createState() => _InventarioState();
}
class _InventarioState extends State<Inventario> {
  bool filledSelected = false;
@override
  @override
  Widget build(BuildContext context) {
    const int tabsCount = 3;
    return DefaultTabController(
      initialIndex: 0,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Pedidos Y Vestimentas'),
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.dry_cleaning),
                text: titles[0],
              ),
              Tab(
                icon: const Icon(Icons.checklist_outlined),
                text: titles[1],
              ),
              Tab(
                icon: const Icon(Icons.people_alt_rounded),
                text: titles[2],
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
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
                child: const Stack(
                  children: [
                    TabBarView(children: [
                      ListaDataVestimenta(),
                      ListaDataPedidos(),
                      ListaDataClientes(),
                    ])
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
