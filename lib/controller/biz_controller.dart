
import '../views/authscreen/welcome_screen2.dart';
import '../views/biz/dash_board.dart';
import 'profile_controller.dart';

import '../../consts/consts.dart';
import 'auth_controller.dart';
import 'package:http/http.dart' as http;
class BizController extends GetxController {
  var authController = Get.put(AuthController());
  var profileController = Get.put(ProfileController());
  var userId = ''.obs;
  var isLoading = false.obs;
  var sponsorIdValidate = false.obs;
  var  nameValidate= false.obs;
  var  mobileValidate= false.obs;
  var  mailValidate= false.obs;
  var  passwordValidate= false.obs;

  var sponsorIdController = TextEditingController().obs;
  var nameController = TextEditingController().obs;
  var mobileController = TextEditingController().obs;
  var mailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  @override
  void onInit() async {
    super.onInit();
    userId = authController.userId;

  }


  registerFromPanel(context,sponsorID)async{

    nameController.value.text.isEmpty ? nameValidate.value=true : nameValidate.value=false;
    mobileController.value.text.isEmpty ? mobileValidate.value=true : mobileValidate.value=false;
    mailController.value.text.isEmpty ? mailValidate.value=true : mailValidate.value=false;
    passwordController.value.text.isEmpty ? passwordValidate.value=true : passwordValidate.value=false;

    if(nameController.value.text.isNotEmpty && mobileController.value.text.isNotEmpty && mailController.value.text.isNotEmpty && passwordController.value.text.isNotEmpty ){

        String uri = '${url}action.php';
        var res = await http.post(Uri.parse(uri), body: {
          'sponsor_id': sponsorID,
          'name': nameController.value.text,
          'mobile': mobileController.value.text,
          'mail': mailController.value.text,
          'password': passwordController.value.text,
          'registerFromPanel': '',
        });
        print('Result is ${res.body}');
      var  data = jsonDecode(res.body);

        if(data!['res']=='wrong_sponsor'){
          VxToast.show(context, msg: 'Wrong Sponsor Id',bgColor: redColor,textColor: whiteColor);
        }
        else{
          VxToast.show(context, msg: 'Register Successfully',bgColor: greenColor,textColor: whiteColor);

           profileController.onInit();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen2(userId: data!['user_id'],password: data!['password'],name: data!['name'] ,sponsorId:data!['sponsor_id'] ,joinDate: data!['join_date'] )));
        }


    }

    else{
      VxToast.show(context, msg: 'Fill All Fileds',bgColor: redColor,textColor: whiteColor);

    }

  }

  applyBiz(context) async {
    String uri = '${url}action.php';
    var res = await http
        .post(Uri.parse(uri), body: {
      "applyBiz": '',
      "user_id": userId.toString(),
    });
  var  data = jsonDecode(res.body);
if(data!['res']=='true'){
  profileController.onInit();
  profileController.isBusiness.value='1'.toString();
  VxToast.show(context, msg: 'Apply Successfully',bgColor: greenColor,textColor: whiteColor);
  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Dashboard()));
}
else{
  VxToast.show(context, msg: 'Something Wrong',bgColor: redColor,textColor: whiteColor);
}

  }
}

