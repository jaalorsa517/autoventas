import 'package:autoventas/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
    var driver = Provider.of<MyProvider>(context);
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
            Expanded(
              flex: 7,
              child: FutureBuilder(
                  future: driver.productos_init(),
                  builder: (BuildContext context, AsyncSnapshot<List> snap) {
                    List controllerText = [];
                    if (snap.hasData) {
                      for (int i = 0; i < snap.data.length; i++) {
                        controllerText.add(TextEditingController());
                        controllerText[i].text =
                            driver.productos[i].cantidad.toString();
                      }
                      ;
                      return ListView.builder(
                          itemCount: snap.data.length,
                          itemBuilder: (BuildContext context, int i) {
                            return ListTile(
                              enabled: true,
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext cont) {
                                      controllerText[i].text = driver
                                          .productos[i].cantidad
                                          .toString();
                                      return ListTile(
                                        title: TextField(
                                          controller: controllerText[i],
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          onChanged: (String value) {
                                            driver.productos[i].cantidad =
                                                int.parse(value);
                                          },
                                        ),
                                        leading: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                driver.productos[i].cantidad++;
                                                controllerText[i].text = driver
                                                    .productos[i].cantidad
                                                    .toString();
                                              });
                                            },
                                            icon: Icon(Icons.add)),
                                        trailing: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              driver.productos[i].cantidad--;
                                              controllerText[i].text = driver
                                                  .productos[i].cantidad
                                                  .toString();
                                            });
                                          },
                                          icon: Icon(Icons.remove),
                                        ),
                                      );
                                    });
                              },
                              title: Text(driver.productos[i].nombre),
                              subtitle:
                                  (Text(driver.productos[i].valor.toString())),
                              isThreeLine: true,
                              trailing:
                                  Text(driver.productos[i].cantidad.toString()),
                              leading: Text(driver.productos[i].id),
                            );
                          });
                    } else if (snap.hasError) {
                      print('ERROR ${snap.error.toString()}');
                      List error = List.generate(20, (value) => 'ERROR...');
                      return ListView.builder(
                          itemCount: error.length,
                          itemBuilder: (BuildContext context, int i) {
                            return Text(error[i]);
                          });
                    } else {
                      print('Esperar');
                      List waiting = List.generate(20, (value) => 'WAIT...');
                      return ListView.builder(
                          itemCount: waiting.length,
                          itemBuilder: (BuildContext context, int i) {
                            return Text(waiting[i]);
                          });
                    }
                  }),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  color: Colors.blueAccent,
                  width: media.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(flex: 2, child: Text('TOTAL')),
                      Flexible(flex: 2, child: Text(driver.total)),
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
}
