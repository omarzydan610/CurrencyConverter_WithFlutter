import 'package:currency_converter/Views/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextBox extends StatelessWidget {
  const TextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: TextField(
          controller: price1,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Color(0xff2C5F2D),
              fontSize: 20,
              fontWeight: FontWeight.bold),
          decoration: const InputDecoration(
              labelText: "Enter the amount you want to convert",
              labelStyle: TextStyle(
                color: Color(0xff2C5F2D),
                fontSize: 18.5,
              ),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Color(0xff2C5F2D)),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Color(0xff2C5F2D)))),
        ),
      ),
    );
  }
}
