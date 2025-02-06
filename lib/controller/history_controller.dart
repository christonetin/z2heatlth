import '../../consts/consts.dart';
import 'package:http/http.dart' as http;

import 'auth_controller.dart';


class HistoryController extends GetxController {
  var authController = Get.put(AuthController());
  var userId = ''.obs;
  var isLoading = false.obs;
//Map<String, dynamic>? data;
  @override
  void onInit() async {
    userId = authController.userId;
    super.onInit();
  }

  Future<List<Map<String, dynamic>>> levelIncome()async{
    String uri = '${url}action.php';
    final response = await http.post(Uri.parse(uri), body: {
      'levelIncome': '','userId': userId.toString()
    });
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Map<String, dynamic>> dataList = data.cast<Map<String, dynamic>>();
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Map<String, dynamic>>> dailyIncome()async{
    String uri = '${url}action.php';
    final response = await http.post(Uri.parse(uri), body: {
      'dailyIncome': '','userId': userId.toString()
    });
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Map<String, dynamic>> dataList = data.cast<Map<String, dynamic>>();
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }


  Future<List<Map<String, dynamic>>> referralIncome()async{
    String uri = '${url}action.php';
    final response = await http.post(Uri.parse(uri), body: {
      'referralIncome': '','userId': userId.toString()
    });
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Map<String, dynamic>> dataList = data.cast<Map<String, dynamic>>();
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Map<String, dynamic>>> withdrawHistory()async{
    String uri = '${url}action.php';
    final response = await http.post(Uri.parse(uri), body: {
      'withdrawHistory': '','userId': userId.toString()
    });
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Map<String, dynamic>> dataList = data.cast<Map<String, dynamic>>();
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Map<String, dynamic>>> depositHistory()async{
    String uri = '${url}action.php';
    final response = await http.post(Uri.parse(uri), body: {
      'depositHistory': '','userId': userId.toString()
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
