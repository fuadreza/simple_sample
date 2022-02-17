
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_sample/feature/main/domain/entities/location/response/location_response.dart';
import 'package:simple_sample/feature/main/domain/entities/location/state/location_state.dart';
import 'package:simple_sample/feature/main/presentation/modules/home/home_controller.dart';
import 'package:simple_sample/feature/main/presentation/widgets/items/item_locations.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'App'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() =>
              handleStateLocation(controller.locationState)
            ),
          ],
        ),
      ),
    );
  }

  Widget handleStateLocation(LocationState state) {
    if(state is LocationSuccess) {
      return displayListLocations(state.locations);
    } else if (state is LocationFailed) {
      return const Text('Failed loading Locations');
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  Widget displayListLocations(List<LocationResponse> locations) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            const Duration(seconds: 1),
            () {
              controller.getLocations();
            }
          );
        },
        child: ListView(
          children: List.generate(
            locations.length,
            (index) {
              return ItemLocation(locationResponse: locations[index]);
            },
          ),
        ),
      ),
    );
  }
}