

import '../../controller/biz_controller.dart';

import '../../../consts/consts.dart';
import '../../controller/auth_controller.dart';
import '../widgets.dart';



class RegisterFromPanel extends StatelessWidget {
  const RegisterFromPanel({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Get.put(AuthController());
    var controller = Get.put(BizController());
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imgBackground), fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(),
        body:  SingleChildScrollView(
          child: Obx(()=> Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              30.heightBox,
              "Register User".text.color(primaryColor).size(20).bold.make(),


              20.heightBox,

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: authController.sponsorIdController.value,
                      decoration:  InputDecoration(
                        border:const OutlineInputBorder(),
                        hintText: 'Enter Sponsor ID',
                        labelText: 'Sponsor ID',
                        errorText: controller.sponsorIdValidate.value
                            ? 'Value can\'t Be Empty'
                            : null,
                      ),
                    ),
                  ),
                  5.widthBox,
                  controller.isLoading.value?loadingIndicator(): ElevatedButton(
                    onPressed: () async{
                      await authController.checkSponsorId(context);
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Set the border radius
                      ),

                    ),
                    child:const Text('Check',style: TextStyle(color: whiteColor),),
                  )
                ],
              ),

              5.heightBox,
              "${authController.sponserName}".text.color(Vx.black).size(10).make(),
              5.heightBox,

              TextField(
                controller: controller.nameController.value,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Name',
                  labelText: 'Name',
                  labelStyle:const TextStyle(color:Vx.black),
                  errorText: controller.nameValidate.value
                      ? 'Value can\'t Be Empty'
                      : null,

                ),
              ),
              20.heightBox,
              TextField(
                controller: controller.mobileController.value,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Mobile Number',
                  labelText: 'Mobile',
                  labelStyle:const TextStyle(color:Vx.black),
                  errorText: controller.mobileValidate.value
                      ? 'Value can\'t Be Empty'
                      : null,
                ),
              ),
              20.heightBox,
              TextField(
                controller: controller.mailController.value,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Email id',
                  labelText: 'Mail id',
                  labelStyle:const TextStyle(color:Vx.black),
                  errorText: controller.mailValidate.value
                      ? 'Value can\'t Be Empty'
                      : null,
                ),
              ),
              20.heightBox,
              TextField(
                controller: controller.passwordController.value,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Password',
                  labelText: 'Password',
                  labelStyle:const TextStyle(color:Vx.black),
                  errorText: controller.passwordValidate.value
                      ? 'Value can\'t Be Empty'
                      : null,
                ),
              ),
              20.heightBox,
              controller.isLoading.value?loadingIndicator() :  ourButton(
                  color: primaryColor,
                  onPress: () async {
                    controller.isLoading.value=true;
                    await controller. registerFromPanel(context,authController.sponsorIdController.value.text);
                    controller.isLoading.value=false;
                  },
                  textColor: whiteColor,
                  title: 'Register').box.width(context.screenWidth - 50).make(),
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