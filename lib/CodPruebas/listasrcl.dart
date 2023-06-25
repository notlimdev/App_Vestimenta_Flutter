import 'package:flutter/material.dart';

class ListaPedidosSrcl extends StatefulWidget {
  const ListaPedidosSrcl({super.key});

  @override
  State<ListaPedidosSrcl> createState() => _ListaPedidosSrclState();
}

class _ListaPedidosSrclState extends State<ListaPedidosSrcl> {
  final ScrollController _firstController = ScrollController();

  /*final btnlistOrders = <Widget> [
    const Column(
      children:[
        Row(
          children: [
            Icon(Icons.check_box),
            Text('Traje Danza '),
            Text('Traje Marinera'),
            Icon(Icons.remove_red_eye_outlined),
            Icon(Icons.edit),
            Icon(Icons.delete_forever_rounded)
          ],
        ),
      ],
    ),
  ];*/


  bool filledSelected = false;
  @override
  Widget build(BuildContext context) {
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
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.check_box,
                                  size: 30, color: Color.fromARGB(255, 6, 143, 17)),
                              const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Text('Entregado ',style: TextStyle(fontFamily: 'Ultra',fontSize: 10)),
                                  Text('Traje Marinera',style: TextStyle(fontSize: 8),),
                                ],
                              ),

                              FloatingActionButton.small(
                                elevation: 3,
                                onPressed: (){},
                                child: const  Icon(
                                  Icons.remove_red_eye_outlined
                                ),
                              ),
                              FloatingActionButton.small(
                                elevation: 3,
                                onPressed: () {},
                                child:
                                    const Icon(Icons.edit_document),
                              ),
                              FloatingActionButton.small(
                                elevation: 3,
                                onPressed: (){},
                                child: const  Icon(
                                  Icons.delete_forever_rounded
                                ),
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
  }
}
