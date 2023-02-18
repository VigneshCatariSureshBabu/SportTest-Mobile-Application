import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Image imageWidget(String path) {
  return Image.asset(
    path,
    fit: BoxFit.fitWidth,
    width: 150,
    height: 100,
  );
}

TextField textWidget(TextEditingController controller, IconData icons,
    String text, bool isPasswordEncoded) {
  return TextField(
    textInputAction: TextInputAction.go,
    controller: controller,
    obscureText: isPasswordEncoded,
    enableSuggestions: !isPasswordEncoded,
    cursorColor: Colors.white,
    decoration: InputDecoration(
      labelText: text,
      prefixIcon: Icon(
        icons,
        color: Colors.black87,
      ),
      filled: true,
      labelStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.normal, fontSize: 15.0),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
    keyboardType: isPasswordEncoded
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

TextField textWidgetWithoutIcon(
    TextEditingController controller, String text, bool isPasswordEncoded) {
  return TextField(
    textInputAction: TextInputAction.go,
    controller: controller,
    obscureText: isPasswordEncoded,
    enableSuggestions: !isPasswordEncoded,
    cursorColor: Colors.white,
    decoration: InputDecoration(
      labelText: text,
      filled: true,
      labelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 15.0,
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
    keyboardType: isPasswordEncoded
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

TextField textWidgetForInteger(TextEditingController controller, String text) {
  return TextField(
    textInputAction: TextInputAction.go,
    controller: controller,
    keyboardType: TextInputType.number,
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
    ],
    cursorColor: Colors.white,
    decoration: InputDecoration(
      labelText: text,
      filled: true,
      labelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 15.0,
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
  );
}

TextField textWidgetForNegativeNumber(
    TextEditingController controller, String text) {
  return TextField(
    textInputAction: TextInputAction.go,
    controller: controller,
    keyboardType:
        const TextInputType.numberWithOptions(signed: true, decimal: true),
    cursorColor: Colors.white,
    decoration: InputDecoration(
      labelText: text,
      filled: true,
      labelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 15.0,
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
  );
}

TextField textWidgetForIntegerWithCustomKeyboard(
    TextEditingController controller, String text) {
  return TextField(
    textInputAction: TextInputAction.search,
    controller: controller,
    keyboardType: TextInputType.number,
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
    ],
    cursorColor: Colors.white,
    decoration: InputDecoration(
      labelText: text,
      filled: true,
      labelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 15.0,
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
  );
}
