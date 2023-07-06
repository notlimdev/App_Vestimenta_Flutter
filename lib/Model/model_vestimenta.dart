import 'package:cloud_firestore/cloud_firestore.dart';

class VestimentaModel {
  final String? id;
  final String nombre;
  final List tallas;
  final String sexo;
  final List accesorios;
  final String descripcion;
  final String cantidad;

  const VestimentaModel({
    this.id,
    required this.nombre,
    required this.accesorios,
    required this.tallas,
    required this.sexo,
    required this.descripcion,
    required this.cantidad,
  });

  toJson() {
    return {
      "nombre": nombre,
      "tallas ": tallas,
      "sexo": sexo,
      "accesorios": accesorios,
      "descripcion": descripcion,
      "cantidad": cantidad
    };
  }

  factory VestimentaModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return VestimentaModel(
      id: document.id,
      nombre: data["nombre"],
      tallas: ["tallas"],
      sexo: data["sexo"],
      accesorios: data["accesorios"],
      descripcion: data["descripcion"],
      cantidad: data["cantidad"],
    );
  }
}
