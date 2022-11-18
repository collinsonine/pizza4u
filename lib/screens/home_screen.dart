import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pizza4u/screens/product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 220, 188, 133),
                            minimumSize: const Size(double.infinity, 50),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
                        onPressed: () {},
                        child: const Text(
                          'Add New Product',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Sora',
                              fontSize: 16),
                        )),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 50),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 162, 0),
                            minimumSize: const Size(double.infinity, 50),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
                        onPressed: () {},
                        child: const Text(
                          'View All Products',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Sora',
                              fontSize: 16),
                        )),
                  )
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
                child: Container(
                    padding: const EdgeInsets.only(right: 20),
                    alignment: Alignment.topRight,
                    child: Stack(alignment: Alignment.center, children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(100, 220, 188, 133),
                            border: Border.all(color: Colors.black26),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProductScreen()));
                        },
                        icon: const Icon(
                          FeatherIcons.heart,
                          size: 30,
                          color: Colors.black54,
                        ),
                      ),
                      Container(
                        width: 18,
                        height: 18,
                        margin: const EdgeInsets.only(
                            right: 25, bottom: 20, top: 5),
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: const Text(
                          '4',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ]))),
          ],
        ),
      ),
    );
  }
}
