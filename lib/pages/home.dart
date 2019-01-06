import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _sexController = new TextEditingController();
  TextEditingController _ageController = new TextEditingController();
  TextEditingController _educationController = new TextEditingController();
  TextEditingController _fixedNumberYearController = new TextEditingController();
  TextEditingController _introduceController = new TextEditingController();

  var fileName = 'resume_v1.json';
  List infoList = [
    {
      'type': 'TextField',
      'config': {
        'decoration': InputDecoration(
          labelText: '姓名',
          hintText: '请输入姓名',
        ),
      }
    }
  ];

  @override
  initState() {
    super.initState();

    void _init() async {
      File resumeFile = await _getFile(fileName);
      Map resume = json.decode(await resumeFile.readAsString());

      _nameController.text = resume['name'];
      _sexController.text = resume['sex'];
    }

    _init();
  }

  Future<File> _getFile(fileName) async {
    String dir = (await getApplicationDocumentsDirectory()).path;

    return new File('$dir/$fileName');
  }

  void _saveData() async {
    File resumeFile = await _getFile(fileName);

    resumeFile.writeAsString(json.encode({
      'name': _nameController.text,
      'sex': _sexController.text,
    }));
  }

  @override
  Widget build(BuildContext context) {
    var inputList = infoList.map<Widget>((info) {
      String type = info['type'];
      var infoText;

      switch (type) {
        case 'TextField':
          infoText = new TextField(
            controller: new TextEditingController(),
            decoration: info['config']['decoration'],
          );

          break;
      }

      return infoText;
    }).toList();

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(12.0),
        child: Column(
          children: inputList,
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _saveData,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
