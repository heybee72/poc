import 'package:flutter/material.dart';
import 'package:trucks/utils/constant.dart';

class CardTemplate extends StatelessWidget {
  String image;
  String truckName;
  String by;
  String desc;
  String price;
  String timeLeft;
  String location;
  String times;
  CardTemplate({
    required this.image,
    required this.truckName,
    required this.by,
    required this.desc,
    required this.price,
    required this.timeLeft,
    required this.location,
    required this.times,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Constant.pink_color.withOpacity(.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: Column(children: [
          //first Row
          Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Image.asset(image)),

              // trck description
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(truckName,
                        style: const TextStyle(
                            color: Constant.blue_color,
                            fontWeight: FontWeight.w800,
                            fontSize: 14)),
                    Text(by,
                        style: const TextStyle(
                            color: Constant.grey_color,
                            fontWeight: FontWeight.w800,
                            fontSize: 12)),
                    const SizedBox(height: 8),
                    Text(desc,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 12)),
                    const SizedBox(height: 8),
                    Text(price,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ],
                ),
              )
            ],
          ),
          //
          const SizedBox(
            height: 10,
          ),

          //second Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.04,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Constant.grey_color,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(timeLeft,
                      style: const TextStyle(
                          color: Constant.blue_color,
                          fontWeight: FontWeight.w800,
                          fontSize: 10)),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Constant.grey_color,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.receipt, size: 12),
                      Icon(Icons.circle_notifications, size: 12),
                      Text(times,
                          style: const TextStyle(
                              color: Constant.blue_color,
                              fontWeight: FontWeight.w800,
                              fontSize: 10)),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.04,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Constant.grey_color,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(location,
                      style: const TextStyle(
                          color: Constant.blue_color,
                          fontWeight: FontWeight.w800,
                          fontSize: 8)),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
