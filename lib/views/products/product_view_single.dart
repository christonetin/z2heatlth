import '../../../controller/cart_controller.dart';
import '../../../controller/product_controller.dart';
import '../../views/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../consts/consts.dart';

class ProductViewSingle extends StatelessWidget {
  final dynamic data;
  const ProductViewSingle({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    var cartController = Get.put(CartController());
    controller.getMainCategory(data['maincat']);
    controller.fetchImages(data['pro_code']);
    controller.fetchColors(data['pro_code']);
    controller.initializePlayer(data['youtube_link']);
    final GlobalKey<VxSwiperState> swiperKey = GlobalKey<VxSwiperState>();
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: appBarBack(),
        bottomNavigationBar: Obx(
          () => Container(
            height: 60,
            padding: EdgeInsets.only(top: 10, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white, // Set the background color
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20)), // Optional: rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  spreadRadius: 1, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, -2), // Changes the position of the shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                10.widthBox,
                textWithBox(
                  const Icon(Icons.remove, color: secondColor, size: 20),
                ).onTap(() {
                  cartController.qtyDecrementSingle();
                }),
                Container(
                  padding:
                      EdgeInsets.only(top: 4, bottom: 4, left: 13, right: 13),
                  decoration: BoxDecoration(
                    color: primaryColor, // Set the background color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: "${cartController.quantity}"
                      .text
                      .size(15)
                      .color(whiteColor)
                      .make(), // Use the passed child widget here
                ),
                textWithBox(
                  const Icon(Icons.add, color: secondColor, size: 20),
                ).onTap(() {
                  cartController.qtyIncrementSingle();
                }),
                10.widthBox,
                ourButton(
                    color: secondColor,
                    onPress: () async {},
                    textColor: Colors.black,
                    title: 'Buy Now'),
                10.widthBox,
                ourButton(
                    color: primaryColor,
                    onPress: () async {
                      String firstImage =
                          await controller.getFirstImg(data['pro_code']);
                      await cartController.addToCart(
                          context, data['pro_code'], firstImage);
                    },
                    textColor: secondColor,
                    title: 'Add to Cart'),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VxSwiper.builder(
                  key: swiperKey,
                  height: 350,
                  itemCount: controller.images.length,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  initialPage: controller.currentIndex.value,
                  onPageChanged: (index) {
                    controller.updateIndex(index); // Update the current index
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      '${imgUrl}product_image/${controller.images[index]["pi_pic"]}',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                ).box.shadow2xl.make(),
                8.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(controller.images.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: controller.currentIndex.value == index ? 12 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: controller.currentIndex.value == index
                            ? primaryColor
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                "${data['pro_name']}"
                                    .text
                                    .size(15)
                                    .bold
                                    .color(primaryColor)
                                    .make(),
                                5.heightBox,
                                "${controller.mainCategory}"
                                    .text
                                    .size(15)
                                    .color(primaryColor)
                                    .make(),
                                10.heightBox,
                                Row(
                                  children: [
                                    priceText(data['price'], size: 20),
                                    8.widthBox,
                                    mrpText(data['mrp']),
                                  ],
                                )
                              ],
                            ),
                          ),
                          10.widthBox,
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                textWithBox(
                                  const Icon(Icons.favorite_border,
                                      color: secondColor, size: 20),
                                ),
                                10.widthBox,
                                textWithBox(
                                  const Icon(Icons.share,
                                      color: secondColor, size: 20),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              "Product SKU"
                                  .text
                                  .size(15)
                                  .bold
                                  .color(primaryColor)
                                  .make(),
                              5.heightBox, 
                              "${data['pro_code']}"
                                  .text
                                  .size(15)
                                  .color(primaryColor)
                                  .make(),
                            ],
                          ),
                          Column(
                            children: [
                              "Available Stock"
                                  .text
                                  .size(15)
                                  .bold
                                  .color(primaryColor)
                                  .make(),
                              5.heightBox,
                              textWithBox("${data['pro_qty']}"
                                  .text
                                  .size(15)
                                  .color(secondColor)
                                  .align(TextAlign.left)
                                  .make()),
                            ],
                          ),
                        ],
                      ),
                      15.heightBox,
                      Column(
                        children: [
                          "Description"
                              .text
                              .size(15)
                              .bold
                              .color(primaryColor)
                              .make(),
                          Html(
                            data: data['pro_desc'],
                            style: {
                              "p": Style(
                                fontSize: FontSize(15.0), // Set font size
                                color: Colors.black, // Set text color
                              ),
                            },
                          ),
                        ],
                      ),
                      15.heightBox,
                      // "Colors".text.size(15).bold.color(primaryColor).make(),
                      // Row(
                      //     children:
                      //         List.generate(controller.images.length, (index) {
                      //   var colorData = controller.images[index];
                      //   Color iconColor = Color(int.parse(
                      //       colorData['pro_color'].replaceFirst('#', '0xff')));
                      //   return Padding(
                      //     padding: const EdgeInsets.all(
                      //         8.0), // Add some padding between icons
                      //     child: Icon(
                      //       Icons.change_circle_rounded,
                      //       size: 30,
                      //       color: iconColor,
                      //     ).onTap(() {
                      //       controller.updateIndex(index); // Update the index
                      //     }),
                      //   );
                      // })),

                      data['youtube_link'] != ''
                          ? Column(
                              children: [
                                "Product Video"
                                    .text
                                    .size(15)
                                    .bold
                                    .color(primaryColor)
                                    .make(),
                                10.heightBox,
                                YoutubePlayer(
                                  controller: controller.playerController,
                                  showVideoProgressIndicator: true,
                                ).box.roundedSM.make(),
                              ],
                            ).box.padding(EdgeInsets.all(10)).make()
                          : Container(),
                               10.heightBox,
                  Container(
                     padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
'Related Products'
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
                                      .make(),
                        ],),
                    
                         10.heightBox,
                         allProducts('is_today'),
                          10.heightBox,
                      ],
                    ),
                  ),
                  10.heightBox,
                    ],
                  ),

                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
