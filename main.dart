import 'package:flutter/material.dart';
import 'package:flutter_ahhiii/models/shop.dart';
import 'package:flutter_ahhiii/page/cartpage.dart';
import 'package:flutter_ahhiii/page/page2.dart';
import 'package:provider/provider.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51NvQZACnYtxeOIrz3g0fi98j9JU9fTFTBeLFazyWl1ejhyb9gnXUOvlPnpltg1fgqfjdnUkQv0jfhWZ57x0bnJej00w0kHzCPZ';
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const page2(),
      routes: {
        '/cartpage': (context) =>  CartPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
