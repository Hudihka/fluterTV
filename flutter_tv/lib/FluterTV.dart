

import 'package:flutter/material.dart';
import 'package:flutter_tv/Data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ListTV extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListTVState();
  }
}


class ListTVState extends State<ListTV> {
  
  List<DataTV> data = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV Application'),
      ),
      body: Container(
        child: ListView( //таблица
          children: _buildList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => _loadCC(),
      ),
    );
  }

  List<Widget> _buildList() {
    return data.map((DataTV f) => ListTile(
      subtitle: Text(f.username),
      title: Text(f.name),
      leading: CircleAvatar(child: Text(f.id.toString()),),
      trailing: Text(f.email),
    )).toList();
  }

  void _loadCC() async {
    //await значит выполняется на другом потоке
    final response = await http.get('https://jsonplaceholder.typicode.com/users');
    if (response.statusCode == 200){
       var tagObjsJson = jsonDecode(response.body) as List;
       List<DataTV> datasObjs = tagObjsJson.map((tagJson) => DataTV.fromJson(tagJson)).toList();

      print(datasObjs);
      print(datasObjs.first.email);

      // var allData = json.decode(response.body) as List<<String, dynamic>>;
      // List<DataTV> dataList = [];

      // allData.forEach((key, value) { 
      //   var record = DataTV(
      //     name: value['name'], 
      //     username: value['username'],
      //     id: value['id'],
      //     email: value['email']
      //   );
      //   dataList.add(record);
      // });

      // print(dataList);
    }
  }

}