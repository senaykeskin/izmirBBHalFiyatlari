import 'dart:io';
import 'package:izmir_bb_hal_fiyatlari/models/fishes_models.dart';
import 'package:http/http.dart' as http;

class FishesApiService {
  Future<FishesModels?> fetchFishesApiCall() async {
    final String date = "2024-12-03";

    try {
      final response = await http.get(Uri.parse(
          'https://openapi.izmir.bel.tr/api/ibb/halfiyatlari/balik/$date'));

      if (response.statusCode == HttpStatus.ok) {
        var result = fishModelFromJson(response.body);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
