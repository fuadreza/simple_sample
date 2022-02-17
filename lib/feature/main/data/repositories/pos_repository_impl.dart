
import 'package:simple_sample/feature/main/data/sources/remote/pos_remote_data_source.dart';
import 'package:simple_sample/feature/main/domain/entities/location/response/location_response.dart';
import 'package:simple_sample/feature/main/domain/entities/login/param/login_param.dart';
import 'package:simple_sample/feature/main/domain/repositories/pos_repository.dart';

class PosRepositoryImpl implements PosRepository {
  final PosRemoteDataSource remoteDataSource;

  PosRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> loginUser(LoginParam loginParam) async {
    await remoteDataSource.loginUser(loginParam);
  }

  @override
  Future<List<LocationResponse>> getLocations() async {
    const String pageSize = '10';
    final List<LocationResponse> locations = await remoteDataSource.getLocations(pageSize);
    return locations;
  }

}
