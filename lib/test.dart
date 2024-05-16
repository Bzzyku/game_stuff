import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedValue;
  String _displayText = '';

  final List<String> _values = ['Opcja 1', 'Opcja 2', 'Opcja 3'];

  void _updateText() {
    setState(() {
      _displayText = _selectedValue ?? 'Nie wybrano wartości';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                hint: Text('Wybierz wartość'),
                value: _selectedValue,
                onChanged: (newValue) {
                  setState(() {
                    _selectedValue = newValue;
                  });
                },
                items: _values.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateText,
                child: Text('Pokaż wybraną wartość'),
              ),
              SizedBox(height: 20),
              Text(
                _displayText,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
