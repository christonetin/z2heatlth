import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../consts/consts.dart';
import 'package:http/http.dart' as http;

import 'auth_controller.dart';
import 'profile_controller.dart';



class WalletController extends GetxController {
  var authController = Get.put(AuthController());
  var profileController = Get.put(ProfileController());
  var withdrawAmountController = TextEditingController().obs;
  var tdsController = TextEditingController().obs;
  var netAmountController = TextEditingController().obs;
  var  referranceController= TextEditingController().obs;
  var  amountController= TextEditingController().obs;
  var userId = ''.obs;

  var isLoading = false.obs;
  var withdrawAmountValidate = false.obs;
  var depositProofpath = ''.obs;

  Map<String, dynamic>? data;


  @override
  void onInit() async {
    userId = authController.userId;
    super.onInit();
  }


  File? uploadimage;
  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      depositProofpath.value = img.path;
      uploadimage = File(img.path);
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  deposit(context)async{
    if(depositProofpath.value != ''){
      String uri = '${url}action.php';
      var uploadurl = Uri.parse(uri);
      List<int> imageBytes = uploadimage!.readAsBytesSync();
      String baseimage = base64Encode(imageBytes);
      var res = await http.post(uploadurl, body: {
        'image': baseimage,
        'amount':amountController.value.text,
        'ref_id':referranceController.value.text,
        'deposit': '',
        'user_id': userId.toString(),
      });
      data = jsonDecode(res.body);
      if(data!['res']=='true'){
        profileController.onInit();
        VxToast.show(context, msg: 'Deposit Successfully',bgColor: greenColor,textColor: whiteColor);
      }
      else{
        VxToast.show(context, msg: 'Somthing Wrong',bgColor: redColor,textColor: whiteColor);
      }
    }
    else{
      VxToast.show(context,
          msg: 'Choose File First',
          bgColor: Colors.red,
          textColor: whiteColor);
    }
  }

  withdraw(context,walletAmount )async{

    int walletAmountvalue = int.parse(walletAmount);
    int withdrawAmountValue;
    if (withdrawAmountController.value.text.isEmpty) {
      withdrawAmountValue = 0; // Set to 0 if empty
    } else {
      withdrawAmountValue = int.parse(withdrawAmountController.value.text); // Parse the integer if not empty
    }


    withdrawAmountValue==0 ? withdrawAmountValidate.value=true : withdrawAmountValidate.value=false;
    if(withdrawAmountValue>0){
      if(walletAmountvalue>=withdrawAmountValue){

        String uri = '${url}action.php';
        var res = await http.post(Uri.parse(uri), body: {
          'user_id': userId.toString(),
          'withdraw_amount': withdrawAmountValue.toString(),
          'tds':tdsController.value.text.toString(),
          'withdraw': '',
        });
        data = jsonDecode(res.body);

        if(data!['res']=='true'){
            profileController.onInit();
          VxToast.show(context, msg: 'Withdraw Successfully',bgColor: greenColor,textColor: whiteColor);
        }
        else{
          VxToast.show(context, msg: 'Somthing Wrong',bgColor: redColor,textColor: whiteColor);
        }

      }
      else{
        VxToast.show(context, msg: 'Insufficient Balance',bgColor: redColor,textColor: whiteColor);
      }
    }
    else{
      VxToast.show(context, msg: 'Fill All Fileds',bgColor: redColor,textColor: whiteColor);
    }
  }

  tdsCheck(value){
    double tds = (double.parse(value))*0.05;
    double netamount = (double.parse(value))-tds;
    tdsController.value.text=tds.toString();
    netAmountController.value.text=netamount.toString();
  }

}
