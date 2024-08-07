import 'package:currency_converter/Views/HomeView.dart';
import 'package:currency_converter/services/PriceService.dart';
import 'package:flutter/material.dart';

String Error = " ";
double? amount;

class ButtonAndConversion extends StatefulWidget {
  const ButtonAndConversion({super.key});

  @override
  State<ButtonAndConversion> createState() => _ButtonAndConversionState();
}

class _ButtonAndConversionState extends State<ButtonAndConversion> {
  Future<List<double>>? future;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff2C5F2D),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: const Text(
            "Convert",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            if (SelectedCountry1 == null || SelectedCountry2 == null) {
              Error = "Error, Please Choose Two Counties!";
            } else if (SelectedCountry1 == SelectedCountry2) {
              Error = "Error, Please Choose Two Different Counties!";
            } else if (price1.text.isEmpty) {
              Error = "Error, Please enter the amount!";
            } else {
              future = PriceService(
                      From: SelectedCountry1!.request,
                      To: SelectedCountry2!.request)
                  .getPrice();
              Error = "";
              amount = double.tryParse(price1.text);
            }
            setState(() {});
          },
        ),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder(
            future: future,
            builder: ((context, snapshot) {
              if (Error == "") {
                if ((snapshot.connectionState == ConnectionState.waiting)) {
                  return const Center(
                    child: SizedBox(
                      width: 60,
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                  );
                } else {
                  String result =
                      (snapshot.data![1] * amount! / snapshot.data![0])
                          .toStringAsFixed(2);
                  return SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Center(
                          child: Text(
                            "$amount ${SelectedCountry1!.request} = $result ${SelectedCountry2!.request}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 60),
                          ),
                        ),
                      ));
                }
              } else {
                return SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Center(
                      child: Text(
                        Error,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 229, 20, 5),
                            fontSize: 60,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                );
              }
            }))
      ],
    );
  }
}
