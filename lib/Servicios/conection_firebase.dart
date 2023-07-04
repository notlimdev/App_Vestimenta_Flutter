import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';

//Base de datos
FirebaseFirestore firestore = FirebaseFirestore.instance;

//Lectura (Select)
Future<List> getVestimentas() async {

  List vestimentas = [];
  try {
    
      CollectionReference reference = firestore.collection("vestimenta");
      QuerySnapshot snapshot = await reference.get();
      for (var e in snapshot.docs) {
        vestimentas.add(e.data());
        
      }
      print(vestimentas);
      print('Datos leidos correctamente');
  } catch (e) {
    print('Error al crear el documento: $e');
  }
  return vestimentas;
}

//Escribir (Insert)
Future<void> addvestimentas(String nombre, List tallas2, List tallas,
    String sexo, List acesorios, String descripcion, String cantidad) async {
  try {
    await firestore.collection("vestimenta").add({
      "nombre": nombre,
      "tallas2": tallas2,
      "tallas": tallas,
      "sexo": sexo,
      "accesorios": acesorios,
      "descripcion": descripcion,
      "cantidad": cantidad
    });
    AlertController.show(
        "Vestimenta Nueva", "Datos Agreados Correctamente!", TypeAlert.success);
  } catch (e) {
    print('Error al crear el documento: $e');
  }
}

Future<void> addclientes(
    String nombres, String apellidos, String dni, String telefono) async {
  try {
    await firestore.collection("cliente").add({
      "nombres": nombres,
      "apellidos": apellidos,
      "dni": dni,
      "telefono": telefono,
    });
    AlertController.show(
        "Nuevo Cliente", "Datos Agreados Correctamente!", TypeAlert.success);
  } catch (e) {
    print('Error al crear el documento: $e');
  }
}
Future<void> addpedidos(String cliente,String vestimenta, Timestamp fechaEntrega, Timestamp fechaDevolucion,List categoria,String cantidad) async {
  try {
    await firestore.collection("pedidos").add({
      "cliente": cliente,
      "vestimenta": vestimenta,
      "fechaEntrega": fechaEntrega,
      "fechaDevolucion": fechaDevolucion,
      "categoria": categoria,
      "cantidad": cantidad
    });
    AlertController.show(
        "Nuevo Pedido", "Datos Agreados Correctamente!", TypeAlert.success);
  } catch (e) {
    print('Error al crear el documento: $e');
  }
}
