import 'package:intl/intl.dart';
import '../../../consts/consts.dart';

import '../../../controller/team_controller.dart';
import '../../widgets.dart';


class ReferralTeam extends StatelessWidget {
  const ReferralTeam({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TeamController());
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
                  const Text('Referral Team', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)

                ],
              ),
            ),
            Expanded(
                child:  FutureBuilder<List<Map<String, dynamic>>>(
                  future:controller.referralTeam(),
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
                              leading: Text(data['user_id']),
                              title: Text(data['name']),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data['mobile']),
                                  Text(DateFormat('d-MM-yyyy').format(DateTime.parse(data['join_date'].toString()))),

                                ],
                              ), // assume 'subtitle' is a key in the data map
                              trailing: data['status']==1?Text('Active',style: TextStyle(color: Vx.green600)):Text('InActive',style: TextStyle(color: Vx.red600),), // assume 'trailing' is a key in the dRata map
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


