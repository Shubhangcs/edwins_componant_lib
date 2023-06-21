import 'package:edwins_componant_lib/widgets/comp_card_mod.dart';
import 'package:flutter/material.dart';


class ComponantAdd extends StatefulWidget {
  const ComponantAdd({super.key});

  @override
  State<ComponantAdd> createState() => _ComponantAddState();
}

class _ComponantAddState extends State<ComponantAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context , index){
        return CompCard();
      },itemCount: 5,),
    );
  }
}