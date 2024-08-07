import 'package:currency_converter/Models/CountryModel.dart';
import 'package:currency_converter/Widgets/ButtonAndConversion.dart';
import 'package:currency_converter/Widgets/Conunty1.dart';
import 'package:currency_converter/Widgets/Country2.dart';
import 'package:currency_converter/Widgets/TextBox.dart';
import 'package:flutter/material.dart';

CountryModel? SelectedCountry1, SelectedCountry2;
final price1 = TextEditingController();

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff97BC62),
      appBar: AppBar(
        backgroundColor: const Color(0xff2C5F2D),
        title: const Text(
          "Currency Converter",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "     From",
                  style: TextStyle(fontSize: 30, color: Colors.grey.shade700),
                ),
                const Spacer(),
                Text(
                  "To        ",
                  style: TextStyle(fontSize: 30, color: Colors.grey.shade700),
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(children: [
              Country1(),
              const Spacer(
                flex: 1,
              ),
              Country2(),
            ]),
            const SizedBox(
              height: 30,
            ),
            const TextBox(),
            const SizedBox(
              height: 30,
            ),
            const ButtonAndConversion()
          ],
        ),
      ),
    );
  }
}
