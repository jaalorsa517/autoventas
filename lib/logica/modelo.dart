class Producto {
  int id_;
  String id;
  String nombre;
  int valor;
  int iva;
  int cantidad;

  Producto(this.id_, this.id, this.nombre, this.valor, this.iva,[this.cantidad=0]);
}

class Pedidos {
  int con;
  String fecha;
  int idProducto;
  int cantidad;

  Pedidos(this.con, this.fecha, this.idProducto, this.cantidad);
}

class Intermedia {
  int idPedidos;
  int idProducto;

  Intermedia(this.idPedidos, this.idProducto);
}
