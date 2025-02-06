import '../../controller/order_controller.dart';

import '../../consts/consts.dart';
import '../widgets.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OrderController());
    controller.onInit();
   return Scaffold(
        backgroundColor: whiteColor,
        appBar: appBarBack(),
        body:  SingleChildScrollView(
          child:  Obx(()=> Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "My Orders"
                    .text
                    .size(20)
                    .bold
                    .color(primaryColor)
                    .fontFamily(semibold)
                    .make(),
                20.heightBox,
                Column(
                  children:
                  List.generate(controller.orderList.length, (index){
                    var cartData = controller.orderList[index];
                    return      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.network(
                          '${imgUrl}product_image/${cartData["cart_img"]}',
                          width: 70,

                        ).box.make(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            "${cartData['cart_pro_name']}".text.bold.size(10).make(),
                            5.heightBox,
                            "${cartData['price']} * ${cartData['pro_qty']} : ${(int.parse(cartData['pro_qty'].toString()) * double.parse(cartData['price'].toString())).toString()}".text.size(10).make(),
                            5.heightBox,
                            cartData['cart_date'].toString().text.make(),
                          ],
                        ),
                       "New Order".text.color(fontGrey).bold.make(),
                      ],
                    ).box.shadowSm.white.padding(EdgeInsets.all(8)).margin(EdgeInsets.all(8)).roundedSM.make();
                  })
                  ,
                ),




              ],
            ),
          ),
          ),
        ),

      );



  }
}
