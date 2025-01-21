import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:email_validator/email_validator.dart';
import '../../consts/consts.dart';
import 'package:http/http.dart' as http;

import 'auth_controller.dart';

class ProfileController extends GetxController {
  var authController = Get.put(AuthController());
  var userId = ''.obs;
 var isLoading = false.obs;
Map<String, dynamic>? data;


  var profileImgPath = ''.obs;
  var profile = ''.obs;
  var nameController = TextEditingController().obs;
  var mobileController = TextEditingController().obs;
  var mailController = TextEditingController().obs;
  var wallatController = TextEditingController().obs;

  var oldPass = TextEditingController().obs;
  var newPass = TextEditingController().obs;
  var confirmPass = TextEditingController().obs;

 var nameValidate = false.obs;
 var mobileValidate = false.obs;
   final RxBool mailValidate = false.obs;

     var oldPassvalidate = false.obs;
  var newPassValidate = false.obs;
  var confirmPassValidate = false.obs;


    @override
  void onInit() async {
    userId = authController.userId;
    getUserData ();
    super.onInit();
  }


    changePassword(context)async{
oldPass.value.text.isEmpty? oldPassvalidate.value = true : oldPassvalidate.value = false;
newPass.value.text.isEmpty? newPassValidate.value = true : newPassValidate.value = false;
confirmPass.value.text.isEmpty? confirmPassValidate.value = true : confirmPassValidate.value = false;

if(newPass.value.text==confirmPass.value.text)
{
   String uri = '${url}action.php';

    try {
      isLoading.value=true;
      var res = await http.post(Uri.parse(uri), body: {
        "checkOldPassword": '',
       'mobile': userId.toString(),
        "old_pass": oldPass.value.text,
      });
 var response = jsonDecode(res.body);

      if (response == 'true') {
 var res2 = await http.post(Uri.parse(uri), body: {
        "changePassword": '',
       'mobile': userId.toString(),
        "new_pass": newPass.value.text,
      });
       var response2 = jsonDecode(res2.body);
 if (response2 == 'true') {
 VxToast.show(context,
            msg: 'Password Update Successfully',
            bgColor: Colors.green,
            textColor: whiteColor);
 }
 else{
   VxToast.show(context,
            msg: 'Something Wrong',
            bgColor: Colors.red,
            textColor: whiteColor);
 }
       
      } else {
        VxToast.show(context,
            msg: 'Wrong Old Password', bgColor: Colors.red, textColor: whiteColor);
      }

        isLoading.value=false;

    } catch (e) {
      print(e);
    }
  
}
else{
   VxToast.show(context,
            msg: 'Password Doesnot Match', bgColor: Colors.red, textColor: whiteColor);
}
  }

  updateProfile(context)async{

   nameController.value.text.isEmpty? nameValidate.value = true: nameValidate.value = false;
 
   mailController.value.text.isEmpty? mailValidate.value = true: mailValidate.value = false;

if(mailController.value.text.isNotEmpty && mailController.value.text.isNotEmpty){
    String uri = '${url}action.php';
      var res = await http.post(Uri.parse(uri), body: {
        'updateProfile': '',
        'mobile': userId.toString(),
        'name': nameController.value.text,
      
        'mail': mailController.value.text,

      });
      data = json.decode(res.body);

      if(data!['res']=='true'){
      
 VxToast.show(context, msg: 'Profile Update Successfully',bgColor:greenColor,textColor: whiteColor);
      }
      else{
         VxToast.show(context, msg: 'Somthing Wrong',bgColor:redColor,textColor: whiteColor);
      }

}
 else{
         VxToast.show(context, msg: 'Fill Required Fileds',bgColor:redColor,textColor: whiteColor);
      }

}
    
      void validateEmail(String value) {
    mailValidate.value = value.isEmpty || !EmailValidator.validate(value);
  }

   Future<void> uploadProfileImage(context) async {
      if(profileImgPath.value != ''){
    String uri = '${url}action.php';
    var uploadurl = Uri.parse(uri);
    try{
        isLoading.value=true;
       List<int> imageBytes = uploadimage!.readAsBytesSync();
      String baseimage = base64Encode(imageBytes);
      var response = await http.post(uploadurl, body: {
        'image': baseimage,
        'uploadProfileImage': '',
        'mobile': userId.toString(),
      });
       if (response.statusCode == 200) {
        var jsondata = json.decode(response.body);
        if (jsondata["error"]) {
          VxToast.show(context,
            msg: 'Somthing Wrong',
            bgColor: Colors.red,
            textColor: whiteColor);
        } else {

            profile.value=jsondata["msg"];
          VxToast.show(context,
            msg: 'Profile Updated',
            bgColor: Colors.green,
            textColor: whiteColor);
        }
      } else {
         VxToast.show(context,
            msg: 'Server Error',
            bgColor: Colors.red,
            textColor: whiteColor);
      }
        isLoading.value=false;
    }

    
     catch (e) {
      print("Error during converting to Base64");
    }
      }
      else{
         VxToast.show(context,
            msg: 'Choose File First',
            bgColor: Colors.red,
            textColor: whiteColor);
      }


  
  }


      File? uploadimage;
  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImgPath.value = img.path;
        uploadimage = File(img.path);
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

var name="".obs,mobile="".obs,isBusiness=''.obs,totalIncome=0.obs,wallet=0.obs,levelIncome=0.obs,refCount=0.obs,levelCount=0.obs;
  getUserData () async {
    String uri = '${url}action.php';
      var res = await http.post(Uri.parse(uri), body: {
        "getUserData": '',
        "user_id": userId.toString(),
      });
      data = json.decode(res.body);

 if (data != null) {
       
        nameController.value.text = data!['name'] ?? '';
        mobileController.value.text = data!['mobile'] ?? '';
        mailController.value.text = data!['mail'] ?? '';
        profile.value = data!['profile_pic'] ?? '';
        name.value = data!['name'] ?? '';
        mobile.value = data!['mobile'] ?? '';
        isBusiness.value =data!['is_business'] ?? '';
        totalIncome.value = int.tryParse(data!['total_income'] ?? '0') ?? 0;
        wallet.value =int.tryParse(data!['wallet'] ?? '0') ?? 0;
        levelIncome.value = int.tryParse(data!['level_income'] ?? '0') ?? 0;
        refCount.value = int.tryParse(data!['ref_count'] ?? '0') ?? 0;
        levelCount.value = int.tryParse(data!['level_count'] ?? '0') ?? 0;
        wallatController.value.text = data!['wallet'] ?? '';

      }
   
  }

    }