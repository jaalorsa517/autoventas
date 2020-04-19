import 'package:flutter/material.dart';
import 'package:autoventas/screens/resumen.dart';

class Ventas extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('VENTA'),),
      // bottomSheet: BottomSheet(onClosing: null, builder: (context)=>Resumen())
    );
  }

}