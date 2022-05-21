import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trucks/add_truck/add_truck.dart';
import 'package:trucks/data/Provider/user.dart';
import 'package:trucks/utils/Wigets/custom_cards.dart';
import 'package:trucks/utils/constant.dart';
import 'package:video_player/video_player.dart';

import '../data/Provider/trucks.dart';
import 'inner_screens/active_screen.dart';
import 'inner_screens/expired_screen.dart';

class UserDashbaord extends StatefulWidget {
  UserDashbaord({Key? key}) : super(key: key);

  @override
  _UserDashbaordState createState() => _UserDashbaordState();
}

class _UserDashbaordState extends State<UserDashbaord> {
  int index = 0;
  // List<Widget> _pages = [
  //   ActiveScreen(),
  //   ExpiredScreen(),
  // ];




  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userInstance = Provider.of<Users>(context);
    final truckInstance = Provider.of<Trucks>(context);
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
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
            Icon(Icons.search_outlined,
                color: Constant.lighblue_color, size: 40),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome ${userInstance.user.fname},',
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Constant.blue_color,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Manage your trucks ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Constant.deep_blue),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.7,
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
                            children: [
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                "Total trucks",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                truckInstance.total_trucks.toString(),
                                style: const TextStyle(
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
                      width: MediaQuery.of(context).size.width / 3.7,
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
                                  fontSize: 12,
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
                      width: MediaQuery.of(context).size.width / 3.7,
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
                                  fontSize: 12,
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
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, bottom: 8.0, right: 20),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Constant.lighblue_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      onPressed: () {
                        //navigate to add truck screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddTruck(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Add New Truck",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
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

                //tab bar

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    height: 30,
                    child: TabBar(
                      isScrollable: true,
                      indicator: BoxDecoration(
                        color: Constant.lighblue_color,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      unselectedLabelColor: Constant.grey_color,
                      labelPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      tabs: [
                        Tab(
                          child: Container(
                            alignment: Alignment.center,
                            height: 18.0,
                            child: Text(
                              "Active",
                              style: TextStyle(
                                  color: index == 0
                                      ? Constant.blue_color
                                      : Constant.grey_color,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            alignment: Alignment.center,
                            height: 18.0,
                            child: Text(
                              "Expired",
                              style: TextStyle(
                                  color: index == 1
                                      ? Constant.blue_color
                                      : Constant.grey_color,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //tabs views
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: TabBarView(
                    children: [
                      //active
                      FutureBuilder(
                          future: Provider.of<Trucks>(context, listen: false)
                              .getTrucksPerUser(
                                  userId: userInstance.user.userId),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: Transform.scale(
                                    scale: 0.5,
                                    child: const CircularProgressIndicator()),
                              );
                            } else {
                              if (snapshot.error != null) {
                                return const Center(
                                  child: Text("sorry an error occured"),
                                );
                              } else {
                                return Consumer<Trucks>(
                                  builder: (context, truckInstance, _) {
                                    if (truckInstance.active.isEmpty) {
                                      return const Text("No Active Trucks");
                                    } else {
                                      return ListView.builder(
                                        itemCount: truckInstance.active.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              // Navigator.pushReplacement(context,
                                              //     MaterialPageRoute(
                                              //         builder: ((context) {
                                              //   return ScreenThree(
                                              //       index: index);
                                              // })));
                                            },
                                            child: CardTemplate(
                                              by: userInstance.user.fname,
                                              image: truckInstance.active[index]
                                                      .truckImages[0]
                                                  ['truckImageUrl'],
                                              desc:
                                                  "${truckInstance.active[index].truckModelName} \navailable for sale in ikeja",
                                              price: "N 12,000.00 /day",
                                              location: "Lagos",
                                              timeLeft: "22 hours left",
                                              times: "2x",
                                              truckName: truckInstance
                                                  .active[index].truckTypeName,
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                );
                              }
                            }
                          }),

                      //Expired
                      FutureBuilder(
                          future: Provider.of<Trucks>(context, listen: false)
                              .getTrucksPerUser(
                                  userId: userInstance.user.userId),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: Transform.scale(
                                    scale: 0.5,
                                    child: const CircularProgressIndicator()),
                              );
                            } else {
                              if (snapshot.error != null) {
                                return const Center(
                                  child: Text("sorry an error occured"),
                                );
                              } else {
                                return Consumer<Trucks>(
                                  builder: (context, truckInstance, _) {
                                    if (truckInstance.expired.isEmpty) {
                                      return const Text("No Expired Trucks");
                                    } else {
                                      return ListView.builder(
                                        itemCount: truckInstance.active.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              // Navigator.pushReplacement(context,
                                              //     MaterialPageRoute(
                                              //         builder: ((context) {
                                              //   return ScreenThree(
                                              //       index: index);
                                              // })));
                                            },
                                            child: CardTemplate(
                                              by: userInstance.user.fname,
                                              image: truckInstance
                                                  .expired[index]
                                                  .truckImages[0],
                                              desc:
                                                  "${truckInstance.expired[index].truckModelName} \navailable for sale in ikeja",
                                              price: "N 12,000.00 /day",
                                              location: "Lagos",
                                              timeLeft: "22 hours left",
                                              times: "2x",
                                              truckName: truckInstance
                                                  .expired[index].truckTypeName,
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                );
                              }
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
