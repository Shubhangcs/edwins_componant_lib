import 'package:flutter/material.dart';

class TopMenu extends StatelessWidget {
  const TopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15 , top: 20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text(
                      "WELCOME TO",
                      style: TextStyle(
                          color: Color.fromARGB(255, 138, 138, 138),
                          fontFamily: 'Quicksand'),
                    ),
                    Text('Edwin\'s Componant \nLibrary',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w200,
                            fontFamily: 'Quicksand')),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(right: 25 , top: 20),
                  height: 65,
                  width: 65,
                  child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset(width: 30, 'assets/logo.png' , ))),
            ],
          )
        ],
      ),
    );
  }
}
