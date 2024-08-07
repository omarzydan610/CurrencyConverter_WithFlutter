import 'package:dio/dio.dart';

class PriceService {
  final dio = Dio();
  String? From;
  String? To;
  PriceService({required this.From, required this.To});
  Future<List<double>> getPrice() async {
    List<double> data = [];
    Response responce1 = await dio.get(
        "https://api.currencyfreaks.com/v2.0/rates/latest?apikey=b82390c7663d4d96b5db60e485375cb7&symbols=$From");
    Response responce2 = await dio.get(
        "https://api.currencyfreaks.com/v2.0/rates/latest?apikey=b82390c7663d4d96b5db60e485375cb7&symbols=$To");
    data.add(double.parse(responce1.data["rates"]["$From"]));
    data.add(double.parse(responce2.data["rates"]["$To"]));
    return data;
  }
}
