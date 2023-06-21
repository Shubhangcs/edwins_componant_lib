import 'package:flutter/material.dart';

class CompCard extends StatelessWidget {
  const CompCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),

        child: Card(
          shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 80,
                margin:const EdgeInsets.only(left: 20),
                child: Image.asset('assets/a.png'),
              ),
              Expanded(
                child: Container(
                  margin:const EdgeInsets.only(left: 20),
                  child:const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'title',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            fontFamily: 'Quicksand'),
                      ),
                      Text(
                        'subtitle',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Quicksand'),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: const SizedBox(
                  width: 60,
                  height: 80,
                  child: Icon(
                    Icons.add_rounded,
                    size: 25,
                  ),
                ),
                onTap: (){

                },
              ),
            ],
          ),
        ),
    );
  }
}