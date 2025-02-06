


import '../../../controller/team_controller.dart';

import '../../../consts/consts.dart';
import '../../widgets.dart';




class ReferralLink extends StatelessWidget {
  const ReferralLink({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(TeamController());
    controller.loadDatasController(context);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imgBackground), fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(),
        body:  SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              30.heightBox,
              "Refer and Earn".text.color(primaryColor).size(20).bold.make(),
              20.heightBox,
              Obx(()=> TextField(
                controller: controller.referLinkController.value,
                readOnly: true,
                decoration: const InputDecoration(
                  border:  OutlineInputBorder(),
                  labelText: 'Referral Link',
                  labelStyle: TextStyle(color:Vx.black),
                ),
              ),
              ),



              25.heightBox,
              ourButton(
                  color: primaryColor,
                  onPress: () async {
                    await controller.copyToClipboard(context);
                  },
                  textColor: whiteColor,
                  title: 'Copy Link').box.width(context.screenWidth - 50).make(),
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


    );
  }
}