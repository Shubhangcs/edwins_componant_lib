import 'package:flutter/material.dart';


class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello'),),
      body: SafeArea(child: Container(
        child: ListView.builder(itemBuilder: (context , index){
          return Container(
            width: double.infinity,
            height: 70,
            margin: EdgeInsets.only(left: 20 , right: 20),
            child: Card(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                    ),
                    child: Column(
                      children: [
                        Text('data'),
                        Text('Hello')
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },itemCount: 10,),
      )),
    );
  }
}