import 'package:flutter/material.dart';
import 'package:trucks/utils/constant.dart';
import 'package:video_player/video_player.dart';

class CardTemplate extends StatefulWidget {
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
  State<CardTemplate> createState() => _CardTemplateState();
}

class _CardTemplateState extends State<CardTemplate> {
  late VideoPlayerController _controller;

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
                  child: Icon(
                    Icons.play_arrow_outlined,
                    size: 50,
                  )),

              // trck description
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.truckName,
                        style: const TextStyle(
                            color: Constant.blue_color,
                            fontWeight: FontWeight.w800,
                            fontSize: 14)),
                    Text(widget.by,
                        style: const TextStyle(
                            color: Constant.grey_color,
                            fontWeight: FontWeight.w800,
                            fontSize: 12)),
                    const SizedBox(height: 8),
                    Text(widget.desc,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 12)),
                    const SizedBox(height: 8),
                    Text(widget.price,
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
                  child: Text(widget.timeLeft,
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
                      Text(widget.times,
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
                  child: Text(widget.location,
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
