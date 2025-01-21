import '../../consts/consts.dart';
import '../../controller/cart_controller.dart';
import '../widgets.dart';
import 'checkout.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
controller.onInit();
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child:  Scaffold(
          backgroundColor: whiteColor,
          appBar: appBarBack(),
           bottomNavigationBar :  Obx(()=> Container(
                     
                      padding: EdgeInsets.only(top: 10,bottom: 5),
                      decoration: BoxDecoration(
                     color: Colors.white, // Set the background color
                     borderRadius: BorderRadius.vertical(top: Radius.circular(20)), // Optional: rounded corners
                     boxShadow: [
                       BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 5, // Blur radius
              offset: Offset(0, -2), // Changes the position of the shadow
                       ),
                     ],
                   ) ,child: Row(
                       
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                10.widthBox,
             "Qty : ${controller.totalQty}".text.fontFamily(semibold).make(),
               10.widthBox,
                "Total : ${controller.totalPrice}".text.color(Vx.green600).fontFamily(semibold).bold.make(),
                                     10.widthBox,
                                        ourButton(
                                    color: primaryColor,
                                    onPress: () async {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Checkout()));
                                    },
                                    textColor: secondColor,
                                    title: 'Checkout'),
                              
                                    
                       ],),),
           ),
        
          body:  SingleChildScrollView(
              child:  Obx(()=> Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "My Cart"
                              .text
                              .size(20)
                              .bold
                              .color(primaryColor)
                              .fontFamily(semibold)
                              .make(),
                         20.heightBox,
                         Column(
                          children: 
                  List.generate(controller.cartList.length, (index){
                var cartData = controller.cartList[index];
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
                                       "Avail Qty : ${cartData['pro_qty']}".text.size(10).make(),
                                        5.heightBox,
                                       Row(
                                         children: [
                                           priceText(cartData['mrp']),
                                           10.widthBox, // Add some spacing between the texts
                                           mrpText(cartData['price']),
                                         ],
                                       ),
                                       5.heightBox,
                                       Row(
                                         
                                         children: [
                                         textWithBox(const Icon(Icons.remove, color: secondColor, size: 20),).onTap((){
                                            controller.qtyDecrement(context,cartData['pro_code'],cartData['cart_ai_id']);
                                         }),
                                         8.widthBox,
                                          Container(
                                                        padding: EdgeInsets.only(top: 4, bottom: 4, left: 13, right: 13),
                                                decoration: BoxDecoration(
                                                        color: primaryColor, // Set the background color
                                                        borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: "${cartData['cart_qty']}".text.size(15).color(whiteColor).make(), // Use the passed child widget here
                                           ),
                                           8.widthBox,
                               textWithBox(const Icon(Icons.add, color: secondColor, size: 20),).onTap((){
                                 controller.qtyIncrement(context,cartData['pro_code'],cartData['cart_ai_id']);
                                           }),
                                         ],
                                       ),
                                     ],
                                   ),
                                  
                                   IconButton(
                                       onPressed: () async{
                                     await   controller.deleteCart(context, cartData['cart_ai_id']);
                                       },
                                       icon: Icon(
                                         Icons.delete,
                                         color: redColor,
                                       )),
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
           
          ),
    
       
    
    );
  }
}
