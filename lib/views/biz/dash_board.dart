



import 'package:z2hhealthcare/controller/auth_controller.dart';

import '../../consts/consts.dart';

import '../../controller/profile_controller.dart';
import '../profile/profile_edit.dart';
import '../widgets.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  Widget build(BuildContext context) {

    var controller =Get.put(ProfileController());
    var authController =Get.put(AuthController());

    return Scaffold(
      drawer: drawerCardMember(context),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          appname,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imgBackground), fit: BoxFit.fill)),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: const Icon(
                    Icons.edit,
                    color: whiteColor,
                  ).onTap(() {

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileEdit()));
                  }),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(children: [
                  SizedBox(
                    width: 100,
                    child: controller.profile.value.toString() != '' ? Image.network(
                      '$imgUrl/profile_photo/${controller.profile.value.toString()}',
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make() :   Image.asset(
                      imgProfile2,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.nameController.value.text.toString(),
                            style:const TextStyle(
                                color: whiteColor, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            controller.userId.value.toString(),
                            style: TextStyle(color: whiteColor),
                          ),
                        ],
                      )),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: whiteColor,
                          )),
                      onPressed: () async{
                        authController.logout(context);
                      },
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                            color: whiteColor, fontFamily: semibold),
                      )),
                ]),

              ),
70.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "$currency. ${controller.totalIncome.value}",
                            style: const TextStyle(
                              fontFamily: bold, color:primaryColor, fontSize: 16,fontWeight: FontWeight.bold,),
                          ),
                          const Icon(Icons.attach_money,color: secondColor,)
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Total Income",
                        style:  TextStyle(color: primaryColor),
                      ),
                    ],
                  )
                      .box
                      .white
                      .roundedSM
                      .height(80)
                      .width( context.screenWidth / 3)
                      .padding(const EdgeInsets.all(4)).shadow
                      .make().onTap((){

                  }),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "$currency. ${controller.wallet.value}",
                            style: const TextStyle(
                              fontFamily: bold, color:primaryColor, fontSize: 16,fontWeight: FontWeight.bold,),
                          ),
                          const Icon(Icons.wallet,color: secondColor,)
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Wallet",
                        style:  TextStyle(color: primaryColor),
                      ),
                    ],
                  )
                      .box
                      .white
                      .roundedSM
                      .height(80)
                      .width( context.screenWidth / 3)
                      .padding(const EdgeInsets.all(4)).shadow
                      .make().onTap((){

                  }),


                ],
              ),

              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "$currency. ${controller.levelIncome.value}",
                            style: const TextStyle(
                              fontFamily: bold, color:primaryColor, fontSize: 16,fontWeight: FontWeight.bold,),
                          ),
                          const  Icon(Icons.trending_neutral,color: secondColor,)
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Level Income",
                        style:  TextStyle(color: primaryColor),
                      ),
                    ],
                  )
                      .box
                      .white
                      .roundedSM
                      .height(80)
                      .width( context.screenWidth / 3)
                      .padding(const EdgeInsets.all(4)).shadow
                      .make().onTap((){

                  }),


                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            controller.refCount.value.toString(),
                            style: const TextStyle(
                              fontFamily: bold, color:primaryColor, fontSize: 16,fontWeight: FontWeight.bold,),
                          ),
                          const  Icon(Icons.people,color: secondColor,)
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Referral Team",
                        style:  TextStyle(color: primaryColor),
                      ),
                    ],
                  )
                      .box
                      .white
                      .roundedSM
                      .height(80)
                      .width( context.screenWidth / 3)
                      .padding(const EdgeInsets.all(4)).shadow
                      .make().onTap((){

                  }),


                ],
              ),



              10.heightBox,


            ],
          ),
        ),
      ),
    );


  }
}

