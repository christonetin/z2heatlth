


import '../../../consts/consts.dart';
import '../../../controller/profile_controller.dart';
import '../widgets.dart';


class PasswordChange extends StatelessWidget {
  const PasswordChange({super.key});

  @override
  Widget build(BuildContext context) {
   var controller = Get.put(ProfileController());
     return Container(
 decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imgBackground), fit: BoxFit.fill)),
      child: Scaffold(
          appBar: appBarBack(),
          body:  SingleChildScrollView(
              child: Obx(()=> Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
       
          
                     30.heightBox,
                        20.heightBox,
                    "Password Change".text.color(primaryColor).size(20).bold.make(),
                 20.heightBox,
                    TextField(
                  controller: controller.oldPass.value,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Your Old Password',
                    labelText: 'Old Password',
                    labelStyle:const TextStyle(color:Vx.black), 
                    errorText: controller.oldPassvalidate.value
                        ? 'Value can\'t Be Empty'
                        : null,
                  ),
                ),
                20.heightBox,
                TextField(
                  controller: controller.newPass.value,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter New Password',
                    labelText: 'New Password',
                     labelStyle:const TextStyle(color:Vx.black),  
                    errorText: controller.newPassValidate.value
                        ? 'Value can\'t Be Empty'
                        : null,
                  ),
                ),
                 20.heightBox,
                    TextField(
                  controller: controller.confirmPass.value,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Confirm New Password',
                    labelText: 'Confirm Password',
                    labelStyle:const TextStyle(color:Vx.black), 
                    errorText: controller.confirmPassValidate.value
                        ? 'Value can\'t Be Empty'
                        : null,
                  ),
                ),
                    
                   
                   22.heightBox,
                    SizedBox(
                      width: context.screenWidth - 40,
                      child: controller.isLoading.value?loadingIndicator(): ourButton(
                              color: primaryColor,
                              onPress: () async {
                               await controller.changePassword(context);
                              },
                              textColor: whiteColor,
                              title: 'Update'),
                    ),
                    ],
                  )
                      .box
                      .white
                      .shadowSm
                      .rounded
                      .padding(EdgeInsets.all(16))
                      .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
                      .make(),
              ),
              ),
            ),
       
    );
  }
}