import 'package:currency_converter/Components/Countrieslist.dart';
import 'package:currency_converter/Models/CountryModel.dart';
import 'package:currency_converter/Views/HomeView.dart';
import 'package:flutter/material.dart';

class Country1 extends StatefulWidget {
  const Country1({super.key});
  @override
  State<Country1> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<Country1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: DropdownButton<CountryModel>(
          value: SelectedCountry1,
          hint: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Choose country",
              style: TextStyle(color: Colors.black),
            ),
          ),
          items: Countries.map(
            (CountryModel item) {
              return DropdownMenuItem<CountryModel>(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(item.Flag))),
                        ),
                        Text(item.Name),
                      ],
                    ),
                  ));
            },
          ).toList(),
          onChanged: (CountryModel? newValue) {
            setState(() {
              SelectedCountry1 = newValue;
            });
          },
        ),
      ),
    );
  }
}