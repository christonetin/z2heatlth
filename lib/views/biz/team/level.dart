
import '../../../consts/consts.dart';

import '../../../controller/team_controller.dart';
import '../../widgets.dart';

class Level extends StatelessWidget {
  const Level({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TeamController());
    controller.levelTable();
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
            Row(
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
                const Text('Level', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)

              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(),
                  children: [

                    const  TableRow(
                      children: [
                        TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text('Level', style: TextStyle(fontWeight: FontWeight.bold)))),
                        TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text('Team', style: TextStyle(fontWeight: FontWeight.bold)))),
                        TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text('Level Income', style: TextStyle(fontWeight: FontWeight.bold)))),
                      ],
                    ),

                    TableRow(
                      children: [
                        const TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text("1"))),
                        TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_1.value))),
                        TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_1income.value))),


                      ],
                    ),

                    TableRow(
                      children: [
                        const TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text("2"))),
                        TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_2.value))),
                        TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_2income.value))),


                      ],
                    ),

                    TableRow(
                      children: [
                        const TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text("3"))),
                        TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_3.value))),
                        TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_3income.value))),


                      ],
                    ),

                    TableRow(
                      children: [
                        const TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text("4"))),
                        TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_4.value))),
                        TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_4income.value))),


                      ],
                    ),

                    TableRow(
                      children: [
                        const TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text("5"))),
                        TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_5.value))),
                        TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_5income.value))),


                      ],
                    ),

                    // TableRow(
                    //   children: [
                    //     const TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text("6"))),
                    //     TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_6.value))),
                    //     TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_6income.value))),
                    //     TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_6income1.value))),
                    //
                    //   ],
                    // ),
                    //
                    // TableRow(
                    //   children: [
                    //     const TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text("7"))),
                    //     TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_7.value))),
                    //     TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_7income.value))),
                    //     TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_7income1.value))),
                    //
                    //   ],
                    // ),
                    //
                    // TableRow(
                    //   children: [
                    //     const TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text("8"))),
                    //     TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_8.value))),
                    //     TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_8income.value))),
                    //     TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_8income1.value))),
                    //
                    //   ],
                    // ),
                    //
                    // TableRow(
                    //   children: [
                    //     const TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text("9"))),
                    //     TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_9.value))),
                    //     TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_9income.value))),
                    //     TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_9income1.value))),
                    //
                    //   ],
                    // ),
                    //
                    // TableRow(
                    //   children: [
                    //     const TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text("10"))),
                    //     TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_10.value))),
                    //     TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_10income.value))),
                    //     TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text(controller.level_10income1.value))),
                    //
                    //   ],
                    // ),


                  ],
                ),
              ),
            ),

          ],
        ),
        ),
      ),
    );
  }
}


