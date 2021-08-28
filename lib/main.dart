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

class LikeWidget extends StatefulWidget {
  const LikeWidget({Key? key}) : super(key: key);

  @override
  _LikeWidgetState createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  int _likeCount = 10;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: (const Icon(Icons.thumb_up)),
          color: Colors.indigo,
          onPressed: () => {
            setState(() {
              _likeCount += 1;
            })
          },
        ),
        IconButton(
          icon: (const Icon(Icons.thumb_down)),
          color: Colors.grey,
          onPressed: () => {
            setState(() {
              _likeCount -= 1;
            })
          },
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_likeCount'),
          ),
        ),
      ],
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
        // Placeholder(
        //   fallbackHeight: 280,
        // ),
        Image.network(
            "https://cruce.iteso.mx/wp-content/uploads/sites/123/2015/11/Estatuto.jpg"),

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
            LikeWidget(),
          ],
        ),
        //Fila
        ContactRow(),
        Container(height: 40),
        Text(
          "El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara",
          textAlign: TextAlign.justify,
        ),
      ]),
    );
  }
}

class ContactRow extends StatefulWidget {
  const ContactRow({Key? key}) : super(key: key);

  @override
  _ContactRowState createState() => _ContactRowState();
}

class _ContactRowState extends State<ContactRow> {
  bool _mailState = false;
  bool _callState = false;
  bool _routeState = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            IconButton(
              icon: (Icon(
                Icons.mail,
                color: _mailState ? Colors.black : Colors.blue,
              )),
              iconSize: 50,
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Mostrando mails")));
                setState(() {
                  _mailState = !_mailState;
                });
              },
            ),
            Text("Correo")
          ],
        ),
        Column(
          children: [
            IconButton(
              icon: Icon(
                Icons.call,
                color: _callState ? Colors.black : Colors.blue,
              ),
              iconSize: 50,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Mostrando llamadas")));
                setState(() {
                  _callState = !_callState;
                });
              },
            ),
            Text("Llamada")
          ],
        ),
        Column(
          children: [
            IconButton(
              icon: Icon(
                Icons.directions,
                color: _routeState ? Colors.black : Colors.blue,
              ),
              iconSize: 50,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Mostrando llamadas")));
                setState(() {
                  _routeState = !_routeState;
                });
              },
            ),
            Text("Ruta")
          ],
        ),
      ],
    );
  }
}
