import 'dart:convert';
import 'package:edwins_componant_lib/constants.dart';
import 'package:edwins_componant_lib/views/login_page.dart';
import 'package:edwins_componant_lib/widgets/top_nav.dart';
import 'package:edwins_componant_lib/views/componants/comp_card_mod.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../home_page.dart';

class ComponantAdd extends StatefulWidget {
  const ComponantAdd({super.key});

  @override
  State<ComponantAdd> createState() => _ComponantAddState();
}

class _ComponantAddState extends State<ComponantAdd> {
  List data = [];
  @override
  void initState() {
    super.initState();
    getcomponants();
  }

  Future<void> getcomponants() async {
    final response = await http.get(Uri.parse(componants));
    final res = jsonDecode(response.body);
    setState(() {
      data = res;
    });
  }
  var compbody = {"name": emailController.text, "items": userData};

  void uploadData() async {
    var res = await http.post(Uri.parse(addcomp),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(compbody));
    var jsonResponse = jsonDecode(res.body);
    if (jsonResponse['status']) {
      setState(() {
        userData.clear();
        var snackBar = const SnackBar(
          content: Text('Component request success..' , style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pop(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    } else {
      setState(() {
        userData.clear();
        var snackBar = const SnackBar(
          content: Text(
            'Error add components again',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TopNav(
              title: 'Components',
            ),
            SizedBox(
              height: 530,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return CompCard(
                      title: data[index]['name'],
                      subtitle: data[index]['subtitle'],
                      imagepath: data[index]['image']);
                },
                itemCount: data.length,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.only(top: 6, left: 20),
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(173, 0, 0, 0),
                        ),
                        child: const Center(
                          child: Text(
                            'Borrow',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Quicksand',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          uploadData();
                          userData.clear();
                        });
                      },
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(top: 6, left: 10 , right: 15),
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(173, 0, 0, 0),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.restart_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        var snackBar = const SnackBar(
                      content: Text(
                        'Reset Successful...',
                        style: TextStyle(color: Colors.black),
                      ),
                      duration: Duration(milliseconds: 500),
                      backgroundColor: Colors.white,
                      elevation: 10,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        userData.clear();
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
