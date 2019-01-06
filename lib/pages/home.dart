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
  var fileName = 'resume_v1.json';

  static List _infoList = [
    {
      'type': 'TextField',
      'config': {
        'decoration': InputDecoration(
          labelText: '姓名',
          hintText: '请输入姓名',
        ),
      }
    },
    {
      'type': 'TextField',
      'config': {
        'decoration': InputDecoration(
          labelText: '性别',
          hintText: '请输入性别',
        ),
      }
    },
    {
      'type': 'TextField',
      'config': {
        'decoration': InputDecoration(
          labelText: '年龄',
          hintText: '请输入年龄',
        ),
      }
    },
    {
      'type': 'TextField',
      'config': {
        'decoration': InputDecoration(
          labelText: '学历',
          hintText: '请输入学历',
        ),
      }
    },
    {
      'type': 'TextField',
      'config': {
        'decoration': InputDecoration(
          labelText: '工作经验',
          hintText: '请输入工作经验',
        ),
      }
    },
    {
      'type': 'TextField',
      'config': {
        'maxLines': 3,
        'decoration': InputDecoration(
          labelText: '自我介绍',
          hintText: '请输入自我介绍',
        ),
      }
    },
  ];
  static List _controllerList = [];

  var inputList = _infoList.map<Widget>((info) {
    String type = info['type'];
    Map config = info['config'];
    var infoText;
    var controller = new TextEditingController();

    switch (type) {
      case 'TextField':
        infoText = new TextField(
          controller: controller,
          maxLines: config['maxLines'],
          decoration: config['decoration'],
        );

        break;
    }

    _controllerList.add(controller);

    return infoText;
  }).toList();

  @override
  initState() {
    super.initState();

    void _init() async {
      // File resumeFile = await _getFile(fileName);
      // Map resume = json.decode(await resumeFile.readAsString());
    }

    _init();
  }

  Future<File> _getFile(fileName) async {
    String dir = (await getApplicationDocumentsDirectory()).path;

    return new File('$dir/$fileName');
  }

  void _saveData() async {
    // File resumeFile = await _getFile(fileName);

    // resumeFile.writeAsString(json.encode({
    //   'name': _nameController.text,
    //   'sex': _sexController.text,
    // }));
  }

  @override
  Widget build(BuildContext context) {
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
