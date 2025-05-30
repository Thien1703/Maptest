import 'dart:convert';
import 'package:google_maps_in_flutter/map/mapmodel.dart';
import 'package:http/http.dart' as http;

class ClinicService {
  static bool useFakeData = true;
  // Nếu bạn muốn sử dụng dữ liệu thật từ API, hãy đặt biến này thành false
  // và đảm bảo rằng bạn đã cấu hình AppEnv.baseUrl đúng cách.
  // static Future<List<MapModel>> fetchClinics() async {
  //   if (useFakeData) {
  //     return fetchClinicsFake();
  //   }
  //   // Gọi API thật
  //   final url = '${AppEnv.baseUrl}/api/clinics';
  //   try {
  //     final response = await http.get(Uri.parse(url));
  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = json.decode(response.body);
  //       return data.map((item) => MapModel.fromJson(item)).toList();
  //     } else {
  //       throw Exception('Failed to load clinics');
  //     }
  //   } catch (e) {
  //     print('Error fetching clinics: $e');
  //     rethrow;
  //   }
  // }
  static Future<List<MapModel>> fetchClinics() async {
    // Trả về dữ liệu giả luôn, không cần gọi API nữa
    return fetchClinicsFake();
  }

  // ✅ Thêm hàm fake data ngay dưới đây
  static Future<List<MapModel>> fetchClinicsFake() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      MapModel(
          id: 1,
          name: 'Sân Bóng Đá Phú Nhuận',
          description: 'Sân bóng đá mini chất lượng cao',
          address: '123 Đường Lê Văn Sỹ , Phường 14 , Quận 3',
          image: '',
          latitude: 10.79175692757917,
          longitude: 106.67188155558836),
      MapModel(
        id: 2,
        name: 'Sân Bóng Đá Quận 1',
        description: 'Sân bóng đá mini chất lượng cao',
        address: '456 Đường Nguyễn Thị Minh Khai , Phường 6 , Quận 1',
        image: '',
        latitude: 10.7686508686757,
        longitude: 106.6840997095696,
      ),
      MapModel(
        id: 3,
        name: 'Sân Bóng Đá Quận 2',
        description: 'Sân bóng đá mini chất lượng cao',
        address: '321 Đường Hoàng Văn Thụ , Phường 4 , Quận Tân Bình    ',
        image: '',
        latitude: 10.800634564959362,
        longitude: 106.661398280735,
      ),
      MapModel(
        id: 4,
        name: 'Sân Bóng Đá Quận 3',
        description: 'Sân bóng đá mini chất lượng cao',
        address: '567 Đường Phan Xích Long , Phường 2 , Quận Phú Nhuận',
        image: '',
        latitude: 10.801325725714275,
        longitude: 106.68370266539539,
      ),
      MapModel(
        id: 5,
        name: 'Sân Bóng Đá Quận 4',
        description: 'Sân bóng đá mini chất lượng cao',
        address: '789 Đường Trần Hưng Đạo , Phường 7 , Quận 5',
        image: '',
        latitude: 10.755355356343504,
        longitude: 106.6813942114137,
      ),
    ];
  }
}
