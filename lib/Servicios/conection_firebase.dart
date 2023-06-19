import 'package:cloud_firestore/cloud_firestore.dart';

//Base de datos
FirebaseFirestore firestore = FirebaseFirestore.instance;

//Lectura (Select)
Future<List> getVestimentas() async {
  List vestimentas = [];
  CollectionReference reference = firestore.collection("vestimentas");
  QuerySnapshot snapshot = await reference.get();
  for (var e in snapshot.docs) {
    vestimentas.add(e.data());
  }
  return vestimentas;
}

//Escribir (Insert)
Future<void> insCategorias(String nombre, String descripcion) async {
  await firestore
      .collection("categorias")
      .add({"nombre": nombre, "descripcion": descripcion});
}
