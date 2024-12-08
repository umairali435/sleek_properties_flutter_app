import 'package:sleek_properties_flutter/common/services/api/api_service.dart';
import 'package:sleek_properties_flutter/common/settings/logger_customizations/custom_logger.dart';
import 'package:sleek_properties_flutter/presentation/home/domain/models/property_model.dart';

class HomeRemoteDataSource {
  final ApiService apiService;
  const HomeRemoteDataSource({required this.apiService});

  Future<List<PropertyModel>> fetchProperties() async {
    final response = await apiService.get('api/properties');

    final log = CustomLogger(className: "get");
    log.d(response);
    List<PropertyModel> properties = [];
    for (var property in response) {
      properties.add(PropertyModel.fromJson(property));
    }
    return properties;
  }
}
