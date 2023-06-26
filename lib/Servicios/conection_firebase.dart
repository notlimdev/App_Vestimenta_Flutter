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
Future<void> addvestimentas(String nombre, String tipo, List tallas,String sexo, String descripcion,String cantidad) async {
   await firestore
      .collection("vestimenta")
      .add({"nombre": nombre, "tipo": tipo,"tallas":tallas,"sexo":sexo,"descripcion":descripcion,"cantidad":cantidad});
}
Future<void> addclientes(String nombres, String apellidos, String dni,
    String telefono) async {
  await firestore.collection("cliente").add({
    "nombres": nombres,
    "apellidos": apellidos,
    "dni": dni,
    "telefono": telefono,
    
  });
}

