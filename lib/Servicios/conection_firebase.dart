import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';

//Base de datos
FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<List> getVestEspesific() async {
  List vestimentas = [];
  try {
    CollectionReference reference = firestore.collection("vestimenta");
    QuerySnapshot snapshot = await reference.get();
    for (var e in snapshot.docs) {
      final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

      final vestiment = {
        "nombre": data["nombre"],
        "idkey": e.id,
        "cantidad": data["cantidad"],
        "accesorios": data["accesorios"],
        "tallas": data["tallas"],
        "descripcion": data["descripcion"],
        "sexo": data["sexo"],
      };
      vestimentas.add(vestiment);
    }
    print('Datos leidos correctamente');
  } catch (e) {
    print('Error al crear el documento: $e');
  }
  return vestimentas;
}

//Lectura (Select)
Future<List> getVestimentas() async {
  List vestimentas = [];
  try {
    CollectionReference reference = firestore.collection("vestimenta");
    QuerySnapshot snapshot = await reference.get();
    for (var e in snapshot.docs) {
      vestimentas.add(e.data());
    }
    print('Datos leidos correctamente');
  } catch (e) {
    print('Error al crear el documento: $e');
  }
  return vestimentas;
}

Future<List> getPedidos() async {
  List pedidos = [];
  CollectionReference reference = firestore.collection("pedidos");
  QuerySnapshot snapshot = await reference.get();
  try {
    for (var e in snapshot.docs) {
      final Map<String, dynamic> data = e.data() as Map<String, dynamic>;
      final Map<String, dynamic> pedidoData = {
        "idkey": e.id,
        "cliente": data['cliente'],
        "vestimenta": data['vestimenta'],
        "fechaEntrega":  data['fechaEntrega'],
        "fechaDevolucion": data['fechaDevolucion'],
        "categoria": data['categoria'],
        "cantidad": data['cantidad']
      };

      pedidos.add(pedidoData);
    }
  } catch (e) {
    print('Error al crear el documento: $e');
  }
  return pedidos;
}

Future<List> getClientes() async {
  List vestimentas = [];
  try {
    CollectionReference reference = firestore.collection("cliente");
    QuerySnapshot snapshot = await reference.get();
    for (var e in snapshot.docs) {
      vestimentas.add(e.data());
    }
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

Future<void> addpedidos(
    String cliente,
    String vestimenta,
    DateTime fechaEntrega,
    DateTime fechaDevolucion,
    List categoria,
    String cantidad) async {
  try {
    final Map<String, dynamic> pedidoData = {
      "cliente": cliente,
      "vestimenta": vestimenta,
      "fechaEntrega": Timestamp.fromDate(fechaEntrega),
      "fechaDevolucion": Timestamp.fromDate(fechaDevolucion),
      "categoria": categoria,
      "cantidad": cantidad
    };
    await firestore.collection("pedidos").add(pedidoData);
    AlertController.show(
        "Nuevo Pedido", "Datos Agreados Correctamente!", TypeAlert.success);
  } catch (e) {
    print('Error al crear el documento: $e');
  }
}

Future<void> updatevestimentas(
    String idkey,
    String nombre,
    List tallas2,
    List tallas,
    String sexo,
    List acesorios,
    String descripcion,
    String cantidad) async {
  try {
    //await firestore.collection("vestimenta").add({
    final Map<String, dynamic> trajeDataupdate = {
      "nombre": nombre,
      "tallas2": tallas2,
      "tallas": tallas,
      "sexo": sexo,
      "accesorios": acesorios,
      "descripcion": descripcion,
      "cantidad": cantidad
    };
    await firestore.collection("vestimenta").doc(idkey).set(trajeDataupdate);
    //});
    AlertController.show("Vestimenta Actualizada",
        "Datos actualizados Correctamente!", TypeAlert.success);
  } catch (e) {
    print('Error al actualizar el documento: $e');
  }
}

Future<void> deletevestimenta(
  String idkey,
) async {
  try {
    await firestore.collection("vestimenta").doc(idkey).delete();
    //});
    AlertController.show("Vestimenta Eliminada", "Datos Eliminados Correctamente!",
        TypeAlert.success);
  } catch (e) {
    print('Error al Eliminar el documento: $e');
  }
}
//pedidos
Future<void> updatepedidos(
    String idkey,
    String cliente,
    String vestimenta,
    DateTime fechaEntrega,
    DateTime fechaDevolucion,
    List categoria,
    String cantidad) async {
  try {
    //await firestore.collection("vestimenta").add({
     final Map<String, dynamic> pedidoData = {
      "cliente": cliente,
      "vestimenta": vestimenta,
      "fechaEntrega": Timestamp.fromDate(fechaEntrega),
      "fechaDevolucion": Timestamp.fromDate(fechaDevolucion),
      "categoria": categoria,
      "cantidad": cantidad
    };
    await firestore.collection("pedidos").doc(idkey).set(pedidoData);
    //});
    AlertController.show("Pedido Actualizado",
        "Datos actualizados Correctamente!", TypeAlert.success);
  } catch (e) {
    print('Error al actualizar el documento: $e');
  }
}

Future<void> deletepedidos(
  String idkey,
) async {
  try {
    await firestore.collection("pedidos").doc(idkey).delete();
    //});
    AlertController.show("Pedido Eliminada",
        "Datos Eliminados Correctamente!", TypeAlert.success);
  } catch (e) {
    print('Error al Eliminar el documento: $e');
  }
}
