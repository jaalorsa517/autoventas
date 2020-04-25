import 'package:flutter/material.dart';
import 'package:autoventas/logica/driver.dart';

class MyProvider with ChangeNotifier {
  String total = '0';
  ModelProducto _producto = ModelProducto();
  List productos = [];

  Myprovider() async {
    bool resul = await _producto.conectar();
    if (resul) {
      productos = await _producto.getProductos();
    } else {
      print('Conexion no realizada');
      productos = [];
    }
  }

  Future<List> productos_init() async {
    return productos;
  }

  notifyListeners();
}
