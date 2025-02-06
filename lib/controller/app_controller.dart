import '../../consts/consts.dart';
import 'package:http/http.dart' as http;

class AppController extends GetxController {
  
  var currentNavIndex = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    getBanners();
  }

  var bannerList = <Map<String, dynamic>>[].obs;
  Future<void> getBanners() async {

    String uri = '${url}action.php';
    final response = await http.post(Uri.parse(uri), body: {
      'getBanners': '',
    });

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      bannerList.value = data.cast<Map<String, dynamic>>();

    } else {
      throw Exception('Failed to load data: ${response.body}');
    }
  }
}