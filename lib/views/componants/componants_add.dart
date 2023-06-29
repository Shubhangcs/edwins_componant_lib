import 'package:edwins_componant_lib/models/os_model.dart';
import 'package:edwins_componant_lib/widgets/componants/comp_card_mod.dart';
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
        return CompCard(title:"" , subtitle: '',imageLink: '',);
      },itemCount: 5,),
    );
  }
}