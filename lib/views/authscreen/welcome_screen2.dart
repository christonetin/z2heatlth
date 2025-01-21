


import '../../consts/consts.dart';
import '../biz/dash_board.dart';

class WelcomeScreen2 extends StatelessWidget {
  final String userId,password,name,sponsorId,joinDate;
  const WelcomeScreen2({super.key,required this.userId,required this.password,required this.name,required this.sponsorId,required this.joinDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(children: [
          50.heightBox,
          "Welcome to $appname".text.fontFamily(bold).black.size(20).make(),
          50.heightBox,
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "User ID : ".text.black.bold.size(18).make(),
                  userId.text.black.color(primaryColor).size(18).make(),
                ],),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Password : ".text.black.bold.size(18).make(),
                  password.text.black.color(primaryColor).size(18).make(),
                ],),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Name : ".text.black.bold.size(18).make(),
                  name.text.black.color(primaryColor).size(18).make(),
                ],),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Sponsor ID : ".text.black.bold.size(18).make(),
                  sponsorId.text.black.color(primaryColor).size(18).make(),
                ],),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Join Date : ".text.black.bold.size(18).make(),
                  joinDate.text.black.color(primaryColor).size(18).make(),
                ],),
              10.heightBox,
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Dashboard()));
              }, child: Text('Goto Home Page'))
            ],
          ).box
              .white
              .rounded
              .padding(const EdgeInsets.all(16))
              .width(context.screenWidth - 70)
              .shadowSm
              .make(),
        ],),
      ),
    );
  }
}