import 'package:flutter/material.dart';
import 'package:motainai/cartpage.dart';
import 'package:motainai/components/product_model.dart';
import 'package:motainai/components/restuarants.dart';
import 'package:motainai/hometab.dart';
import 'package:motainai/impact_page.dart';
import 'package:motainai/profilepage.dart';
import 'package:motainai/searchpage.dart';
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

  final List<Widget> _pages = const [
    Hometab(),
    SearchPage(),
    ImpactPage(),
    ProfilePage(),
  ];

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      appBar: _selectedIndex == 2
          ? null
          : AppBar(
              surfaceTintColor: Colors.transparent,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              scrolledUnderElevation: 0,
              actions: [
                TextButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CartPage();
                      },
                    ),
                  ),
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

      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 12, left: 12, top: 0, bottom: 18),
        child: Material(
          color: Colors.white,
          elevation: 8,
          borderRadius: BorderRadius.circular(30),
          clipBehavior: Clip.antiAlias,
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              surfaceTintColor: Colors.transparent,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.white,
              height: 50,
              indicatorColor: Colors.transparent,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              iconTheme: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return const IconThemeData(
                    size: 30,
                    color: Color(0xFF828368),
                  );
                }
                return const IconThemeData(size: 24, color: Colors.grey);
              }),

              labelTextStyle: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF828368),
                  );
                }
                return const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                );
              }),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 20),
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
                    icon: Icon(Icons.public),
                    selectedIcon: Icon(Icons.travel_explore),
                    label: 'Impact',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person_outline),
                    selectedIcon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
