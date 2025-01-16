import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '抽籤 App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();
  List<String> _options = [];
  String _result = '';

  void _addOption() {
    setState(() {
      _options.add(_textController.text);
      _textController.clear();
    });
  }

  void _draw() {
    if (_options.isEmpty) {
      setState(() {
        _result = '請先新增選項';
      });
      return;
    }
    final random = Random();
    final index = random.nextInt(_options.length);
    setState(() {
      _result = _options[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('抽籤 App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: '新增選項'),
            ),
            ElevatedButton(
              onPressed: _addOption,
              child: Text('新增'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _options.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_options[index]),
                  );
                },
              ),
            ),
            Text(
              _result,
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: _draw,
              child: Text('抽籤'),
            ),
          ],
        ),
      ),
    );
  }
}
