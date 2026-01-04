import 'package:flutter/material.dart';
import 'package:motainai/components/product_model.dart';
import 'package:motainai/components/restuarants.dart';

import 'package:provider/provider.dart';
import 'package:motainai/components/restuarantmodel.dart';
import 'package:motainai/components/product_tile.dart';

class Hometab extends StatefulWidget {
  const Hometab({super.key});

  @override
  State<Hometab> createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  int _selectedIndex = 0;

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 200,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  children: [
                    Image.asset('assets/offers/happy_weekend.png'),
                    Image.asset('assets/offers/localstores.png'),
                    Image.asset('assets/offers/maxvalue.png'),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 240,
                child: Consumer<Restuarantmodel>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      padding: EdgeInsets.only(bottom: 4),
                      itemCount: value.restaurantinfo.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return RestuarantTile(
                          restuarantname: value.restaurantinfo[index][0],
                          itemname: value.restaurantinfo[index][1],
                          itemnewprice: value.restaurantinfo[index][2],
                          itemoldprice: value.restaurantinfo[index][3],
                          location: value.restaurantinfo[index][4],
                          timeperiod: value.restaurantinfo[index][5],
                          imagepath: value.restaurantinfo[index][6],
                          productimage: '',
                          containerheight: 260,
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Top Deals Today',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
              ),
              Consumer<ProductModel>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.restaurantinfo.length,
                    shrinkWrap: true, // <-- takes only needed height
                    physics:
                        const NeverScrollableScrollPhysics(), // <-- parent scrolls
                    itemBuilder: (context, index) {
                      return ProductTile(
                        restuarantname: value.restaurantinfo[index][0],
                        itemname: value.restaurantinfo[index][1],
                        itemnewprice: value.restaurantinfo[index][2],
                        itemoldprice: value.restaurantinfo[index][3],
                        location: value.restaurantinfo[index][4],
                        timeperiod: value.restaurantinfo[index][5],
                        imagepath: value.restaurantinfo[index][6],
                        productimage: value.restaurantinfo[index][7],
                        onPressed: () {
                          Provider.of<ProductModel>(
                            context,
                            listen: false,
                          ).addItemtoCart(index);
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
