import 'package:flutter/material.dart';
import 'package:motainai/components/product_model.dart';
import 'package:motainai/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motainai/Homepage.dart';
import 'package:motainai/components/restuarantmodel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

  runApp(MyApp(hasSeenOnboarding: hasSeenOnboarding));
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;

  const MyApp({super.key, required this.hasSeenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductModel()),
        ChangeNotifierProvider(create: (_) => Restuarantmodel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: hasSeenOnboarding ? SplashScreen() : const SplashScreen(),

        // change it to home screen once you are done with the splash screen.
      ),
    );
  }
}
