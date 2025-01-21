import 'consts/consts.dart';

import 'views/authscreen/splash_screen.dart';void main() async {
//Get.put(AuthController());
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          iconTheme: const IconThemeData(
            color: darkFontGrey,
          ),
          fontFamily: regular),
      home: const SplashScreen(),
    );
  }
}
