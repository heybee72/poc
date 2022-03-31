import 'package:flutter/material.dart';
import 'package:trucks/utils/constant.dart';

import 'inner_screens/active_screen.dart';
import 'inner_screens/expired_screen.dart';

class UserDashbaord extends StatefulWidget {
  UserDashbaord({Key? key}) : super(key: key);

  @override
  _UserDashbaordState createState() => _UserDashbaordState();
}

class _UserDashbaordState extends State<UserDashbaord> {
  int index = 0;
  List<Widget> _pages = [
    const ActiveScreen(),
    const ExpiredScreen(),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Icon(
            Icons.menu,
            color: Constant.blue_color,
            size: 40,
          ),
        ),
        actions: const [
          Icon(Icons.search_outlined, color: Constant.lighblue_color, size: 40),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.notifications_outlined,
              color: Constant.blue_color, size: 40),
          SizedBox(
            width: 35,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            // decoration: BoxDecoration(
            //   color: Constant.lightgrey_color,
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Ayoo,',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Constant.blue_color,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 8,
                ),
                const Text(
                  "Manage your trucks ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Constant.deep_blue),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3.58,
                        height: 102,
                        child: Card(
                          color: Constant.deep_blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Total trucks",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "14",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 38,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.58,
                        height: 102,
                        child: Card(
                          color: Constant.light_blue2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Comments",
                                  style: TextStyle(
                                    color: Constant.blue_color,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "14",
                                  style: TextStyle(
                                    color: Constant.blue_color,
                                    fontSize: 38,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                     
                      Container(
                        width: MediaQuery.of(context).size.width / 3.58,
                        height: 102,
                        child: Card(
                          color: Constant.lightgrey_color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Messages",
                                  style: TextStyle(
                                    color: Constant.blue_color,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "14",
                                  style: TextStyle(
                                    color: Constant.blue_color,
                                    fontSize: 38,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, bottom: 20.0, right: 20),
                  child: SizedBox(
                    height: 57,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Constant.lighblue_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Add New Truck",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.04,
                          ),
                          const Icon(Icons.add),
                        ],
                      ),
                    ),
                  ),
                ),

                //
                // DefaultTabController(
                //   length: 2,
                //   initialIndex: 0,
                //   child: TabBar(
                //     tabs: [
                //       Tab(
                //         child: Container(
                //           margin: const EdgeInsets.only(top: 25),
                //           alignment: Alignment.center,
                //           color: Colors.white24,
                //           height: 82.0,
                //           child: Text(
                //             "Active",
                //             style: TextStyle(
                //                 color: index == 0
                //                     ? Constant.blue_color
                //                     : Constant.grey_color,
                //                 fontSize: 17.0,
                //                 fontWeight: FontWeight.bold),
                //           ),
                //         ),
                //       ),
                //       Tab(
                //         child: Container(
                //           margin: const EdgeInsets.only(top: 25),
                //           alignment: Alignment.center,
                //           color: Colors.white24,
                //           height: 82.0,
                //           child: Text(
                //             "Expired",
                //             style: TextStyle(
                //                 color: index == 1
                //                     ? Constant.blue_color
                //                     : Constant.grey_color,
                //                 fontSize: 17.0,
                //                 fontWeight: FontWeight.bold),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // TabBarView(
                //   children: _pages,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
