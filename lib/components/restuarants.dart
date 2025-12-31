import 'package:flutter/material.dart';

class RestuarantTile extends StatelessWidget {
  final String restuarantname;
  final String itemname;
  final String itemnewprice;
  final String itemoldprice;
  final String location;
  final String timeperiod;
  final String imagepath;

  const RestuarantTile({
    super.key,
    required this.restuarantname,
    required this.itemname,
    required this.itemnewprice,
    required this.itemoldprice,
    required this.location,
    required this.timeperiod,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(12),
          color: Colors.yellow,
          child: Container(
            width: 260,
            padding: EdgeInsets.all(7),

            decoration: BoxDecoration(
              color: Color(0xFFFAFAFA),
              borderRadius: BorderRadius.circular(12),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IMAGE
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    imagepath,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12),
                    Text(
                      restuarantname,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),

                    Text(location),
                    Text('Collect today $timeperiod'),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12),
      ],
    );
    ;
  }
}
