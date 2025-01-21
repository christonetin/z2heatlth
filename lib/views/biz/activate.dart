

import 'package:z2hhealthcare/controller/biz_controller.dart';

import '../../../consts/consts.dart';
import '../../controller/auth_controller.dart';
import '../widgets.dart';



class ActivateUser extends StatelessWidget {
  const ActivateUser({super.key});

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
              "Activate User".text.color(primaryColor).size(20).bold.make(),


              20.heightBox,

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: authController.userIdController.value,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Activator ID',
                        labelText: 'Activate ID',

                      ),
                    ),
                  ),
                  5.widthBox,
                  controller.isLoading.value?loadingIndicator(): ElevatedButton(
                    onPressed: () async{
                      await authController.userIdToName(context,authController.userIdController.value.text);
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Set the border radius
                      ),
                    ),
                    child: const Text('Check',style: TextStyle(color: whiteColor),),
                  )
                ],
              ),

              5.heightBox,
              "${authController.userName}".text.color(Vx.black).size(10).make(),


              25.heightBox,
              controller.isLoading.value?loadingIndicator() :  ourButton(
                  color: primaryColor,
                  onPress: () async {

                  },
                  textColor: whiteColor,
                  title: 'Activate').box.width(context.screenWidth - 50).make(),
            ],
          )
              .box
              .white
              .shadowSm
              .rounded
              .padding(const EdgeInsets.all(16))
              .margin( const EdgeInsets.only(top: 50, left: 12, right: 12))
              .make(),
          ),
        ),
      ),

    );
  }
}