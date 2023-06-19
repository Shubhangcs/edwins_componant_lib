import 'package:animated_text_kit/animated_text_kit.dart';
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
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedTextKit(animatedTexts: [
                      TyperAnimatedText('Welcome',
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w200,
                              fontFamily: 'Quicksand'))
                    ]),
                    Text(
                      "THE GREAT PERSON",
                      style: TextStyle(
                          color: Color.fromARGB(255, 138, 138, 138),
                          fontFamily: 'Quicksand'),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black)
                ),
                margin: EdgeInsets.only(right: 15),
                height: 65,
                width: 65,
                child: Image.asset('assets/a.png'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
