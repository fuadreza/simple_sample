
import 'package:equatable/equatable.dart';

class LocationResponse extends Equatable {
  final int locationId;
  final String locationName;
  final String address;
  final String city;
  final String phone;
  final String email;
  
  const LocationResponse({
    required this.locationId,
    required this.locationName,
    required this.address,
    required this.city,
    required this.phone,
    required this.email,
  });

  @override
  List<Object?> get props => [locationId, locationName, address, city, phone, email];

}
