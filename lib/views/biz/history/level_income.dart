import 'package:intl/intl.dart';
import '../../../consts/consts.dart';
import '../../../controller/history_controller.dart';
import '../../widgets.dart';


class LevelIncome extends StatelessWidget {
  const LevelIncome({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HistoryController());
    return Scaffold(
      backgroundColor: whiteColor,
      drawer: drawerCardMember(context),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          appname,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Obx(()=> Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const Text('Level Income', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)

                ],
              ),
            ),
            Expanded(
                child:  FutureBuilder<List<Map<String, dynamic>>>(
                  future:controller.levelIncome(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Map<String, dynamic>> dataList = snapshot.data!;
                      return ListView.builder(
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> data = dataList[index];
                          return Container(
                            margin:const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color.fromARGB(255, 160, 206, 245),
                            ),
                            child: ListTile(
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text(DateFormat('d-MM-yyyy').format(DateTime.parse(data['trans_date'].toString()))),
                                  Text(DateFormat('HH:mm').format(DateTime.parse(data['trans_date'].toString()))),

                                ],
                              ),

                              subtitle: Text(data['comment']), // assume 'subtitle' is a key in the data map
                              trailing: Text(data['credit'],style: TextStyle(color: greenColor,fontSize: 15),), // assume 'trailing' is a key in the dRata map
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Center(child: loadingIndicator());
                    }
                  },
                )


            ),

          ],
        ),
        ),
      ),
    );
  }
}


