import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Civix'),
        actions: [
          IconButton(
              icon: Icon(Icons.error),
              onPressed: () {})
        ],
      ),
      body: AutoRouter(),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.account_box), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,      
      bottomNavigationBar: BottomAppBar(        
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.touch_app_outlined, size: 30,)),
              IconButton(onPressed: () {}, icon: Icon(Icons.list_alt_outlined, size: 30))
            ],
          ),
        ),
      )
    );
  }
}