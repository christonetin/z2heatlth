import '../../views/widgets.dart';
import '../../consts/consts.dart';
class ProductsAll extends StatelessWidget {
  final String  passValue;
 const ProductsAll({super.key, required this.passValue}); 
  @override
  Widget build(BuildContext context) {
    String title='',type='';
 switch (passValue) {
   case "1":
     type='is_new';
     title='New Arrivals';
     break;
      case "2":
        type='is_today';
     title='Today Deals';
      case "3":
        type='is_best';
     title='Best Selling';
      case "4":
        type='is_offer';
     title='Offer Products';
     break;
   default:
     type='all';
    title='All Products';
 }
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
        specialProducts(type),
            ],
          ),
        )
      ),
    );
  }
}
