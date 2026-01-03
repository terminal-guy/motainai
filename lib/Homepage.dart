import 'package:flutter/material.dart';
import 'package:motainai/components/product_model.dart';
import 'package:motainai/components/restuarants.dart';
import 'package:provider/provider.dart';
import 'package:motainai/components/restuarantmodel.dart';
import 'package:motainai/components/product_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart, color: Colors.green),
            label: Text("Cart", style: TextStyle(color: Colors.green)),
          ),
        ],

        title: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Row(
            children: const [
              Text(
                "MOTAINAI",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),

      body: _selectedIndex == 0
          ? ListView(
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
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            )
          : _selectedIndex == 1
          ? const Center(child: Text('Search page'))
          : const Center(child: Text('Profile page')),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          surfaceTintColor: Colors.transparent,
          height: 70,
          elevation: 8,
          indicatorColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(
                size: 24,
                color: Color.fromARGB(255, 67, 160, 71),
              );
            }
            return const IconThemeData(size: 24, color: Colors.grey);
          }),

          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0E5A5A),
              );
            }
            return const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            );
          }),
        ),
        child: NavigationBar(
          backgroundColor: Colors.white,
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(Icons.search),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
