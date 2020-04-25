import 'dart:io';

import 'package:autoventas/logica/modelo.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ModelProducto {
  Database db;
  bool _sw = false;

  Future<bool> conectar([String name = 'autoventasDB.db']) async {
    try {
      String db_path = join(await getDatabasesPath(), name);

      if (!_sw) {
        //COPIAR LA BASE DE DATOS DESDE EL RECURSO
        ByteData data = await rootBundle.load('data/$name');
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(db_path).writeAsBytes(bytes);
        _sw = true;
      }

      this.db = await openDatabase(db_path);
      return true;
    } catch (Exception) {
      print('EXCEPTION EN CONECTAR ${Exception.toString()}');

      return false;
    }
  }

  Future<List> getProductos() async {
    bool conexion = await conectar();
    if (conexion) {
      List list = await this.db.query('producto');
      List _list = queryToProducto(list);
      return _list;
    } else {
      return null;
    }
  }

  List queryToProducto(List list) {
    List productos = [];
    list.forEach((dato) {
      productos.add(Producto(
          dato['_id'], dato['id'], dato['nombre'], dato['valor'], dato['iva']));
    });
    return productos;
  }
}
