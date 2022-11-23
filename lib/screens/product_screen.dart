import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pizza4u/screens/all_products_screen.dart';
import 'package:pizza4u/utils/all_resources.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class ProductScreen extends StatefulWidget {
  final String name;
  final String price;
  final String description;
  const ProductScreen(
      {super.key,
      required this.name,
      required this.price,
      required this.description});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var _count = 0.0;
  var _price = 0.0;
  @override
  void initState() {
    super.initState();
    _count = double.parse(widget.price);
    _price = double.parse(widget.price);
  }

  final myResources = MyResources();
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
                color: myResources.primaryBG(),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.elliptical(200, 200),
                    bottomRight: Radius.elliptical(200, 200))),
            child: SizedBox(
              height: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 60),
                        child: myResources.iconButtontwo(
                            context,
                            const Icon(FeatherIcons.chevronLeft),
                            const AllProductScreen()),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Container(
                              padding: const EdgeInsets.only(right: 20),
                              alignment: Alignment.topRight,
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: myResources.primaryBG(),
                                      border: Border.all(color: Colors.black12),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15))),
                                ),
                                IconButton(
                                  onPressed: () {
                                    productProvider.addRemoveFav(widget.name);
                                  },
                                  icon: productProvider.isFavourite(widget.name)
                                      ? const Icon(
                                          BootstrapIcons.heart_fill,
                                          color: Colors.red,
                                        )
                                      : const Icon(BootstrapIcons.heart),
                                  iconSize: 30,
                                ),
                              ]))),
                    ],
                  ),
                  const Positioned(
                      child: CircleAvatar(
                    radius: 120,
                    backgroundColor: Color.fromARGB(255, 218, 210, 185),
                  )),

                  const Positioned(
                      child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Color.fromARGB(255, 214, 200, 155),
                  )),
                  const Positioned(
                      child: CircleAvatar(
                    radius: 90,
                    backgroundColor: Color.fromARGB(255, 247, 232, 185),
                  )),
                  const Positioned(
                      child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Color.fromARGB(255, 231, 225, 204),
                    child: Image(image: AssetImage("assets/images/pizza.png")),
                  )),
                  Positioned(
                    bottom: 15,
                    right: 65,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 247, 242, 223),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      alignment: Alignment.center,
                      // color: Color.fromARGB(255, 247, 242, 223),
                      height: 40,
                      width: 40,

                      child: const Text(
                        "L",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: "Sora"),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 70,
                    // child: Padding(
                    //   padding: const EdgeInsets.only(top: 370),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 247, 242, 223),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      // ignore: sort_child_properties_last
                      child: const Text(
                        "S",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: "Sora"),
                      ),
                      alignment: Alignment.center,
                      // color: Color.fromARGB(255, 247, 242, 223),
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Positioned(
                    bottom: 0,

                    // child: Padding(
                    //   padding: const EdgeInsets.only(top: 370),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 162, 0),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      // ignore: sort_child_properties_last
                      child: const Text(
                        "M",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: "Sora"),
                      ),
                      alignment: Alignment.center,
                      // color: Color.fromARGB(255, 247, 242, 223),
                      height: 40,
                      width: 40,
                    ),
                  ),
                  // ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      BootstrapIcons.fire,
                      size: 12,
                      color: Color.fromARGB(255, 255, 162, 0),
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Sora",
                          fontSize: 20),
                    ),
                    const SizedBox(
                      width: 180,
                    ),
                    const Icon(
                      Icons.star,
                      size: 12,
                      color: Color.fromARGB(255, 255, 162, 0),
                    ),
                    const Text("5/5"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      BootstrapIcons.lightning_charge_fill,
                      size: 12,
                      color: Color.fromARGB(255, 255, 162, 0),
                    ),
                    Text(
                      widget.description,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(width: 75),
                    const Text(
                      '100%',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: const [
                      Text(
                        'pizza Margherita Italian\ncuisine Tomato',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Row(
              children: const [
                Icon(
                  Icons.star_border,
                  color: Color.fromARGB(255, 255, 162, 0),
                ),
                Text(
                  'Ingredients',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  '(Customable)',
                  style: TextStyle(color: Colors.black12),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: myResources.primaryBG(),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child:
                      const Image(image: AssetImage('assets/images/Emoji.png')),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: myResources.primaryBG(),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: const Image(
                      image: AssetImage('assets/images/Emoji1.png')),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: myResources.primaryBG(),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: const Image(
                      image: AssetImage('assets/images/Emoji3.png')),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: myResources.primaryBG(),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: const Image(
                      image: AssetImage('assets/images/Emoji4.png')),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: myResources.primaryBG(),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: const Image(
                      image: AssetImage('assets/images/Emoji5.png')),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: myResources.primaryBG(),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: const Image(
                      image: AssetImage('assets/images/Emoji6.png')),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: myResources.primaryBG(),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: const Image(
                      image: AssetImage('assets/images/Emoji7.png')),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: myResources.primaryBG(),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: const Image(
                      image: AssetImage('assets/images/Emoji8.png')),
                ),
                const SizedBox(
                  width: 65,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: myResources.primaryGold(),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Icon(Icons.edit),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.speaker,
                  color: myResources.primaryGold(),
                ),
                const Text('Count'),
                const SizedBox(
                  width: 210,
                ),
                const Text('\$ Price'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: CustomizableCounter(
                    borderColor: myResources.secondaryBG(),
                    borderWidth: 2,
                    backgroundColor: Colors.white,
                    textColor: const Color.fromARGB(255, 229, 223, 214),
                    textSize: 20,
                    count: 1,
                    step: 1,
                    showButtonText: false,
                    minCount: 1,
                    maxCount: 100,
                    incrementIcon: const Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 255, 162, 0),
                    ),
                    decrementIcon: const Icon(
                      FeatherIcons.minus,
                      color: Color.fromARGB(255, 255, 162, 0),
                    ),
                    onIncrement: (c) {
                      setState(() {
                        _price = _count * c;
                      });
                    },
                    onDecrement: (c) {
                      setState(() {
                        _price = _count * c;
                      });
                    },
                  ),
                ),
                Text(
                  _price.toString(),
                  style: const TextStyle(
                      fontFamily: "Sora",
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 50),
              child: myResources.buttons(context, myResources.primaryGold(),
                  "Order Now", const AllProductScreen())),
        ]),
      ),
    );
  }
}
