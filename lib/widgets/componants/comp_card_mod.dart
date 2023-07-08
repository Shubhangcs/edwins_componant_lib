import 'package:flutter/material.dart';

class CompCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imagepath;

 const CompCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagepath,
  });

  @override
  State<CompCard> createState() => _CompCardState();
}

class _CompCardState extends State<CompCard> {
 var icons = Icons.add_rounded;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Card(
        shape: const RoundedRectangleBorder(
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
              margin: const EdgeInsets.only(left: 20),
              child: Image.network(
                widget.imagepath,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style:const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                    Text(
                      widget.subtitle,
                      style:const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Quicksand',
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              child:  SizedBox(
                width: 60,
                height: 80,
                child: Icon(
                  icons,
                  size: 25,
                ),
              ),
              onTap: () {
                setState(() {
                  icons = Icons.done;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
