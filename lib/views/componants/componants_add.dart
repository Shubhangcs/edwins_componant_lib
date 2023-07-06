import 'dart:convert';

import 'package:edwins_componant_lib/constants/constants.dart';
import 'package:edwins_componant_lib/widgets/componants/comp_card_mod.dart';
import 'package:edwins_componant_lib/widgets/main_page/card_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'componant_reg.dart';


class ComponantAdd extends StatefulWidget {
  const ComponantAdd({super.key});

  @override
  State<ComponantAdd> createState() => _ComponantAddState();
}

class _ComponantAddState extends State<ComponantAdd> {


 List data  = [];
  @override

void initState() {
    super.initState();
    getcomponants();
  }

Future<void> getcomponants()async{
  final response = await http.get(Uri.parse(componants));
  final res = jsonDecode(response.body);
  setState(() {
    data = res;
  });
}




  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context , index){
        return CompCard(title: data[index]['name'], subtitle: data[index]['subtitle'],imagepath: data[index]['image'],);
      },itemCount: data.length,),
    );
  }
}