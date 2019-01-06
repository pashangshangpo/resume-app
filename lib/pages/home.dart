import 'dart:io';
import 'dart:async';
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

  String fileName = 'resume_v1.json';

  Future<File> _getFile(String fileName) async {
    String dir = (await getApplicationDocumentsDirectory()).path;

    return new File('$dir/$fileName');
  }

  void _saveData() async {
    File resumeFile = await _getFile(fileName);

    resumeFile.writeAsString('hello world');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: '姓名',
                hintText: '请输入姓名',
              ),
            ),
            TextField(
              controller: _sexController,
              decoration: InputDecoration(
                labelText: '性别',
                hintText: '请输入性别',
              ),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: '年龄',
                hintText: '请输入年龄',
              ),
            ),
            TextField(
              controller: _educationController,
              decoration: InputDecoration(
                labelText: '学历',
                hintText: '请输入学历',
              ),
            ),
            TextField(
              controller: _fixedNumberYearController,
              decoration: InputDecoration(
                labelText: '工作经验',
                hintText: '请输入工作经验',
              ),
            ),
            TextField(
              controller: _introduceController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: '自我介绍',
                hintText: '请输入自我介绍',
              ),
            ),
          ],
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
