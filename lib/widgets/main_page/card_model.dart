import 'package:flutter/material.dart';

class CardModel extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagepath;
  const CardModel({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Card(
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 80,
              margin: EdgeInsets.only(left: 20),
              child: Image.asset(imagepath),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: 'Quicksand'),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Quicksand'),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 60,
              height: 80,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
