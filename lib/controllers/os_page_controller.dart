import 'package:edwins_componant_lib/models/os_model.dart';
import 'package:get/get.dart';

class OsPageController extends GetxController {
  final osKart = <OsList>[].obs;

 final List<OsList> oslist = [
    OsList(
      title: "kali",
      subtitle: "cybersec",
    ),
    OsList(
      title: "ubuntu",
      subtitle: "general",
    ),
    OsList(
      title: "garuda",
      subtitle: "graphical",
    ),
    OsList(
      title: "arch",
      subtitle: "flexible",
    ),

  ];

  void additems(int index) {
    osKart.add(oslist[index]);
  }
}
