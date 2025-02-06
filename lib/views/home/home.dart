
import '../../views/products/products_all.dart';

import '../../controller/app_controller.dart';
import '../widgets.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


import '../../../consts/consts.dart';
import '../cart/cart.dart';
import 'home_page.dart';
import '../profile/profile_screen.dart';


// ignore: must_be_immutable
class Home extends StatelessWidget {
   Home({super.key});
     var controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {

    final List<Widget> navbarItem=[Icon(Icons.house,size: 18,),Icon(Icons.add_box_outlined,size: 18,),Icon(Icons.shopping_bag,size: 18,),Icon(Icons.people_alt,size: 18,),];

  var navBody = [
   
    const HomePage(),
    const  ProductsAll(passValue: "0"), 
    const Cart(),
    const ProfileScreen(),
   
  ];
    return WillPopScope(

      onWillPop: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => exitDialog(context));
        return false;
      },
   child: Scaffold( 
       
         body:Column(
            children: [
              Obx(
                () => Expanded(
                  child: navBody.elementAt(controller.currentNavIndex.value),
                ),
              ),
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(items: navbarItem , onTap: (value){
              controller.currentNavIndex.value = value;
          },
          backgroundColor: primaryColor,
          height: 50,
           ),


       
        ),

       
    );
  }
}
