

import '../../controller/profile_controller.dart';


import '../../consts/consts.dart';
import '../widgets.dart';
import 'password_change.dart';
import 'profile_edit.dart';


// ignore: must_be_immutable
class ProfileIndex extends StatelessWidget {
 const ProfileIndex({super.key});
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: appBarBack(),
          body: Container(
            color:whiteColor,
            child: SafeArea(

              child: Center(
                child: Column(

                  children: [
                     30.heightBox,
                         "Profile Section".text.semiBold.color(primaryColor).size(20).make(),
                           ListTile(
                                      leading: Image.asset(
                                        imgProfile2,
                                        width: 22,
                                      ),
                                      title: "Edit Profile".text.semiBold.color(primaryColor).make(),
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
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileEdit()));
                              }),


                               ListTile(

                                      leading: Image.asset(
                                        changePassword,
                                        width: 22,
                                      ),
                                       title: "Change Password".text.semiBold.color(primaryColor).make(),
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
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const PasswordChange()));
                              }),


                  ],
                ),
              ),
            ),
          ),
      
    );
   
  }
}
