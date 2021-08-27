import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App ITESO'),
      ),
      body: ListView(children: [
        //permite scroll cuando hay overflow
        //Imagen
        Placeholder(
          fallbackHeight: 280,
        ),
        // Image.network(
        //     "https://cruce.iteso.mx/wp-content/uploads/sites/123/2015/11/Estatuto.jpg")
        //Fila
        Container(height: 30),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ITESO, Universidad Jesuita de Guadalajara",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "San Pedro Tlaquepaque",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  print("Clic like");
                },
                icon: Icon(
                  Icons.thumb_up,
                  color: Colors.indigo,
                )),
            Text("9999"),
          ],
        ),
        //Fila
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(
                  Icons.mail,
                  size: 50,
                ),
                Text("Correo")
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.call,
                  size: 50,
                ),
                Text("Llamada")
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.directions,
                  size: 50,
                ),
                Text("Ruta")
              ],
            ),
          ],
        ),
        Container(height: 40),
        Text(
          "El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara",
          textAlign: TextAlign.justify,
        ),
      ]),
    );
  }
}
