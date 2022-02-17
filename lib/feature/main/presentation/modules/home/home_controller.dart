
import 'package:get/get.dart';
import 'package:simple_sample/core/network/server_exception.dart';
import 'package:simple_sample/core/services/hive_service.dart';
import 'package:simple_sample/core/usecase/usecase.dart';
import 'package:simple_sample/feature/main/domain/entities/location/response/location_response.dart';
import 'package:simple_sample/feature/main/domain/entities/location/state/location_state.dart';
import 'package:simple_sample/feature/main/domain/usecases/get_locations_usecase.dart';

class HomeController extends GetxController {

  HomeController({required this.getLocationsUseCase});

  //region INITIALIZATION

  final GetLocationsUseCase getLocationsUseCase;

  final RxInt _counter = 0.obs;

  final Rx<LocationState> _locationState = LocationState().obs;

  //endregion


  //region GETTER

  int get counter => _counter.value;

  LocationState get locationState => _locationState.value;

  //endregion


  //region SETTER

  set counter(value) => _counter.value = value;

  set locationState(value) => _locationState.value = value;

  //endregion

  @override
  void onInit() async {
    String? token = await hive.getToken();
    print('TOKEN => $token');
    getLocations();
    super.onInit();
  }

  //region FUNCTION

  void onPlusButtonPressed() {
    _counter.value++;
  }

  getLocations() async {
    locationState = LocationLoading();
    try {
      final List<LocationResponse> locations = await getLocationsUseCase.invoke(NoParams());
      print('LOCATION => ${locations.first}');
      locationState = LocationSuccess(locations: locations);
    } on ServerException catch (error) {
      locationState = LocationFailed(message: '${error.message}');
      Get.defaultDialog(
          title: 'Error',
          middleText: '${error.message}',
          textConfirm: "Confirm",
          onConfirm: () {
            Get.back();
          }
      );
    }
  }

  //endregion

}
