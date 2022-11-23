import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:pizza4u/screens/add_product_screen.dart';
import 'package:pizza4u/screens/all_products_screen.dart';
import 'package:pizza4u/utils/all_resources.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myResources = MyResources();

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 477),
              height: 480,
              width: double.infinity,
              color: const Color.fromARGB(255, 234, 230, 223),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      width: 110,
                      height: 110,
                      clipBehavior: Clip.none,
                      child: Image.asset('assets/images/pizza.png')),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: const Text(
                      'Pizza for you',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(
                          left: 100, right: 80, bottom: 40),
                      child: const ListTile(
                        minLeadingWidth: 10,
                        horizontalTitleGap: 1,
                        leading: Icon(
                          BootstrapIcons.lightning_charge_fill,
                          color: Color.fromARGB(255, 255, 173, 51),
                          size: 15,
                        ),
                        title: Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Everyday new pizza \n eat fresh pizza',
                            style: TextStyle(
                                color: Color.fromARGB(255, 150, 154, 176),
                                fontSize: 18,
                                fontFamily: "Sora"),
                          ),
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 20),
                      child: myResources.buttons(
                          context,
                          myResources.secondaryGold(),
                          "Add New Product",
                          const AddProductScreen())),
                  Container(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 50),
                      child: myResources.buttons(
                          context,
                          myResources.primaryGold(),
                          "View All Products",
                          const AllProductScreen()))
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 100),
                height: 450,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/chef.png'),
                        fit: BoxFit.fitHeight)),
                child: myResources.iconButton(
                    context,
                    const Icon(BootstrapIcons.heart),
                    productProvider.favouriteList.length.toString(),
                    const AllProductScreen()))
          ],
        ),
      ),
    );
  }
}
