import 'package:flutter/services.dart';

import '../../consts/consts.dart';
import 'package:http/http.dart' as http;

import 'auth_controller.dart';




class TeamController extends GetxController {
  var authController = Get.put(AuthController());
  var userId = ''.obs;
  var isLoading = false.obs;
  var referLinkController = TextEditingController().obs;
  Map<String, dynamic>? data;
  @override
  void onInit() async {
    userId = authController.userId;
    super.onInit();
  }

  loadDatasController(context)async{
    referLinkController.value.text = "https://$urlLink/reg?id=${userId.value}";
  }



  copyToClipboard(context) {
    Clipboard.setData(ClipboardData(text: referLinkController.value.text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content:  Text('Copy Link Successfully'),backgroundColor: greenColor,),
      );
    });
  }

  var level_1 ="0".obs,level_2 ="0".obs,level_3 ="0".obs,level_4 ="0".obs,level_5 ="0".obs,level_6 ="0".obs,level_7 ="0".obs,level_8 ="0".obs,level_9 ="0".obs,level_10 ="0".obs  ;

  var level_1income="0".obs,level_2income="0".obs,level_3income="0".obs,level_4income="0".obs,level_5income="0".obs,level_6income="0".obs,level_7income="0".obs,level_8income="0".obs,level_9income="0".obs,level_10income="0".obs;

  levelTable () async {
    String uri = '${url}action.php';
    var res = await http.post(Uri.parse(uri), body: {
      'levelTable': '',
      'userId': userId.toString()
    });
    data = json.decode(res.body);

    if (data != null) {

      level_1.value= data!['level_1'] ?? '';
      level_2.value= data!['level_2'] ?? '';
      level_3.value= data!['level_3'] ?? '';
      level_4.value= data!['level_4'] ?? '';
      level_5.value= data!['level_5'] ?? '';
      level_6.value= data!['level_6'] ?? '';
      level_7.value= data!['level_7'] ?? '';
      level_8.value= data!['level_8'] ?? '';
      level_9.value= data!['level_9'] ?? '';
      level_10.value= data!['level_10'] ?? '';

      level_1income.value =data!['level_1_income'] ?? '';
      level_2income.value =data!['level_2_income'] ?? '';
      level_3income.value =data!['level_3_income'] ?? '';
      level_4income.value =data!['level_4_income'] ?? '';
      level_5income.value =data!['level_5_income'] ?? '';
      level_6income.value =data!['level_6_income'] ?? '';
      level_7income.value =data!['level_7_income'] ?? '';
      level_8income.value =data!['level_8_income'] ?? '';
      level_9income.value =data!['level_9_income'] ?? '';
      level_10income.value =data!['level_10_income'] ?? '';


    }

  }

  Future<List<Map<String, dynamic>>> levelTeam()async{
    String uri = '${url}action.php';
    final response = await http.post(Uri.parse(uri), body: {
      'levelTeam': '','userId': userId.toString()
    });
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Map<String, dynamic>> dataList = data.cast<Map<String, dynamic>>();
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }
  Future<List<Map<String, dynamic>>> referralTeam()async{
    String uri = '${url}action.php';
    final response = await http.post(Uri.parse(uri), body: {
      'referralTeam': '','userId': userId.toString()
    });
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Map<String, dynamic>> dataList = data.cast<Map<String, dynamic>>();
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

}
