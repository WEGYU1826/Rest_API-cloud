import 'package:flutter/material.dart';
import 'package:cluld/utilities/constant.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: textFildInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.teal),
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: const Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: 'Spartan MB',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
