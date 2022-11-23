import 'package:flutter/material.dart';
import 'package:pizza4u/utils/my_router.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyResources {
  MaterialColor kPrimaryColor = const MaterialColor(
    0xFFFFA200,
    <int, Color>{
      50: Color(0xFFFFA200),
      100: Color(0xFFFFA200),
      200: Color(0xFFFFA200),
      300: Color(0xFFFFA200),
      400: Color(0xFFFFA200),
      500: Color(0xFFFFA200),
      600: Color(0xFFFFA200),
      700: Color(0xFFFFA200),
      800: Color(0xFFFFA200),
      900: Color(0xFFFFA200),
    },
  );

  primaryGold() {
    return const Color.fromARGB(255, 255, 162, 0);
  }

  Color secondaryGold() {
    return const Color.fromARGB(255, 220, 188, 133);
  }

  Color primaryBG() {
    return const Color.fromARGB(255, 234, 230, 223);
  }

  Color secondaryBG() {
    return const Color.fromARGB(255, 238, 238, 238);
  }

  buttons(context, Color bg, String text, Widget nav) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bg,
            minimumSize: const Size(double.infinity, 50),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)))),
        onPressed: () {
          Navigator.push(context, MyRoute(widget: nav));
        },
        child: Text(
          text,
          style: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Sora',
              fontSize: 16),
        ));
  }

  iconButton(context, Widget icon, String text, Widget nav) {
    return Container(
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.topRight,
        child: Stack(alignment: Alignment.center, children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: primaryBG(),
                border: Border.all(color: Colors.black12),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MyRoute(widget: nav));
            },
            icon: icon,
            iconSize: 30,
          ),
          Container(
            width: 18,
            height: 18,
            margin: const EdgeInsets.only(right: 25, bottom: 20, top: 5),
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ]));
  }

  iconButtontwo(context, Widget icon, Widget nav) {
    return Container(
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.topRight,
        child: Stack(alignment: Alignment.center, children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: primaryBG(),
                border: Border.all(color: Colors.black12),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MyRoute(widget: nav));
            },
            icon: icon,
            iconSize: 30,
          ),
        ]));
  }

  alert(context, String text) {
    return Alert(
      context: (context),
      type: AlertType.success,
      title: text,
      buttons: [
        DialogButton(
          radius: const BorderRadius.all(Radius.circular(20)),
          onPressed: () => Navigator.pop(context),
          width: 120,
          child: const Text(
            "COOL",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        )
      ],
    ).show();
  }

  TextFormField inputFormField(
      TextEditingController controller,
      Widget icon,
      String hintText,
      String? labelText,
      FormFieldValidator<String> validator) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
            fillColor: primaryBG(),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: secondaryBG()),
                borderRadius: const BorderRadius.all(Radius.circular(25))),
            prefixIcon: icon,
            hintText: hintText,
            labelText: labelText),
        validator: validator);
  }
}
