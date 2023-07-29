import 'package:edwins_componant_lib/widgets/top_nav.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as urllauncher;

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TopNav(title: 'Contact Us'),
            Center(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 45),
                width: double.infinity,
                height: 500,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 20,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset('assets/logo.png'),
                      ),
                      const Text(
                        'Email : cshubhanga@gmail.com',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Quicksand'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'For More Information Visit',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Quicksand'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'www.edwins.org.in',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Quicksand'),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'COME JOIN US ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Quicksand'),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 80,
                          height: 80,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 10,
                            child: const Icon(
                              Icons.phone,
                              size: 30,
                            ),
                          ),
                        ),
                        onTap: () async {
                          final Uri url =
                              Uri(scheme: 'tel', path: '+91 861 824 5446');
                          if (await urllauncher.canLaunchUrl(url)) {
                            urllauncher.launchUrl(url);
                          } else {
                            setState(() {
                              var snackBar = const SnackBar(
                                content: Text(
                                  'PHONE : +91 8618245446',
                                  style: TextStyle(color: Colors.black),
                                ),
                                backgroundColor: Colors.white,
                                elevation: 10,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
