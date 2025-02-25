import 'dart:io';
import 'package:izmir_bb_hal_fiyatlari/models/fruits_and_vegetables_models.dart';
import 'package:http/http.dart' as http;

class FruitsApiService {
  Future<FruitsAndVegetablesModels?> fetchFruitsApiCall() async {
    final String date = "2024-12-03";

    try {
      final response = await http.get(Uri.parse(
          'https://openapi.izmir.bel.tr/api/ibb/halfiyatlari/sebzemeyve/$date'));
      if (response.statusCode == HttpStatus.ok) {
        var result = fruitModelFromJson(response.body);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
