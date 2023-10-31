class ProductModel {
  final String regProdName;
  final PelakuUsahaModel pelakuUsaha;
  final SertifikatModel sertifikat;

  ProductModel({
    required this.regProdName,
    required this.pelakuUsaha,
    required this.sertifikat,
  });
}

class PelakuUsahaModel {
  final String namaPu;

  PelakuUsahaModel({
    required this.namaPu,
  });
}

class SertifikatModel {
  final String tglSert;
  final String noSert;

  SertifikatModel({
    required this.tglSert,
    required this.noSert,
  });
}
