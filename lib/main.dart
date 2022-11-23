import 'package:flutter/material.dart';
import 'package:pizza4u/providers/product_provider.dart';
import 'package:pizza4u/screens/add_product_screen.dart';
import 'package:pizza4u/screens/home_screen.dart';
import 'package:pizza4u/utils/all_resources.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final myResources = MyResources();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider())
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/add_product': (context) => const AddProductScreen(),
        },
        theme: ThemeData(primarySwatch: myResources.kPrimaryColor),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
      ),
    );
  }
}
