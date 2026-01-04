import 'package:flutter/material.dart';

class IntroScreenWidget extends StatelessWidget {
  final String imagepath;
  final String heading;
  final String subtitle;
  final double height;
  final double distancebet;

  IntroScreenWidget({
    super.key,
    required this.heading,
    required this.subtitle,
    required this.imagepath,
    required this.height,
    required this.distancebet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Image.asset(imagepath),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: distancebet),
            child: Text(
              heading,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
