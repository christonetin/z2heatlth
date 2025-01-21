import 'dart:io';
import 'package:flutter/services.dart';

import '../../../consts/consts.dart';
import '../../../controller/profile_controller.dart';
import '../widgets.dart';


class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
   var controller = Get.put(ProfileController());
     return Scaffold(
      appBar:  appBarBack(),
       body: Container(
        decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imgBackground), fit: BoxFit.fill)),
        child: Scaffold(
            appBar: AppBar(),
            body:  SingleChildScrollView(
                child: Obx(()=> Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                          Stack(
         children: [ 
           SizedBox(
        width: 100,
        child: GestureDetector(
          onTap: () {
            controller.changeImage(context);
          },
          child: controller.profileImgPath.value.isEmpty &&  controller.profile.value.toString() == ''
            ? Image.asset(
                imgProfile2,
                width: 100,
                fit: BoxFit.cover,
              ).box.roundedFull.clip(Clip.antiAlias).make()
            : controller.profile.value.toString() != '' && controller.profileImgPath.value.isEmpty ?Image.network(
                                  '$imgUrl/profile_photo/${controller.profile.value.toString()}',
                                  width: 100,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make(): Image.file(
                File(controller.profileImgPath.value),
                width: 100,
                fit: BoxFit.cover,
              ).box.roundedFull.clip(Clip.antiAlias).make(),
        ),
           ),
           Positioned(
        top: 0,
        right: 0,
        child: IconButton(
          icon:const Icon(Icons.edit, size: 20, color: primaryColor),
          onPressed: () {
            
          }, // add your onPressed function here
        ),
           ),
         ],
       ),
                     10.heightBox,
                     controller.isLoading.value?loadingIndicator(): ourButton(
                          color: primaryColor,
                          onPress: () async{
                           
                          await controller.uploadProfileImage(context);
                          
                          },
                          textColor: whiteColor,  
                          title: 'Change'),
                    
                       30.heightBox,
                       "Update Profile".text.color(primaryColor).size(20).bold.make(),
                     20.heightBox,
                  
                       
        
                         TextField(
                           controller: controller.nameController.value,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Your Name',
                        labelText: 'Name',
                       labelStyle:const TextStyle(color:Vx.black), 
                     errorText: controller.nameValidate.value
                                  ? 'Value can\'t Be Empty'
                                  : null,
                      ),
                    ),
                     20.heightBox,
                       Obx(
                () => TextField(
                  controller: controller.mailController.value,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Your mail id',
                    labelText: 'Mail id',
                    labelStyle: const TextStyle(color: Colors.black),
                    errorText: controller.mailValidate.value ? 'Value can\'t be empty or invalid' : null,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]')),
                  ],
                  onChanged: controller.validateEmail,
                ),
              ),
              20.heightBox,
                 TextField(
                  readOnly: true,
                           controller: controller.mobileController.value,
                      decoration:const InputDecoration(
                        border:  OutlineInputBorder(),
                        hintText: 'Mobile Number',
                        labelText: 'Mobile',
                       labelStyle: TextStyle(color:Vx.black), 
                   
                      ),
                    ),
                     20.heightBox,
                       
                       25.heightBox,
                        controller.isLoading.value?loadingIndicator() :  ourButton(
                                color: primaryColor,
                                onPress: () async {
                                  controller.isLoading.value=true;
                               await controller.updateProfile(context);
                                   controller.isLoading.value=false;
                                },
                                textColor: whiteColor,
                                title: 'Update').box.width(context.screenWidth - 50).make(),
                      ],
                    )
                        .box
                        .white
                        .shadowSm
                        .rounded
                        .padding(const EdgeInsets.all(16))
                        .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
                        .make(),
                ),
                ),
              ),
         
           ),
     );
  }
}