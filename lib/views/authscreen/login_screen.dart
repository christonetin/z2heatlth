

import '../../consts/consts.dart';
import '../../controller/auth_controller.dart';
import '../widgets.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imgBackground), fit: BoxFit.fill)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body:  Center(
          child: Column(
            children: [
              (context.screenHeight * 0.10).heightBox,
              Image.asset(icAppLogo)
                  .box
                  .color(Vx.gray200)
                  .size(77, 77)
                  .padding(const EdgeInsets.all(8))
                  .rounded
                  .make(),
              "Login to $appname".text.fontFamily(bold).white.size(18).make(),
              50.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  20.heightBox,
                  TextField(
                    controller: controller.mobileController.value,
                    decoration:  InputDecoration(
                      border:const  OutlineInputBorder(),
                      hintText: 'Enter Your Mobile Number',
                      labelText: 'Mobile Number',
                      errorText: controller.mobileValidate.value
                          ? 'Value can\'t Be Empty'
                          : null,
                    ),

                  ),

                  20.heightBox,
                  TextField(
                    controller: controller.passwordController.value,
                    obscureText: true,
                    decoration:  InputDecoration(
                      border:const  OutlineInputBorder(),
                      hintText: 'Enter Your Password',
                      labelText: 'Password',
                      errorText: controller.passwordValidate.value
                          ? 'Value can\'t Be Empty'
                          : null,
                    ),),
                  20.heightBox,
                  controller.isLoading.value?loadingIndicator() :  ourButton(
                      title: 'Login',
                      color: primaryColor,
                      textColor: whiteColor,
                      onPress: () async {
                        await controller.loginUser(context);
                      }).box.width(context.screenWidth - 50).make(),

                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "If not Register Please ".text.make(),
                      " Click Here".text.color(primaryColor).bold.make().onTap((){

                      }),
                    ],)




                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),

            ],
          ),
        ),
        ),
    );
  }
}
