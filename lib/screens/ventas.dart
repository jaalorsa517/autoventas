import 'package:flutter/material.dart';

class Ventas extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Ventas();
  }
}

class _Ventas extends State<Ventas> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('VENTA'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(labelText: 'FILTRO'),
                )),
            Expanded(flex: 7, child: _list_view()),
            Expanded(
              flex: 1,
              child: Container(
                  color: Colors.blueAccent,
                  width: media.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(flex: 2, child: Text('TOTAL')),
                      Flexible(flex: 2, child: Text('999999')),
                      Flexible(
                          flex: 1,
                          child: IconButton(
                              icon: Icon(Icons.shopping_cart),
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/resumen')))
                    ],
                  )),
            )
          ],
        ));
  }

  Widget _list_view() {
    return ListView(
      children: <Widget>[
        ListTile(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ListTile(
                    title: TextField(
                      decoration: InputDecoration(labelText: 'Cantidad'),
                      textAlign: TextAlign.center,
                    ),
                    leading:
                        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                    trailing:
                        IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                  );
                });
          },
          title: Text('Este es un producto muy extenso a la forma de escribir'),
          subtitle: (Text('Precio')),
          isThreeLine: true,
          trailing: Text('CanXX'),
          leading: Text('IDXX'),
        ),
      ],
    );
  }
}
