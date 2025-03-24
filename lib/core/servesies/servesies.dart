import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myserves extends GetxService {
  late SharedPreferences sharedpreferences;

  Future<Myserves> init() async {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDbns0yz2DMdmThXItCIZNavJ68JZFERCo",
            appId: "1:425534675333:android:49506b46658dfa35990cec",
            messagingSenderId: "425534675333",
            projectId: "phonic-arcana-438515-d0"));
    sharedpreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServers() async {
  await Get.putAsync(() => Myserves().init());
}
