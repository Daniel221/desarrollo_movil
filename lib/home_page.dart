import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _tipCalculation() {
    var costOfService = double.parse(textController.text ?? "0");
    if (selectedRadio == 0) {
      tip = costOfService * 0.20;
    } else if (selectedRadio == 1) {
      tip = costOfService * 0.18;
    } else if (selectedRadio == 2) {
      tip = costOfService * 0.15;
    }

    if (roundTip) {
      tip = tip.ceilToDouble();
    }
  }

  var textController = TextEditingController();
  double tip = 0;
  bool roundTip = false;
  int selectedRadio = 0;
  var radioGroupValues = {
    0: "Amazing 20%",
    1: "Good 18%",
    2: "Okay 15%",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip time'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                controller: textController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Cost of service"),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("How was the service?"),
          ),
          // lista de radio buttons
          Column(
              mainAxisSize: MainAxisSize.min,
              children: radioGroupValues.entries
                  .map(
                    (element) => ListTile(
                      leading: Radio(
                          value: element.key,
                          groupValue: selectedRadio,
                          onChanged: (currentSelectedRadio) {
                            selectedRadio = currentSelectedRadio;
                            setState(() {});
                          }),
                      title: Text("${element.value}"),
                    ),
                  )
                  .toList()),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text("Round up tip"),
            trailing: Switch(
                value: roundTip,
                onChanged: (switchstate) {
                  roundTip = switchstate;
                  setState(() {});
                }),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: MaterialButton(
                    child: Text("CALCULATE",
                        style: TextStyle(color: Colors.grey[200])),
                    onPressed: () {
                      _tipCalculation();
                      setState(() {});
                    },
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Tip amount: \$${tip.toStringAsFixed(2)}"),
            ),
          ),
        ],
      ),
    );
  }
}
