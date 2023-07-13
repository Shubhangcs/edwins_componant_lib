import 'package:edwins_componant_lib/widgets/common/top_nav.dart';
import 'package:flutter/material.dart';


class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TopNav(title: 'Cart'),
            ListView.builder(itemBuilder: (context , index){
              return Container();
            },itemCount: 4,)
          ],
        ),
      ),
    );
  }
}