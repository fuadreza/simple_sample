
import 'package:flutter/material.dart';
import 'package:simple_sample/feature/main/domain/entities/location/response/location_response.dart';

class ItemLocation extends StatelessWidget {
  const ItemLocation({
    required this.locationResponse,
    Key? key,
  }) : super(key: key);

  final LocationResponse locationResponse;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 4),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          margin: EdgeInsets.all(4),
          child: Column(
            children: [
              Text (
                locationResponse.locationName,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 4),
              Text (
                locationResponse.city,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text (
                locationResponse.phone,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text (
                locationResponse.email,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
