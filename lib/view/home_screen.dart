import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notes"),
        elevation: 0,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text("data"),
                  Text("data"),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, intdex) {
            return SizedBox(
              width: 10,
            );
          },
          itemCount: 10),
    );
  }
}
