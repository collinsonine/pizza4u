import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        height: 1000,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/P1.jpg'), fit: BoxFit.cover)),
        child: Column(
          children: [
            SafeArea(
              left: true,
              right: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 20),
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
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            FeatherIcons.chevronLeft,
                            size: 30,
                            color: Colors.black54,
                          ),
                        ),
                      ])),
                  Container(
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
                                    builder: (context) =>
                                        const ProductScreen()));
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
                      ]))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
