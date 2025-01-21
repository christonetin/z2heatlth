import '../../views/widgets.dart';
import '../../consts/consts.dart';
class ProductsAll extends StatelessWidget {
  final String  passValue;
 const ProductsAll({super.key, required this.passValue}); 
  @override
  Widget build(BuildContext context) {
    String title='';
 switch (passValue) {
   case "1":
     title='New Arrivals';
     break;
      case "2":
     title='Today Deals';
      case "3":
     title='Best Selling';
      case "4":
     title='Offer Products';
     break;
   default:
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
        specialProducts(),
            ],
          ),
        )
      ),
    );
  }
}
