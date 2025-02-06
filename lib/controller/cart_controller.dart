
import '../../consts/consts.dart';
import 'auth_controller.dart';
import 'package:http/http.dart' as http;
class CartController extends GetxController {
  var authController = Get.put(AuthController());
  var userId = ''.obs;
 
  var isLoading = false.obs;
  var quantity = 1.obs;


      
  Map<String, dynamic>? data;
  @override
  void onInit() async {
     super.onInit();
    userId = authController.userId;
     currentCart();
     cartQtyPriceTotal();
   
  }



    RxString totalPrice = ''.obs,totalQty = ''.obs,discount = ''.obs, mrpAndQty= ''.obs;
  Future<void> cartQtyPriceTotal() async {
    String uri = '${url}action.php';

    try {
      var res = await http.post(Uri.parse(uri), body: {
        "cartQtyPriceTotal": '',
        "user_id": userId.value.toString(),
      });
      data = json.decode(res.body);

      totalPrice.value = data!['total_price'].toString();
      totalQty.value = data!['total_qty'].toString();
      discount.value = data!['discount'].toString();
      mrpAndQty.value = data!['mrp_and_qty'].toString();
   
    } catch (e) {
      print(e);
    }
  }

  placeOrder()async{
    String uri = '${url}action.php';
    var res = await http
        .post(Uri.parse(uri), body: {"placeOrder": '',"user_id":userId.toString()});
    var data = jsonDecode(res.body);
    print(res.body);
  }


  var cartList = <Map<String, dynamic>>[].obs; // Observable list for images
  Future<void> currentCart() async {
    String uri = '${url}action.php';
    final response = await http.post(Uri.parse(uri), body: {
      'currentCart': '',"user_id":userId.value
     
    });

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      cartList.value = data.cast<Map<String, dynamic>>();

    } else {
      throw Exception('Failed to load data');
    }
  }
addToCart(context,proCode,firstImage)async{
     String uri = '${url}action.php';
    var res = await http
        .post(Uri.parse(uri), body: {"addToCart": '', "cart_pro_id": proCode.toString(),"user_id":userId.toString(),"qty":quantity.value.toString(),"proimage":firstImage.toString()});
         data = jsonDecode(res.body);
   if(data!['res']=='exist'){
        VxToast.show(context, msg: 'This Product Already Exist',bgColor: Vx.yellow600,textColor: whiteColor);
     }
     else if(data!['res']=='low_qty'){
        VxToast.show(context, msg: 'Low Quantity',bgColor: Vx.yellow600,textColor: whiteColor);
     }
      else if(data!['res']=='successfully'){
        VxToast.show(context, msg: 'Product Added Successfully',bgColor: greenColor,textColor: whiteColor);
     }
      else{
        VxToast.show(context, msg: 'Something Wrong',bgColor: redColor,textColor: whiteColor);
     }
}

  Future<void> deleteCart(context,cartAi) async{
       String uri = '${url}action.php';

    try {
      var res = await http.post(Uri.parse(uri), body: {
        "deleteCart": '',
          "cart_ai_id": cartAi,
      });
      data = json.decode(res.body);
     if(data!['res']=='success'){
      await currentCart();
 await cartQtyPriceTotal();
 VxToast.show(context, msg: 'Cart Deleted',bgColor: greenColor,textColor: whiteColor);
     }
     else{
       VxToast.show(context, msg: 'Something Wrong',bgColor: redColor,textColor: whiteColor);
     }
     

    } catch (e) {
      print(e);
    }

  }

qtyIncrementSingle(){
  quantity++;
}

qtyDecrementSingle(){
  if(quantity>1){
 quantity--;
  }
 
}
  Future<void> qtyIncrement(context,proCode,cartAi) async{
       String uri = '${url}action.php';

    try {
      var res = await http.post(Uri.parse(uri), body: {
        "qtyIncrement": '',
        "pro_code": proCode,
          "cart_ai_id": cartAi,
      });
      data = json.decode(res.body);
     if(data!['res']=='success'){
      await currentCart();
 await cartQtyPriceTotal();
 VxToast.show(context, msg: 'Cart Updated',bgColor: greenColor,textColor: whiteColor);
     }
     else{
       VxToast.show(context, msg: 'Something Wrong',bgColor: redColor,textColor: whiteColor);
     }
     

    } catch (e) {
      print(e);
    }

  }

    Future<void> qtyDecrement(context,proCode,cartAi) async{
       String uri = '${url}action.php';

    try {
      var res = await http.post(Uri.parse(uri), body: {
        "qtyDecrement": '',
        "pro_code": proCode,
        "cart_ai_id": cartAi,
      });
      data = json.decode(res.body);
     if(data!['res']=='success'){
      await currentCart();
 await cartQtyPriceTotal();
 VxToast.show(context, msg: 'Cart Updated',bgColor: greenColor,textColor: whiteColor);
     }
     else{
       VxToast.show(context, msg: 'Something Wrong',bgColor: redColor,textColor: whiteColor);
     }
     

    } catch (e) {
      print(e);
    }

  }
}
