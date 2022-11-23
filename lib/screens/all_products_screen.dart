import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pizza4u/models/product_model.dart';
import 'package:pizza4u/providers/product_provider.dart';
import 'package:pizza4u/screens/add_product_screen.dart';
import 'package:pizza4u/screens/home_screen.dart';
import 'package:pizza4u/screens/product_screen.dart';
import 'package:pizza4u/utils/all_resources.dart';
import 'package:pizza4u/utils/my_router.dart';
import 'package:provider/provider.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  final myResources = MyResources();
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
        backgroundColor: myResources.secondaryBG(),
        appBar: AppBar(
          backgroundColor: myResources.secondaryBG(),
          elevation: 0,
          leading: const Image(image: AssetImage('assets/images/Logo.png')),
          leadingWidth: 100,
          title: const Image(image: AssetImage('assets/images/Location.png')),
          centerTitle: true,
          actions: [
            myResources.iconButton(
                context,
                const Icon(BootstrapIcons.heart),
                productProvider.favouriteList.length.toString(),
                const HomeScreen())
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Image(image: AssetImage('assets/images/Banner.png')),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 330,
                      height: 88,
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: myResources.primaryBG(),
                          filled: true,
                          prefixIcon: const Icon(FeatherIcons.search),
                          hintText: "Search for your favourite pizza",
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                      ),
                    ),
                    Container(
                      child: myResources.iconButtontwo(
                          context,
                          const Icon(PhosphorIcons.sortDescendingThin),
                          const HomeScreen()),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 600,
                width: double.infinity,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: .6,
                  children: List.generate(productProvider.productList.length,
                      (index) {
                    ProductModel model = productProvider.productList[index];
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        // Container(
                        //   width: MediaQuery.of(context).size.width / 2,
                        //   color: myResources.secondaryBG(),
                        // ),
                        Container(
                          width: 180,
                          height: 230,
                          margin: const EdgeInsets.only(bottom: 60),
                          decoration: BoxDecoration(
                              color: myResources.primaryBG(),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30))),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 280),
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            // color: Color.fromARGB(255, 238, 238, 238),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            // border: Border.all(color: Colors.black12)
                          ),
                          child: const Image(
                              height: 85,
                              width: 85,
                              image: AssetImage('assets/images/pizza.png')),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          margin: const EdgeInsets.only(left: 150, bottom: 290),
                          decoration: BoxDecoration(
                              color: myResources.primaryBG(),
                              border: Border.all(color: Colors.black12),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          child: IconButton(
                              onPressed: () {
                                productProvider.addRemoveFav(model.name);
                              },
                              icon: productProvider.isFavourite(model.name)
                                  ? const Icon(
                                      PhosphorIcons.heartFill,
                                      color: Colors.red,
                                    )
                                  : const Icon(PhosphorIcons.heart)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 120),
                          child: Text(
                            model.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 40),
                            child: ListTile(
                              minLeadingWidth: 10,
                              horizontalTitleGap: 1,
                              leading: const Icon(
                                BootstrapIcons.lightning_charge_fill,
                                color: Color.fromARGB(255, 255, 173, 51),
                                size: 15,
                              ),
                              title: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  model.description,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 150, 154, 176),
                                      fontSize: 12,
                                      fontFamily: "Sora"),
                                ),
                              ),
                            )),
                        Container(
                          margin: const EdgeInsets.only(top: 70),
                          child: Text(
                            '\$${model.price}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 160),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(60, 35),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MyRoute(
                                        widget: ProductScreen(
                                      description: model.description,
                                      name: model.name,
                                      price: model.price,
                                    )));
                              },
                              child: const Text(
                                'Order Now',
                                style:
                                    TextStyle(fontSize: 12, fontFamily: 'Sora'),
                              )),
                        )
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              isExtended: true,
              elevation: 0,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      bottomLeft: Radius.circular(40))),
              onPressed: () {
                Navigator.push(context, MyRoute(widget: const HomeScreen()));
              },
              child: const Icon(PhosphorIcons.houseSimple),
            ),
            FloatingActionButton(
              isExtended: true,
              backgroundColor: Colors.white,
              elevation: 0,
              shape: const RoundedRectangleBorder(),
              onPressed: () {},
              child: const Icon(PhosphorIcons.heart),
            ),
            FloatingActionButton(
              isExtended: true,
              backgroundColor: Colors.white,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              onPressed: () {
                Navigator.push(
                    context, MyRoute(widget: const AddProductScreen()));
              },
              child: const Icon(PhosphorIcons.plusCircle),
            )
          ],
        ));
  }
}
