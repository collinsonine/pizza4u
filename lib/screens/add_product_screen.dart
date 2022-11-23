import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pizza4u/providers/product_provider.dart';
import 'package:pizza4u/utils/all_resources.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final myResources = MyResources();
  final _formkey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      backgroundColor: myResources.secondaryBG(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: myResources.secondaryBG(),
      ),
      body: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "Add New Product",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Sora",
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                        fillColor: myResources.primaryBG(),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: myResources.secondaryBG()),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25))),
                        prefixIcon: const Icon(FeatherIcons.box),
                        hintText: "Enter product name",
                        labelText: "Product Name"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: price,
                    decoration: InputDecoration(
                        fillColor: myResources.primaryBG(),
                        filled: true,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        prefixIcon: const Icon(FeatherIcons.dollarSign),
                        hintText: "Enter product price",
                        labelText: "Product Price"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Price is required";
                      }
                      return null;
                    },
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    maxLines: 3,
                    controller: description,
                    decoration: InputDecoration(
                        fillColor: myResources.primaryBG(),
                        filled: true,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        prefixIcon: const Icon(FeatherIcons.edit2),
                        hintText: "Enter product description",
                        labelText: "Product Description"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Description is required";
                      }
                      return null;
                    },
                  )),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 162, 0),
                        minimumSize: const Size(double.infinity, 50),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        productProvider.addProduct(
                            name.text, price.text, description.text);
                        myResources.alert(context, "Product Saved");
                        clear();
                      }
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Sora',
                          fontSize: 16),
                    )),
              ),
            ],
          )),
    );
  }

  void clear() {
    name.clear();
    price.clear();
    description.clear();
  }
}
