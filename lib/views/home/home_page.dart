
import 'package:z2hhealthcare/controller/app_controller.dart';

import '../../views/products/product_view_single.dart';
import '../../controller/product_controller.dart';
import '../../consts/consts.dart';
import '../products/products_all.dart';
import '../widgets.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    var appController = Get.put(AppController());
    appController.getBanners();
    return  Scaffold(
      drawer: drawerCardMember(context),
       appBar:  AppBar(
         iconTheme:const IconThemeData(color: Vx.white),
          backgroundColor: primaryColor,
          centerTitle: true,

          actions: [
            IconButton(
              icon:const Icon(Icons.notifications,color: secondColor,),
              onPressed: () {
                // Action for notifications button
              },
            ),
          ],
          title: const Text(
            appname,
            style: TextStyle(color:secondColor),
          ),
        
        ),
      body: Container(

        color: whiteColor,
        child: SafeArea(

           child: Column(
        children: [
          Expanded(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            20.heightBox,
            SizedBox(
              height: 170,
              child: VxSwiper.builder(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  height: 200,
                  enlargeCenterPage: true,
                  itemCount:appController. bannerList.length,
                  itemBuilder: (context, index) {

                    var row=appController. bannerList[index];


                    return Image.network(
                      "$imgUrl/banners/${row['url']}",
                      fit: BoxFit.fill,
                    )
                        .box
                        .rounded
                        .shadow
                        .clip(Clip.antiAlias)
                        .margin(const EdgeInsets.symmetric(horizontal: 8))
                        .make();
                  }),
            ),
            20.heightBox,
         Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            2,
                            (index) => homeButtons(
                                  height: context.screenHeight * 0.15,
                                  width: context.screenWidth / 2.5,
                                  icon: index == 0 ? icTodaysDeal : icFlashDeal,
                                  title: index == 0 ? 'Today Deals' : 'New Arrivals',
                                ).onTap((){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductsAll(passValue: index == 0 ? '2' : '1')));
                                })
                                ),
                      ),
                10.heightBox,
                   Container(
                    padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: primaryColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
      'New Arrivals'
                                        .text
                                        .white
                                        .bold
                                        .size(18)
                                        .make(),
                                        'View All >'
                                        .text
                                        .white
                                        .bold
                                        .size(12)
                                        .make().onTap((){
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProductsAll(passValue:  '1')));
                                        }),
                          ],),


                                10.heightBox,
                                SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: FutureBuilder(
        future: controller.getProducts('is_new'),
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
                        child:  GestureDetector(
                            onTap: () async{

                             await controller.wishListSubmit(featureData[index]['pro_code']);
                            },
                            child:  FutureBuilder<String>(
                                future: controller.getWishListStatus(featureData[index]['pro_code']),
                                  builder: (context, snapshot){
                                    IconData favorite = snapshot.data=='true'?Icons.favorite:Icons.favorite_border;
                                  return  Icon(
                                      favorite, // Use the heart icon
                                      color: Colors.red, // Heart color
                                      size: 24, // Size of the icon
                                    );

                                  }
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
                  .white
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
                                ),
                        ],),
                   ),
      10.heightBox,
                    Container(
                       padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
      'Today Deals'
                                        .text
                                        .color(primaryColor)
                                        .bold
                                        .size(18)
                                        .make(),
                                        'View All >'
                                        .text
                                        .color(primaryColor)
                                        .bold
                                        .size(12)
                                        .make().onTap((){
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProductsAll(passValue:  '2')));
                                        }),
                          ],),

                           10.heightBox,
                           allProducts('is_today'),
                            10.heightBox,
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                       padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
      'Best Selling'
                                        .text
                                        .color(primaryColor)
                                        .bold
                                        .size(18)
                                        .make(),
                                        'View All >'
                                        .text
                                        .color(primaryColor)
                                        .bold
                                        .size(12)
                                        .make().onTap((){
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProductsAll(passValue:  '3')));
                                        }),
                          ],),

                           10.heightBox,
                           allProducts('is_best'),
                            10.heightBox,
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                       padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
      'Offer Products'
                                        .text
                                        .color(primaryColor)
                                        .bold
                                        .size(18)
                                        .make(),
                                        'View All >'
                                        .text
                                        .color(primaryColor)
                                        .bold
                                        .size(12)
                                        .make().onTap((){
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProductsAll(passValue:  '4')));
                                        }),
                          ],),

                           10.heightBox,
                           allProducts('is_offer'),
                            10.heightBox,
                        ],
                      ),
                    ),

                                  10.heightBox,

          ],),
        ),
          ),

        ],
           ),
        ),
      ),
    );
  }
}

