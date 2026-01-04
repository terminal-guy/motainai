import 'package:flutter/material.dart';
import 'package:motainai/intro%20_screens/intro_page_1.dart';
import 'package:motainai/intro%20_screens/intro_page_2.dart';
import 'package:motainai/intro%20_screens/intro_page_3.dart';
import 'package:motainai/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:motainai/Homepage.dart';
import 'package:motainai/intro%20_screens/intro_page_4.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3); // change based on last page number
              });
            },
            controller: _controller,
            children: [IntroPage1(), IntroPage2(), IntroPage3(), IntroPage4()],
          ),
          // dot page indicator
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 90),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // skip
                /// GestureDetector(
                ///   child: Text('SKIP'),
                ///   onTap: () {
                ///     _controller.jumpToPage(2);
                ///   },
                /// ),
                if (onLastPage)
                  SizedBox(
                    width: 260,
                    child: ElevatedButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('hasSeenOnboarding', true);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        'Let\’s make an impact together',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: JumpingDotEffect(
                    activeDotColor: Colors.green.shade900,
                    dotColor: Colors.black26,
                    dotHeight: 20,
                    dotWidth: 20,
                    spacing: 30,
                    verticalOffset: 12,
                    jumpScale: 5,
                  ),
                ),

                /// // next
                /// onLastPage
                ///     ? GestureDetector(
                ///         child: Text('Count me in'),
                ///         onTap: () {
                ///           Navigator.push(
                ///             context,
                ///             MaterialPageRoute(
                ///               builder: (context) {
                ///                 return HomePage();
                ///               },
                ///             ),
                ///           );
                ///         },
                ///       )
                ///     : GestureDetector(
                ///         child: Text('NEXT'),
                ///         onTap: () {
                ///           _controller.nextPage(
                ///             duration: Duration(milliseconds: 500),
                ///             curve: Curves.easeIn,
                ///           );
                ///         },
                ///       ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
