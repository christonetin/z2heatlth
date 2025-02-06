import '../../../consts/consts.dart';
import '../../../controller/profile_controller.dart';
import '../widgets.dart';


class UpdateAccount extends StatelessWidget {
  const UpdateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
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
              "Account Update".text.color(primaryColor).size(20).bold.make(),
              20.heightBox,
              TextField(
                controller: controller.accNoController.value,

                decoration:const InputDecoration(
                  border:  OutlineInputBorder(),

                  labelText: 'Account number',
                  labelStyle: TextStyle(color:Vx.black),

                ),
              ),
              20.heightBox,
              TextField(
                controller: controller.accNameController.value,

                decoration:const InputDecoration(
                  border:  OutlineInputBorder(),

                  labelText: 'Account holder Name ',
                  labelStyle: TextStyle(color:Vx.black),

                ),
              ),
              20.heightBox,
              TextField(
                controller: controller.ifscController.value,

                decoration:const InputDecoration(
                  border:  OutlineInputBorder(),

                  labelText: 'IFSC Code',
                  labelStyle: TextStyle(color:Vx.black),

                ),
              ),
              20.heightBox,

              TextField(
                controller: controller.bankNameController.value,
                decoration:const InputDecoration(
                  border:  OutlineInputBorder(),
                  labelText: 'Bank Name',

                  labelStyle: TextStyle(color:Vx.black),

                ),
              ),
              20.heightBox,
              TextField(
                controller: controller.branchController.value,
                decoration:const InputDecoration(
                  border:  OutlineInputBorder(),
                  labelText: 'Branch',

                  labelStyle: TextStyle(color:Vx.black),

                ),
              ),
              20.heightBox,
              TextField(
                controller: controller.gpayController.value,
                decoration:const InputDecoration(
                  border:  OutlineInputBorder(),
                  labelText: 'Google Pay',

                  labelStyle: TextStyle(color:Vx.black),

                ),
              ),
              20.heightBox,
              TextField(
                controller: controller.phonePeController.value,
                decoration:const InputDecoration(
                  border:  OutlineInputBorder(),
                  labelText: 'Phone Pe',

                  labelStyle: TextStyle(color:Vx.black),

                ),
              ),
              20.heightBox,
              TextField(
                controller: controller.upiIdController.value,
                decoration:const InputDecoration(
                  border:  OutlineInputBorder(),
                  labelText: 'UPI Id',

                  labelStyle: TextStyle(color:Vx.black),

                ),
              ),
              25.heightBox,
              controller.isLoading.value?loadingIndicator() :  ourButton(
                  color: primaryColor,
                  onPress: () async {
                    controller.isLoading.value=true;
                    await controller.bankUpdate(context);
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

    );
  }
}