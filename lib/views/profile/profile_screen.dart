import 'package:z2hhealthcare/controller/order_controller.dart';
import '../../controller/auth_controller.dart';
import '../../views/profile/profile_edit.dart';
import '../../views/profile/profile_index.dart';
import '../../controller/profile_controller.dart';
import '../../consts/consts.dart';
import '../cart/cart.dart';
import '../orders/my_orders.dart';
import '../products/products_wishlist.dart';
import '../widgets.dart';

class ProfileScreen extends StatelessWidget {
 const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
      var controller = Get.put(ProfileController());
  var authController = Get.put(AuthController());
  var orderController = Get.put(OrderController());
  controller.getUserData();
      orderController.onInit();
    return  Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: appBarBack(),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imgBackground), fit: BoxFit.fill)),
            child: SafeArea(
              child: Column(

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: const Icon(
                        Icons.edit,
                        color: secondColor,
                      ).onTap(() {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileEdit()));
                      }),
                    ),
                  ),
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(children: [
                 SizedBox(
                      width: 100,
                      child: controller.profile.value.toString() != '' ? Image.network(
                                    '$imgUrl/profile_photo/${controller.profile.value.toString()}',
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ).box.roundedFull.clip(Clip.antiAlias).make() :   Image.asset(
                                  imgProfile2,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make(),
                    ),
                     13.widthBox,
                      if (controller.data != null)
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            controller.name.value
                                .text
                                .fontFamily(semibold)
                                .color(secondColor)
                                .make(),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              controller.mobile.value,
                              style: TextStyle(color: secondColor),
                            ),
                          ],
                        )),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(
                            color: secondColor,
                          )),
                          onPressed: () {
                            authController.logout(context);
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(color: secondColor, fontFamily: semibold),
                          )),
                    ]),
                  ),
                 45.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Cart()));
                        },
                        child: detailsCard(
                            count: orderController.cart.value.toString(),
                            title: 'In Your Cart',
                            width: context.screenWidth / 3.4),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProductsWishlist()));
                        },
                        child: detailsCard(
                            count: orderController.wishList.value.toString(),
                            title: 'Wish List',
                            width: context.screenWidth / 3.4),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyOrders()));
                        },
                        child: detailsCard(
                            count: orderController.orders.value.toString(),
                            title: 'Orders',
                            width: context.screenWidth / 3.4),
                      ),
                    ],
                  ),
                  20.heightBox,

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                     ListTile(

                                leading: Image.asset(
                                  orders,
                                  width: 22,
                                ),
                                title: "Orders".text.semiBold.color(primaryColor).make(),
                              )
                        .box
                        .white
                        .rounded
                        .shadowSm
                        .margin(EdgeInsets.all(12))
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .make()
                        .box
                        .make().onTap((){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyOrders()));

                        }),


                         ListTile(

                                leading: Image.asset(
                                  wishlist,
                                  width: 22,
                                ),
                                 title: "Wish List".text.semiBold.color(primaryColor).make(),
                              )
                        .box
                        .white
                        .rounded
                        .shadowSm
                        .margin(EdgeInsets.all(12))
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .make()
                        .box
                        .make().onTap((){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProductsWishlist()));
                        }),

                         ListTile(

                                leading: Image.asset(
                                  imgProfile2,
                                  width: 22,
                                ),
                                title: "Profile".text.semiBold.color(primaryColor).make(),
                              )
                        .box
                        .white
                        .rounded
                        .shadowSm
                         .margin(EdgeInsets.all(12))
                        .padding(EdgeInsets.symmetric(horizontal: 16))

                        .make()
                        .box
                        .make().onTap((){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileIndex()));
                        }),

                         ListTile(

                                leading: Image.asset(
                                  aboutus,
                                  width: 22,
                                ),
                                 title: "About us".text.semiBold.color(primaryColor).make(),
                              )
                        .box
                        .white
                        .rounded
                        .shadowSm
                        .margin(EdgeInsets.all(12))
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .make()
                        .box
                        .make().onTap((){

                        }),

                         ListTile(

                                leading: Image.asset(
                                  logout,
                                  width: 22,
                                ),
                                 title: "Logout".text.semiBold.color(primaryColor).make(),
                              )
                        .box
                        .white
                        .rounded
                        .shadowSm
                        .margin(const EdgeInsets.all(12))
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .make()
                        .box
                        .make().onTap((){
                          authController.logout(context);
                        }),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
         
        );
   
   
  }
}
