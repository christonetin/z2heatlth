import 'package:flutter/services.dart';
import '../../consts/consts.dart';
import 'package:http/http.dart' as http;

import '../views/authscreen/login_screen.dart';
import '../views/home/home.dart';

class AuthController extends GetxController {
  var userId = ''.obs;
  var isLoading = false.obs;
  var mobileController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var sponsorIdController = TextEditingController().obs;
  var userIdController = TextEditingController().obs;
  var mobileValidate = false.obs;
  var passwordValidate = false.obs;
  var sponserName = "".obs;
  var userName = "".obs;
  @override
  void onInit() async {
    super.onInit();
    SharedPreferences.getInstance().then((preferences) {
      userId.value = preferences.getString('userIdShared') ?? '';
    });

  }

  userIdToName(context,userid)async{
    isLoading.value=true;
    String uri = '${url}action.php';
    var res = await http.post(Uri.parse(uri), body: {
      'user_id': userid.toString(),
      'userIdToName': '',
    });

    var response = jsonDecode(res.body);
    if (response == 'not_exit') {
      VxToast.show(context, msg: 'User ID Id Not Exist',bgColor: redColor,textColor: whiteColor);
    } else {
      userName.value="User Name : ${response.toString()}";

    }
    isLoading.value=false;
  }

  checkSponsorId(context)async{
    isLoading.value=true;
    String uri = '${url}action.php';
    var res = await http.post(Uri.parse(uri), body: {
      'user_id': sponsorIdController.value.text,
      'checkSponsorId': '',
    });

    var response = jsonDecode(res.body);
    if (response == 'not_exit') {
      VxToast.show(context, msg: 'Sponsor Id Not Exist',bgColor: redColor,textColor: whiteColor);
    } else {
      sponserName.value="Sponsor Name : ${response.toString()}";

    }
    isLoading.value=false;
  }

  logout(context)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userIdShared');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>const LoginScreen()));
  }

  loginUser(context)async{
    mobileController.value.text.isEmpty ? mobileValidate.value=true : mobileValidate.value=false;
    passwordController.value.text.isEmpty ? passwordValidate.value=true : passwordValidate.value=false;

    if(passwordController.value.text.isNotEmpty && passwordController.value.text.isNotEmpty){

      String uri = '${url}action.php';
      isLoading.value=true;
      var res = await http.post(Uri.parse(uri), body: {
        'mobile': mobileController.value.text,
        'password': passwordController.value.text,
        'loginUser': '',
      });

      var response = jsonDecode(res.body);
      if (response == 'false') {
        VxToast.show(context, msg: 'Wrong Details',bgColor: redColor,textColor: whiteColor);
      } else {
        // ignore: use_build_context_synchronously
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('userIdShared', response);
        userId.value = preferences.getString('userIdShared')!;
        // ignore: use_build_context_synchronously
        VxToast.show(context, msg: 'Login Successfully',bgColor:greenColor,textColor: whiteColor);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  Home()),
        );
      }
    }
    else {
      VxToast.show(context, msg: 'Fill All Fileds',bgColor: redColor,textColor: whiteColor);
    }

    isLoading.value=false;
  }

}
