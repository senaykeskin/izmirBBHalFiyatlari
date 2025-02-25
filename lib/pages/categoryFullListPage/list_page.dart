import 'package:flutter/material.dart';
import '../../global/constants/constants.dart';
import '../../global/globalVariables/global_variables.dart';
import '../../widgets/search.dart';

class ListPage extends StatefulWidget {
  final List<dynamic> list;

  const ListPage({super.key, required this.list});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<dynamic> filteredList = [];
  String pageTitle = "";

  @override
  void initState() {
    super.initState();
    filteredList = widget.list;

    if (widget.list.isNotEmpty) {
      final item = widget.list.first;
      if (item.malTipAdi == GeneralStrings.vegetable) {
        pageTitle = GeneralStrings.vegetables;
      } else if (item.malTipAdi == GeneralStrings.fruit) {
        pageTitle = GeneralStrings.fruits;
      } else if (item.malTipAdi == GeneralStrings.fish) {
        pageTitle = GeneralStrings.fishes;
      } else {
        pageTitle = "";
      }
    } else {
      pageTitle = "";
    }
  }

  void filterList(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredList = widget.list;
      } else {
        filteredList = widget.list.where((item) {
          return item.malAdi.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        pageTitle,
        style: titlesFont13(context),
      )),
      body: Padding(
        padding: paddingAll(10),
        child: Column(
          children: [
            SearchComponent(onSearchChanged: filterList),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 10,
                ),
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final item = filteredList[index];
                  return Container(
                    padding: paddingTop(10),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        showProductDetails(context, item);
                      },
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: circularRadius(5),
                        ),
                        elevation: 3,
                        child: Padding(
                          padding: paddingAll(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClipRRect(
                                borderRadius: circularRadius(8),
                                child: Image.network(
                                  "$imageBaseUrl${item.gorsel}",
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showProductDetails(BuildContext context, item) {
    showModalBottomSheet(
      showDragHandle: true,
        context: context,
        shape: RoundedRectangleBorder(borderRadius: bottomSheetRadius(20)),
        builder: (context) {
          return SizedBox(
            width: W(context),
            child: Padding(
              padding: paddingAll(20),
              child: Column(
                children: [
                  Text(item.malAdi,
                      style: titleFont15(context).copyWith(fontSize: 20)),
                  Container(
                      margin: paddingTop(30),
                      child: Column(
                        children: [
                          bottomSheetCard(
                              item: item,
                              title: "Ortalama Fiyat",
                              category: "OrtalamaUcret"),
                          bottomSheetCard(
                              item: item,
                              title: "En Düşük Fiyat",
                              category: "AsgariUcret"),
                          bottomSheetCard(
                              item: item,
                              title: "En Yüksek Fiyat",
                              category: "AzamiUcret"),
                        ],
                      ))
                ],
              ),
            ),
          );
        });
  }

  Card bottomSheetCard({
    required dynamic item,
    required String title,
    required String category,
  }) {
    String value = "";
    if (category == "OrtalamaUcret") {
      value = item.ortalamaUcret?.toString() ?? "Bilinmiyor";
    } else if (category == "AsgariUcret") {
      value = item.asgariUcret?.toString() ?? "Bilinmiyor";
    } else if (category == "AzamiUcret") {
      value = item.azamiUcret?.toString() ?? "Bilinmiyor";
    }

    return Card(
      elevation: 3,
      child: Container(
        padding: paddingHorizontal(10),
        height: H(context) * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: searchFont(context),
            ),
            Text(
              "$value TL / ${item.birim}",
              style: searchFont(context),
            ),
          ],
        ),
      ),
    );
  }
}
