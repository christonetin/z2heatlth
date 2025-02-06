import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../consts/consts.dart';
import 'package:http/http.dart' as http;

import 'auth_controller.dart';

class ProductController extends GetxController {
  var authController = Get.put(AuthController());
  var userId = ''.obs;
  var mainCategory = ''.obs;
  var isLoading = false.obs;
      
  Map<String, dynamic>? data;
  @override
  void onInit() async {
    userId = authController.userId;

    super.onInit();
  }

  Future<String> getWishListStatus(proCode)async{
    String uri = '${url}action.php';
    var res = await http.post(Uri.parse(uri), body: {
      "getWishListStatus": '',
      "user_id": userId.value.toString(),
      "pro_code": proCode,
    });


    var data= json.decode(res.body);
    return data['res'] ;
  }
  wishListSubmit(proCode)async{
    String uri = '${url}action.php';
    var res = await http.post(Uri.parse(uri), body: {
      "wishListSubmit": '',
      "user_id": userId.value.toString(),
      "pro_code": proCode,
    });
    await getWishListStatus(proCode);
  }


  late YoutubePlayerController playerController;

  void initializePlayer(String videoId) {
    playerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void onClose() {
    playerController.dispose();
    super.onClose();
  }

  getMainCategory( catId) async {
    String uri = '${url}action.php';
    var res = await http
        .post(Uri.parse(uri), body: {"getMainCategory": '', "id": catId});

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      mainCategory.value= data['category_name'] ??
          ''; // Ensure this is the correct key for the image URL
    } else {
      throw Exception('Failed to load image');
    }
  }
  void setImages(List<Map<String, dynamic>> newImages) {
    images.assignAll(newImages);
  }
 
  void updateIndex(int index) {
    currentIndex.value = index;
    

  }

  Future<List<Map<String, dynamic>>> imagesBaedProuct(proCode) async {
    String uri = '${url}action.php';
    final response =
        await http.post(Uri.parse(uri), body: {'imagesBaedProuct': ''});
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Map<String, dynamic>> dataList = data.cast<Map<String, dynamic>>();

      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  var currentIndex = 0.obs;
  var images = <Map<String, dynamic>>[].obs; // Observable list for images
  Future<void> fetchImages(String proCode) async {
    String uri = '${url}action.php';
    final response = await http.post(Uri.parse(uri), body: {
      'imagesBaedProuct': '',
      'pro_code': proCode, // Ensure you pass the product code
    });

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      images.value = data.cast<Map<String, dynamic>>();

      isLoading.value = false; // Set loading to false
    } else {
      throw Exception('Failed to load data');
    }
  }

    var colors = <Map<String, dynamic>>[].obs; // Observable list for images
  Future<void> fetchColors(String proCode) async {
    String uri = '${url}action.php';
    final response = await http.post(Uri.parse(uri), body: {
      'imagesBaedProuct': '',
      'pro_code': proCode, // Ensure you pass the product code
    });

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      colors.value = data.cast<Map<String, dynamic>>();

      isLoading.value = false; // Set loading to false
    } else {
      throw Exception('Failed to load data');
    }
  }

  var firstImage = "".obs;
  Future<String> getFirstImg(String proCode) async {
    String uri = '${url}action.php';
    var res = await http
        .post(Uri.parse(uri), body: {"getFirstImg": '', "pro_code": proCode});

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      return data['pi_pic'] ??
          ''; // Ensure this is the correct key for the image URL
    } else {
      throw Exception('Failed to load image');
    }
  }

  Future<List<Map<String, dynamic>>> getProducts(type) async {
    String uri = '${url}action.php';
    final response = await http.post(Uri.parse(uri), body: {'getProducts': '','type':type});
    if (response.statusCode == 200) {

      List<dynamic> data = json.decode(response.body);
      List<Map<String, dynamic>> dataList = data.cast<Map<String, dynamic>>();

      // Fetch the first image for each product
      for (var product in dataList) {
        String firstImage = await getFirstImg(product['pro_code']);
        product['first_image'] =
            firstImage; // Store the image URL in the product map
      }

      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Map<String, dynamic>>> getWishListProducts() async {
    String uri = '${url}action.php';

    final response = await http.post(Uri.parse(uri), body: {'getWishListProducts': '','user_id':userId.value});
    if (response.statusCode == 200) {

      List<dynamic> data = json.decode(response.body);
      List<Map<String, dynamic>> dataList = data.cast<Map<String, dynamic>>();


      // Fetch the first image for each product
      for (var product in dataList) {
        String firstImage = await getFirstImg(product['pro_code']);
        product['first_image'] =
            firstImage; // Store the image URL in the product map
      }

      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
