import '../../consts/consts.dart';
import '../../controller/biz_controller.dart';
import '../widgets.dart';

class ApplyBusiness extends StatelessWidget {
  const ApplyBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BizController());

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: appBarBack(),


      body:  SingleChildScrollView(
        child:   Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Business Apply"
                  .text
                  .size(20)
                  .bold
                  .color(primaryColor)
                  .fontFamily(semibold)
                  .make(),
              20.heightBox,

              Center(
                child: Column(
                  children: [
                    "Are you want Business With Us".text.size(20).make(),
                    ElevatedButton(onPressed: (){
                      controller.applyBiz(context);
                    }, child:const Text('Apply Here')),
                  ],
                ),
              ).box.white.shadow.padding(EdgeInsets.all(8.2)).make(),



            ],
          ),
        ),
      ),


    );
  }
}
