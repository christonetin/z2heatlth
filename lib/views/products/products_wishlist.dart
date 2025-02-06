import 'package:z2hhealthcare/views/products/product_view_single.dart';

import '../../controller/product_controller.dart';
import '../../views/widgets.dart';
import '../../consts/consts.dart';
class ProductsWishlist extends StatelessWidget {

 const ProductsWishlist({super.key});
  @override
  Widget build(BuildContext context) {
    String title='WishList Products';
    var controller = Get.put(ProductController());
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: appBarBack(),
     
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightBox,
              title.text
                                        .color(primaryColor)
                                        .bold
                                        .size(18)
                                        .make(),
                          20.heightBox,
              Expanded(
                child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: controller.getWishListProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox( width: context.width,height: 200, child: Center(child: loadingIndicator()));
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
              ),
            ],
          ),
        )
      ),
    );
  }
}
