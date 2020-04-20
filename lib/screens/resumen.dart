import 'package:flutter/material.dart';

class Resumen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Resumen();
  }
}

class _Resumen extends State<Resumen> {
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
    return Scaffold(
        appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('RESUMEN'),
                Text('${now.day}-${MONTH[now.month]}')
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(flex: 2, child: Text('TOTAL')),
                      Flexible(flex: 2, child: Text('999999')),
                      Flexible(
                          flex: 1,
                          child: IconButton(
                              icon: Icon(Icons.assignment_turned_in),
                              onPressed: () {}))
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
                    onTap: () {},
                    title: Text(
                      'ELIMINAR PRODUCTO',
                      textAlign: TextAlign.center,
                    ),
                  );
                });
          },
          title: Text('Este es un producto muy extenso a la forma de escribir'),
          subtitle: (Text('CANTIDAD')),
          isThreeLine: true,
          trailing: Text('SUBTOT'),
          leading: Text('IDXX'),
        ),
      ],
    );
  }
}
