import '../../consts/consts.dart';
import '../../controller/cart_controller.dart';
import '../widgets.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
controller.cartQtyPriceTotal();
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child:  Scaffold(
          backgroundColor: whiteColor,
          appBar: appBarBack(),
           bottomNavigationBar :  Container(
                     height: 70,
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
                   ) ,child: Column(
                    children: [
                      controller.isLoading.value?loadingIndicator() :  ourButton(
                          
                                    color: primaryColor,
                                    onPress: () async {
                                      controller.isLoading.value=true;
                                    controller.  placeOrder();
                                      controller.isLoading.value=false;
                                    },
                                    textColor: secondColor,
                                    title: 'Place Order'),
                    ],
                   ),),
          
          body:  SingleChildScrollView(
              child:   Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "CheckOut"
                              .text
                              .size(20)
                              .bold
                              .color(primaryColor)
                              .fontFamily(semibold)
                              .make(),
                         20.heightBox,
                        
                       Center(
                         child: SingleChildScrollView(
                          
                               child: DataTable(
                                 columns: [
                                   DataColumn(label: Text('Description')),
                                   DataColumn(label: Text('Amount')),
                                 ],
                                 rows: [
                                   DataRow(cells: [
                                     DataCell(Text('Total Amount')),
                                     DataCell(Text('\u{20B9} ${controller.mrpAndQty}')),
                                   ]),
                                   DataRow(cells: [
                                     DataCell(Text('Discount')),
                                      DataCell(Text('\u{20B9} ${controller.discount}')),
                                   ]),
                                   DataRow(cells: [
                                     DataCell(Text('Quantity')),
                                     DataCell(Text(' ${controller.totalQty}')),
                                   ]),
                                   DataRow(cells: [
                                     DataCell(Text('Net Amount')),
                                       DataCell(Text('\u{20B9} ${controller.totalPrice}')),
                                   ]),
                                 ],
                               ),
                             ),
                       ).box.white.shadow.padding(EdgeInsets.all(8.2)).make(),
                
    
                      
                        ],
                      ),
                    ),
              ),
             
           
          ),
    
       
    
    );
  }
}
