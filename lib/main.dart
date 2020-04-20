import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/balance.dart';
import 'screens/resumen.dart';
import 'screens/ventas.dart';
import 'package:flutter/material.dart';

void main() => runApp(AutoventaApp());

class AutoventaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('es')],
      title: 'AutoVenta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/ventas': (context) => Ventas(),
        '/balance': (context) => Balance(),
        '/resumen': (context) => Resumen()
      },
      home: MyHomePage(title: 'AutoVenta'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('INICIO')),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              color: Colors.blueAccent,
              onPressed: () => Navigator.pushNamed(context, '/ventas'),
              child: Text('VENTAS')),
          RaisedButton(
              color: Colors.blueAccent,
              onPressed: () => Navigator.pushNamed(context, '/balance'),
              child: Text('BALANCE'))
        ],
      )),
    );
  }
}
