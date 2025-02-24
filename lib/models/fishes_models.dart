class FishesModels {
  String? bultenTarihi;
  List<HalFiyatListesi>? halFiyatListesi;

  FishesModels({this.bultenTarihi, this.halFiyatListesi});

  FishesModels.fromJson(Map<String, dynamic> json) {
    bultenTarihi = json['BultenTarihi'];
    if (json['HalFiyatListesi'] != null) {
      halFiyatListesi = <HalFiyatListesi>[];
      json['HalFiyatListesi'].forEach((v) {
        halFiyatListesi!.add(HalFiyatListesi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BultenTarihi'] = bultenTarihi;
    if (halFiyatListesi != null) {
      data['HalFiyatListesi'] =
          halFiyatListesi!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HalFiyatListesi {
  double? ortalamaUcret;
  String? malAdi;
  String? birim;
  double? asgariUcret;
  double? azamiUcret;
  int? malId;
  Null tarih;
  int? halTuru;
  int? malTipId;
  String? malTipAdi;
  String? gorsel;

  HalFiyatListesi(
      {this.ortalamaUcret,
        this.malAdi,
        this.birim,
        this.asgariUcret,
        this.azamiUcret,
        this.malId,
        this.tarih,
        this.halTuru,
        this.malTipId,
        this.malTipAdi,
        this.gorsel});

  HalFiyatListesi.fromJson(Map<String, dynamic> json) {
    ortalamaUcret = json['OrtalamaUcret'];
    malAdi = json['MalAdi'];
    birim = json['Birim'];
    asgariUcret = json['AsgariUcret'];
    azamiUcret = json['AzamiUcret'];
    malId = json['MalId'];
    tarih = json['tarih'];
    halTuru = json['HalTuru'];
    malTipId = json['MalTipId'];
    malTipAdi = json['MalTipAdi'];
    gorsel = json['Gorsel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['OrtalamaUcret'] = ortalamaUcret;
    data['MalAdi'] = malAdi;
    data['Birim'] = birim;
    data['AsgariUcret'] = asgariUcret;
    data['AzamiUcret'] = azamiUcret;
    data['MalId'] = malId;
    data['tarih'] = tarih;
    data['HalTuru'] = halTuru;
    data['MalTipId'] = malTipId;
    data['MalTipAdi'] = malTipAdi;
    data['Gorsel'] = gorsel;
    return data;
  }
}