import 'package:autoventas/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:autoventas/logica/driver.dart';

class Balance extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Balance();
  }
}

class _Balance extends State<Balance> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    DateTime now = DateTime.now();
    Map<int, String> MONTH = {
      1: 'Ene',
      2: 'Feb',
      3: 'Mar',
      4: 'Abr',
      5: 'May',
      6: 'Jun',
      7: 'Jul',
      8: 'Ago',
      9: 'Sep',
      10: 'Oct',
      11: 'Nov',
      12: 'Dic'
    };
    var driver=Provider.of<MyProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('BALANCE'),
                RaisedButton(
                    onPressed: () {},
                    child: Text('${now.day}-${MONTH[now.month]}'))
              ]),
        ),
        body: Column(
          children: <Widget>[
            Expanded(flex: 7, child: _list_view()),
            Expanded(
              flex: 1,
              child: Container(
                  color: Colors.blueAccent,
                  width: media.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Flexible(flex: 2, child: Text('TOTAL')),
                      Flexible(flex: 2, child: Text(driver.total)),
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
          title: Text('Este es un producto muy extenso a la forma de escribir'),
          subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[Text('CAN'), Text('Valor')]),
          isThreeLine: true,
          trailing: Text('SUBTOT'),
          leading: Text('IDXX'),
        ),
      ],
    );
  }
}
