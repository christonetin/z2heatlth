


import '../../../consts/consts.dart';
import '../../../controller/profile_controller.dart';
import '../../../controller/wallet_controller.dart';
import '../../widgets.dart';


class Withdraw extends StatelessWidget {
  const Withdraw({super.key});

  @override
  Widget build(BuildContext context) {
    var profileController = Get.put(ProfileController());
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
              "Withdraw".text.color(primaryColor).size(20).bold.make(),
              20.heightBox,
              TextField(
                controller: profileController.walletController.value,
                readOnly: true,
                decoration: const InputDecoration(
                  border:  OutlineInputBorder(),
                  hintText: 'Your Wallet  Balance',
                  labelText: 'Wallet',
                  labelStyle: TextStyle(color:Vx.black),
                ),
              ),

              20.heightBox,
              TextField(
                controller: controller.withdrawAmountController.value,

                decoration:  InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Withdraw Amount',
                  labelText: 'Withdraw Amount',
                  labelStyle:const TextStyle(color:Vx.black),
                  errorText: controller.withdrawAmountValidate.value
                      ? 'Value can\'t Be Empty'
                      : null,
                ),

                onChanged: (value){
                  controller.tdsCheck(value);
                },
              ),
              20.heightBox,
              TextField(
                controller: controller.tdsController.value,
                readOnly: true,
                decoration: const InputDecoration(
                  border:  OutlineInputBorder(),
                  hintText: 'Deduction Amount',
                  labelText: 'Deduction',
                  labelStyle: TextStyle(color:Vx.black),
                ),

              ),
              20.heightBox,
              TextField(
                controller: controller.netAmountController.value,
                readOnly: true,
                decoration: const InputDecoration(
                  border:  OutlineInputBorder(),
                  hintText: 'Net Amount',
                  labelText: 'Net Amount',
                  labelStyle: TextStyle(color:Vx.black),
                ),
              ),



              25.heightBox,
              controller.isLoading.value?loadingIndicator() :  ourButton(
                  color: primaryColor,
                  onPress: () async {

                    await controller.withdraw(context, profileController.walletController.value.text);
                  },
                  textColor: whiteColor,
                  title: 'Withdraw').box.width(context.screenWidth - 50).make(),
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