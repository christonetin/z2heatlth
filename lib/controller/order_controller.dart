
import '../../consts/consts.dart';
import 'auth_controller.dart';
import 'package:http/http.dart' as http;
class OrderController extends GetxController {
  var authController = Get.put(AuthController());
  var userId = ''.obs;
  var isLoading = false.obs;

  Map<String, dynamic>? data;
  @override
  void onInit() async {
    super.onInit();
    userId = authController.userId;
    myAllOrders();
    orderIndex();

  }
  var cart=0.obs,wishList=0.obs,orders=0.obs;
  orderIndex()async{
    String uri = '${url}action.php';
    var res = await http.post(Uri.parse(uri), body: {
      "orderIndex": '',
      "user_id": userId.toString(),
    });
    data = json.decode(res.body);
    orders.value = data!['orders'] ?? '';
    wishList.value = data!['wishList'] ?? '';
    cart.value = data!['cart'] ?? '';
  }

  var orderList = <Map<String, dynamic>>[].obs; // Observable list for images
  Future<void> myAllOrders() async {
    String uri = '${url}action.php';
    final response = await http.post(Uri.parse(uri), body: {
      'myAllOrders': '',"user_id":userId.value
    });

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      orderList.value = data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load data');
    }
  }



}
