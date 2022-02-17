
import 'package:simple_sample/feature/main/domain/entities/location/response/location_response.dart';

class LocationResponseModel extends LocationResponse {
  final int locationId;
  final String locationName;
  final String address;
  final String city;
  final String phone;
  final String email;

  const LocationResponseModel({
    required this.locationId,
    required this.locationName,
    required this.address,
    required this.city,
    required this.phone,
    required this.email,
  }): super(
      locationId: locationId,
      locationName: locationName,
      address: address,
      city: city,
      phone: phone,
      email: email,
  );

  factory LocationResponseModel.fromJson(Map<String, dynamic> json) {
    return LocationResponseModel(
        locationId: json['location_id'] ?? 0,
        locationName: json['location_name'] ?? '[Empty name]',
        address: json['address'] ?? '[Empty address]',
        city: json['city'] ?? '[Empty city]',
        phone: json['phone'] ?? '[Empty phone]',
        email: json['email'] ?? '[Empty email]',
    );
  }

  static List<LocationResponse> parseLocations(json) {
    final List list = json as List;
    final List<LocationResponse> locations = list.map((data) => LocationResponseModel.fromJson(data)).toList();
    return locations;
  }
}