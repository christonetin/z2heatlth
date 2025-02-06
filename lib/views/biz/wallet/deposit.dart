
import 'dart:io';



import '../../../controller/wallet_controller.dart';


import '../../../consts/consts.dart';
import '../../widgets.dart';



class Deposit extends StatelessWidget {
  const Deposit({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(WalletController());
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

              "Update Proof".text.color(primaryColor).size(20).bold.make(),
              20.heightBox,
              TextField(
                controller: controller.referranceController.value,

                decoration: const InputDecoration(
                  border:  OutlineInputBorder(),
                  hintText: 'Enter Transaction or Referrance ID',
                  labelText: 'Transaction / Ref ID',
                  labelStyle: TextStyle(color:Vx.black),
                ),
              ),

              20.heightBox,
              TextField(
                controller: controller.amountController.value,

                decoration: const InputDecoration(
                  border:  OutlineInputBorder(),
                  hintText: 'Enter Deposit Amount',
                  labelText: 'Amount',
                  labelStyle: TextStyle(color:Vx.black),
                ),
                onChanged: (value){
                  controller.tdsCheck(value);
                },
              ),
              20.heightBox,
              SizedBox(
                width: 150,
                height: 150,
                child: GestureDetector(
                  onTap: () {
                    controller.changeImage(context);
                  },
                  child: Container(

                    decoration: BoxDecoration(
                      border: Border.all(color:primaryColor, width: 2), // Set border color and width
                      borderRadius: BorderRadius.circular(8), // Optional: add rounded corners
                    ),
                    child: controller.depositProofpath.value.isEmpty
                        ? Center(child: "Choose Image".text.center.make(),)
                        : Image.file(
                      File(controller.depositProofpath.value),
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.make(),
                  ) ,
                ),
              ),
              5.heightBox,
              Icon(Icons.delete,color: redColor).onTap((){
                controller.depositProofpath.value='';
              }),

              25.heightBox,
              controller.isLoading.value?loadingIndicator() :  ourButton(
                  color: primaryColor,
                  onPress: () async {
                    controller.isLoading.value=true;
                    await controller.deposit(context);
                    controller.isLoading.value=false;
                  },
                  textColor: whiteColor,
                  title: 'Deposit').box.width(context.screenWidth - 50).make(),
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