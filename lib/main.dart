import 'package:flutter/material.dart';

void main() => (runApp(new MaterialApp(
      title: "Weight on planet X",
      theme: ThemeData.light(),
      home: new wopx(),
    )));

class wopx extends StatefulWidget {
  // class weight on planet v (wopx)
  @override
  _wopxState createState() => _wopxState();
}

class _wopxState extends State<wopx> {
  final TextEditingController _weight_coltroller = new TextEditingController();
  int radio_value = 0;
  double _final_result = 0.0;
  double facteur_pluto = 0.06, facteur_mars = 0.38, facteur_venus = 0.91;
  String _planet = "";

  void on_chaged_radio_value(int value) {
    setState(() {
      radio_value = value;
      switch (radio_value) {
        case 0:
          _final_result =
              claculate_weirht(_weight_coltroller.text, facteur_pluto);
          _planet = "Pluto";
          break;
        case 1:
          _final_result =
              claculate_weirht(_weight_coltroller.text, facteur_mars);
          _planet = "Mars";
          break;
        case 2:
          _final_result =
              claculate_weirht(_weight_coltroller.text, facteur_venus);
          _planet = "Venus";
          break;
      }
    });
  }

  double claculate_weirht(String weight, double facteur) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * facteur;
    } else {
      print("Wrong");
    }
  }

  void RaZ() {
    _weight_coltroller.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.shade300,
      appBar: new AppBar(
        title: Center(child: new Text("Weight on planet X")),
      ),
      body: new Container(
        alignment: Alignment.topCenter,

        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(30.0),),
            new Image.asset(
              'images/p.png',
              height: 200.3,
              width: 200.3,
            ),
            new Container(
              margin: new EdgeInsets.all(3.5),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weight_coltroller,
                    keyboardType: TextInputType.phone,
                    //autofocus: true,
                    decoration: new InputDecoration(
                      labelText: "your weight on earth",
                      hintText: "in kilograms",
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(5.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio<int>(
                            activeColor: Colors.orange,
                            value: 0,
                            groupValue: radio_value,
                            onChanged: on_chaged_radio_value),
                        new Text(
                          "Pluto",
                          style: new TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w800,
                              fontSize: 20.0),
                        ),
                        new Radio<int>(
                            activeColor: Colors.red,
                            value: 1,
                            groupValue: radio_value,
                            onChanged: on_chaged_radio_value),
                        new Text(
                          "Mars",
                          style: new TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w800,
                              fontSize: 20.0),
                        ),
                        new Radio<int>(
                            activeColor: Colors.brown,
                            value: 2,
                            groupValue: radio_value,
                            onChanged: on_chaged_radio_value),
                        new Text(
                          "Venus",
                          style: new TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w800,
                              fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                  //Result text
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: new Text(
                      _weight_coltroller.text.isEmpty
                          ? "Please entre your weight"
                          : "Your weight on $_planet will be ${_final_result.toStringAsFixed(1)} Kg",
                      style: new TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20.2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: RaZ,
        child: new Icon(
          Icons.exposure_zero,
        ),
        tooltip: "remise a zero",
      ),
    );
  }
}
