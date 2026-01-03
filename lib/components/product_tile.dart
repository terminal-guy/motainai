import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final String restuarantname;
  final String itemname;
  final String itemnewprice;
  final String itemoldprice;
  final String location;
  final String timeperiod;
  final String imagepath;
  final String productimage;

  const ProductTile({
    super.key,
    required this.restuarantname,
    required this.itemname,
    required this.itemnewprice,
    required this.itemoldprice,
    required this.location,
    required this.timeperiod,
    required this.imagepath,
    required this.productimage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // IMAGE
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(productimage, height: 120, width: 120),
                ),
                const SizedBox(width: 12),

                // TEXT + BUTTON AREA
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              itemname,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          MaterialButton(
                            color: Colors.green,
                            minWidth: 42,
                            height: 36,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              '+',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(restuarantname),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            '¥ $itemoldprice ',
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text(
                            '¥ $itemnewprice',
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
