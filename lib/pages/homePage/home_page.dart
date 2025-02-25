import 'package:flutter/material.dart';
import 'package:izmir_bb_hal_fiyatlari/global/constants/constants.dart';
import 'package:izmir_bb_hal_fiyatlari/global/globalVariables/global_variables.dart';
import 'package:izmir_bb_hal_fiyatlari/models/fishes_models.dart';
import 'package:izmir_bb_hal_fiyatlari/services/FishesService.dart';
import 'package:izmir_bb_hal_fiyatlari/services/FruitsAndVegetablesService.dart';
import '../../models/fruits_and_vegetables_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FruitsApiService _apiService = FruitsApiService();
  FruitsAndVegetablesModels? _fruitsModels;
  bool _isLoading = true;

  final FishesApiService _fishesApiService = FishesApiService();
  FishesModels? _fishesModels;

  final String baseUrl = imageBaseUrl;

  Future<void> fetchFruits() async {
    final data = await _apiService.fetchFruitsApiCall();
    setState(() {
      _fruitsModels = data;
    });
  }

  Future<void> fetchFishes() async {
    final data = await _fishesApiService.fetchFishesApiCall();
    setState(() {
      _fishesModels = data;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.wait([
      fetchFruits(),
      fetchFishes(),
    ]).then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          title: Text(GeneralStrings.categories, style: titlesFont13(context)),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : (_fishesModels == null)
                ? const Center(child: Text(GeneralStrings.serviceError))
                : Padding(
                    padding: paddingHorizontal(10),
                    child: Scaffold(
                        body: Expanded(
                      child: SingleChildScrollView(
                        child: SizedBox(
                          width: W(context),
                          child: Column(
                            children: [
                              listBoxContainer(
                                context: context,
                                title: GeneralStrings.fishes,
                                item: _fishesModels,
                              ),
                              listBoxContainer(
                                context: context,
                                title: GeneralStrings.vegetables,
                                item: _fruitsModels,
                              ),
                              listBoxContainer(
                                context: context,
                                title: GeneralStrings.fruits,
                                item: _fruitsModels,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                  ));
  }

  Container listBoxContainer<T>(
      {required BuildContext context, required String title, required T item}) {
    final List<dynamic> list;
    final List<dynamic>? vegetables;
    final List<dynamic>? fruits;

    if (item is FishesModels) {
      list = item.halFiyatListesi ?? [];
    } else if (item is FruitsAndVegetablesModels) {
      fruits = _fruitsModels?.halFiyatListesi
          ?.where((item) => item.malTipAdi == GeneralStrings.fruit)
          .toList();
      vegetables = _fruitsModels?.halFiyatListesi
          ?.where((item) => item.malTipAdi == GeneralStrings.vegetable)
          .toList();

      if (title == GeneralStrings.fruits) {
        list = fruits ?? [];
      } else if (title == GeneralStrings.vegetables) {
        list = vegetables ?? [];
      } else {
        list = [];
      }
    } else {
      list = [];
    }

    final int count = list.length;

    return Container(
      margin: paddingTop(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: titleFont15(context)),
                TextButton(
                    onPressed: () {}, // TODO: add navigation
                    child: Text(
                      GeneralStrings.seeAll,
                      style: seeAll(context),
                    ))
              ]),
          const SizedBox(height: 10),
          SizedBox(
            height: 210,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: count > 4 ? 4 : count,
              itemBuilder: (context, index) {
                final item = list[index];
                return SizedBox(
                  width: W(context) * 0.40,
                  child: Card(
                      color: cardBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: circularRadius(5),
                      ),
                      elevation: 2,
                      child: Padding(
                        padding: paddingAll(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              borderRadius: circularRadius(8),
                              child: Image.network(
                                "$baseUrl${item.gorsel}",
                                width: 130,
                                height: 110,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.image_not_supported,
                                      size: 50);
                                },
                              ),
                            ),
                            Text(
                              item.malAdi.toString(),
                              style: productName(context),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
