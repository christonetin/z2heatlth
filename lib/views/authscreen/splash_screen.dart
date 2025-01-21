


import '../../controller/profile_controller.dart';

import '../../consts/consts.dart';
import '../../controller/auth_controller.dart';

import '../home/home.dart';
import 'login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var controller = Get.put(AuthController());
  var profileController = Get.put(ProfileController());
  changeScreen() {

    Future.delayed(Duration(seconds: 3), () async {
      if (controller.userId.isEmpty) {

        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>const  LoginScreen()));
      } else {
        profileController.onInit();
 Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  Home()));
      }
    });
  }

  @override
  void initState() {
    changeScreen();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  icSplashBg,
                  width: 300,
                ),
              ),
              20.heightBox,
              Image.asset(icAppLogo)
                  .box
                  .color(Vx.gray200)
                  .size(77, 77)
                  .padding(const EdgeInsets.all(8))
                  .rounded
                  .make(),
              10.heightBox,
              appname.text.fontFamily(bold).size(22).white.make(),
              5.heightBox,
              appversion.text.white.make(),
              const Spacer(),
              credits.text.white.fontFamily(semibold).make(),
            ],
          )),
    );
  }
}
