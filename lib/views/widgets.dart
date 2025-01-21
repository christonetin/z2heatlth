

import 'package:flutter/services.dart';
import 'package:z2hhealthcare/controller/auth_controller.dart';
import 'package:z2hhealthcare/views/biz/dash_board.dart';

import '../consts/consts.dart';
import '../controller/product_controller.dart';
import '../controller/profile_controller.dart';
import 'biz/activate.dart';
import 'biz/apply_business.dart';
import 'biz/register_from_panel.dart';
import 'biz/wallet/withdraw.dart';
import 'products/product_view_single.dart';

Widget drawerCardMember(context) {
  var controller = Get.put(ProfileController());
  var authController = Get.put(AuthController());
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(
            controller.nameController.value.text.toString(),
            style: const TextStyle(color:whiteColor,fontWeight: FontWeight.bold),
          ),
          accountEmail: Text(controller.userId.value.toString() ,style: const TextStyle(color:whiteColor),),
          currentAccountPicture: controller.profile.value.toString() != '' ?
          Image.network(
            '$imgUrl/profile_photo/${controller.profile.value.toString()}',
            width: 100,
            fit: BoxFit.cover,
          ).box.roundedFull.clip(Clip.antiAlias).make() :
          Image.asset(
            imgProfile2,
            width: 100,
            fit: BoxFit.cover,
          ).box.roundedFull.clip(Clip.antiAlias).make(),
          decoration: const BoxDecoration(
            color: primaryColor,
          ),
        ),


controller.isBusiness.value=='0'? ListTile(
  leading:const Icon(Icons.add_business),
  title:const Text('Business'),
  onTap: () async{
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ApplyBusiness()));
  },
):
        ExpansionTile(
          title:const Text('Business'),
          leading:const Icon(Icons.business_center),
          childrenPadding:const EdgeInsets.only(left: 60.0),
          children: [
            ListTile(
              title:const Text('Dashboard'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Dashboard()));
              },
            ),
            ListTile(
              title:const Text('Register'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterFromPanel()));
              },
            ),

            ListTile(
              title:const Text('Withdraw'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Withdraw()));
              },
            ),
            ListTile(
              title:const Text('Withdraw History'),
              onTap: () {

              },
            ),
            ListTile(
              title:const Text('Deposit'),
              onTap: () {

              },
            ),
            ListTile(
              title:const Text('Deposit History'),
              onTap: () {

              },
            ),
            ListTile(
              title:const Text('Referral Team'),
              onTap: () {

              },
            ),
            ListTile(
              title:const Text('Level'),
              onTap: () {

              },
            ),
            ListTile(
              title:const Text('Level Team'),
              onTap: () {

              },
            ),
            ListTile(
              title:const Text('Level Income'),
              onTap: () {

              },
            ),
            ListTile(
              title:const Text('Referral Link'),
              onTap: () {

              },
            ),
          ],
        ),

        ListTile(
          leading:const Icon(Icons.shopping_bag_rounded),
          title:const Text('My Orders'),
          onTap: () async{

          },
        ),
        ListTile(
          leading:const Icon(Icons.favorite),
          title:const Text('Wishlist'),
          onTap: () async{

          },
        ),
        ListTile(
          leading:const Icon(Icons.shopping_cart),
          title:const Text('Cart'),
          onTap: () async{

          },
        ),
        ExpansionTile(
          title: const Text('Setting'),
          leading:const Icon(Icons.settings),
          childrenPadding:const EdgeInsets.only(left: 60.0),
          children: [
            ListTile(
              title:const Text('Update Profile'),
              onTap: () {

              },
            ),
            ListTile(
              title:const Text('Update Account'),
              onTap: () {

              },
            ),
            ListTile(
              title:const Text('Change Password'),
              onTap: () {

              },
            ),

          ],
        ),
        const Divider(),
        ListTile(
          leading:const Icon(Icons.exit_to_app),
          title:const Text('Logout'),
          onTap: () async{
           await authController.logout(context);
          },
        ),
      ],
    ),
  );
}

Widget specialProducts(){
   var controller = Get.put(ProductController());
  return       Expanded(
                child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: controller.getProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox( width: context.width,height: 200, child: Center(child: CircularProgressIndicator(color: secondColor,)));
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        List<Map<String, dynamic>> featureData = snapshot.data as List<Map<String, dynamic>>;
                        return  GridView.builder(
                           physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                           itemCount: featureData.length,
                               gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 8,
                                            crossAxisSpacing: 8,
                                            mainAxisExtent: 250),
                           itemBuilder: (context, index)  {
                              // Get the product name, ensuring it's not null
                              String productName = featureData[index]['pro_name'] ?? '';
                  
                              // Truncate the product name to 20 characters
                              String truncatedName = productName.length > 20 ? productName.substring(0, 16) + '...' : productName;
                  
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Image.network(
                                        '${imgUrl}product_image/${featureData[index]['first_image']}',
                                        width: 150,
                                          height: 170,
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            // Handle favorite action here
                                            print('Favorite tapped for ${featureData[index]['pro_name']}');
                                          },
                                          child:const Icon(
                                            Icons.favorite_border, // Use the heart icon
                                            color: Colors.red, // Heart color
                                            size: 24, // Size of the icon
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                 10.heightBox,
                                  truncatedName
                                      .text
                                      .fontFamily(bold).fontWeight(FontWeight.w600)
                                      .color(primaryColor)
                                      .make(),
                                 10.heightBox,
                                 Row(
                                  children: [
                                    priceText(featureData[index]['price']),
                  8.widthBox,
                  mrpText(featureData[index]['mrp']),
                     
                                 ],),
                                  
                                ],
                              )
                                  .box
                                  .white.shadowSm
                                  .roundedSM
                                 
                                  .padding(const EdgeInsets.all(8))
                                  .margin(const EdgeInsets.symmetric(horizontal: 4))
                                  .make().onTap(()async{
                                   await  controller.fetchImages(featureData[index]['pro_code']);
                                   await  controller.fetchColors(featureData[index]['pro_code']);
                                   controller.initializePlayer(featureData[index]['youtube_link']);
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductViewSingle(data: featureData[index])));
                                  });
                            },
                          );
                      }
                    },
                  ),
                ),
              );
}

Widget allProducts(){
  var controller = Get.put(ProductController());
  return  SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: FutureBuilder(
  future: controller.getProducts(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return SizedBox( width: context.width,height: 200, child: Center(child: CircularProgressIndicator(color: secondColor,)));
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      List<Map<String, dynamic>> featureData = snapshot.data as List<Map<String, dynamic>>;
      return Row(
        children: List.generate(
          featureData.length,
          (index) {
            // Get the product name, ensuring it's not null
            String productName = featureData[index]['pro_name'] ?? '';

            // Truncate the product name to 20 characters
            String truncatedName = productName.length > 20 ? productName.substring(0, 16) + '...' : productName;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Image.network(
                      '${imgUrl}product_image/${featureData[index]['first_image']}',
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          // Handle favorite action here
                          print('Favorite tapped for ${featureData[index]['pro_name']}');
                        },
                        child:const Icon(
                          Icons.favorite_border, // Use the heart icon
                          color: Colors.red, // Heart color
                          size: 24, // Size of the icon
                        ),
                      ),
                    ),
                  ],
                ),
               10.heightBox,
                truncatedName
                    .text
                    .fontFamily(bold).fontWeight(FontWeight.w600)
                    .color(primaryColor)
                    .make(),
               10.heightBox,
               Row(
                children: [
                  priceText(featureData[index]['price']),
8.widthBox,
mrpText(featureData[index]['mrp']),
   
               ],),
                
              ],
            )
                .box
                .white.shadowSm
                .roundedSM
                .width(120)
                .padding(const EdgeInsets.all(8))
                .margin(const EdgeInsets.symmetric(horizontal: 4))
                .make().onTap(()async{
                 await  controller.fetchImages(featureData[index]['pro_code']);
                 await  controller.fetchColors(featureData[index]['pro_code']);
                 controller.initializePlayer(featureData[index]['youtube_link']);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductViewSingle(data: featureData[index])));
                });
          },
        ),
      );
    }
  },
)
                              );
}

Widget textWithBox(Widget child) {
  return Container(
    padding: EdgeInsets.only(top: 4, bottom: 4, left: 13, right: 13),
    decoration: BoxDecoration(
      color: primaryColor, // Set the background color
      borderRadius: BorderRadius.circular(10),
    ),
    child: child, // Use the passed child widget here
  );
}
Widget priceText(price,{double size = 12}){
  return '\u{20B9} $price'
                    .text
                    .color(greenColor).fontWeight(FontWeight.w600)
                    .fontFamily(bold)
                    .size(size)
                    .make();
}

Widget mrpText(price){
  return  Text(
      '\u{20B9} $price',
      style:const TextStyle(
        color: redColor,
        fontFamily: bold,
        fontWeight: FontWeight.bold,
        fontSize: 12,
        decoration: TextDecoration.lineThrough, // Strike through
      ),);
}
 appBarBack(){
  return AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            appname,
            style: TextStyle(color:secondColor),
          ),
          iconTheme: IconThemeData(color: secondColor), 
        );
}
Widget detailsCard({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        count!,
        style: const TextStyle(
            fontFamily: bold, color:secondColor, fontSize: 16,fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        title!,
        style: const TextStyle(color: secondColor,fontFamily: regular),
      ),
    ],
  )
      .box
      .color(primaryColor).shadowSm
      .roundedSM
      .height(80)
      .width(width)
      .padding(const EdgeInsets.all(4))
      .make();
}

Widget exitDialog(context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Confirm",
          style: TextStyle(fontFamily: bold, fontSize: 18, color: darkFontGrey),
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Are You Want to Exit?",
          style: TextStyle(fontFamily: bold, fontSize: 16, color: darkFontGrey),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(
                color: primaryColor,
                onPress: () {
                  SystemNavigator.pop();
                },
                textColor: whiteColor,
                title: "Yes"),
            ourButton(
                color: primaryColor,
                onPress: () {
                  Navigator.pop(context);
                },
                textColor: whiteColor,
                title: "No"),
          ],
        )
      ],
    ).box.color(lightGrey).padding(const EdgeInsets.all(12)).roundedSM.make(),
  );
}


Widget customTextFiled({String? title, String? hint, controller, isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(Vx.black).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        controller: controller,
        obscureText: isPass,
        decoration: InputDecoration(
            hintText: hint,
            helperStyle: TextStyle(
              fontFamily: semibold,
              color: textFieldGrey,
            ),
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Vx.black),
            )),
      ),
      15.heightBox,
    ],
  );
}

Widget loadingIndicator() {
  return const Center(
    child:  CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(primaryColor),
    ),
  );
}

Widget ourButton({onPress, color, textColor, String? title}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.all(12.0),
      ),
      onPressed: onPress,
      child: title!.text.color(textColor).fontFamily(bold).make());
}


Widget homeButtons({width, height, icon, String? title, onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 26,
      ),
      10.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  ).box.rounded.white.size(width, height).shadowSm.make();
}