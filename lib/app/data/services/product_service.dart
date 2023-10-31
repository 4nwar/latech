import 'package:dio/dio.dart';
import 'package:halalin/app/data/models/product.dart';

class ProductService {
  final Dio _dio = Dio();

  Future<List<ProductModel>> searchProducts(String productName) async {
    try {
      final response = await _dio.get(
        'https://cmsbl.halal.go.id/api/search/sertifikat',
        queryParameters: {
          'nama_produk': productName,
          'page': '1',
          'size': '5',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> productListJson = response.data['data']['datas'];

        final List<ProductModel> productList = productListJson
            .map((json) => ProductModel(
                  regProdName: json['reg_prod_name'],
                  pelakuUsaha:
                      PelakuUsahaModel(namaPu: json['pelaku_usaha']['nama_pu']),
                  sertifikat: SertifikatModel(
                    tglSert: json['sertifikat']['tgl_sert'],
                    noSert: json['sertifikat']['no_sert'],
                  ),
                ))
            .toList();

        return productList;

      } else {
        throw 'Gagal mengambil data produk.';
      }
    } catch (error) {
      throw 'Terjadi kesalahan: $error';
    }
  }
}
