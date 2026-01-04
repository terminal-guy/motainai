import 'package:flutter/material.dart';
import 'package:motainai/components/today_imapct.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImpactPage extends StatefulWidget {
  const ImpactPage({super.key});

  @override
  State<ImpactPage> createState() => _ImpactPageState();
}

class _ImpactPageState extends State<ImpactPage> {
  bool onLastPage = false;
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
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

      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2); // change based on last page number
              });
            },
            controller: _controller,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(height: 180),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0, left: 12.0),
                    child: TodaysImpactCard(),
                  ),
                ],
              ),

              // second image - forest action
              Column(
                children: [
                  Container(height: 180),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TodaysImpactCard(),
                  ),
                ],
              ),
            ],
          ),

          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 160),

            child: SmoothPageIndicator(
              controller: _controller,
              count: 2,
              effect: JumpingDotEffect(
                activeDotColor: Colors.green.shade900,
                dotColor: Colors.black26,
                dotHeight: 20,
                dotWidth: 20,
                spacing: 30,
                verticalOffset: 20,
                jumpScale: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
