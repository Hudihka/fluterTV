

import 'package:flutter/material.dart';
import 'package:flutter_tv/Data.dart';

class ListTV extends StatelessWidget {
  List<DataTV> data = [
    DataTV(name: 'Bitcoin', symbol: 'BTC', rank: 1, price: 6000.0),
    DataTV(name: 'Etherium', symbol: 'ETH', rank: 2, price: 200.0),
    DataTV(name: 'Trololo', symbol: 'BTC', rank: 3, price: 500.0),
  ];


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
    );
  }

  List<Widget> _buildList() {
    return data.map((DataTV f) => ListTile(
      subtitle: Text(f.symbol),
      title: Text(f.name),
      leading: CircleAvatar(child: Text(f.rank.toString()),),
      trailing: Text('\$${f.price.toString()}'),
    )).toList();
  }

  
}