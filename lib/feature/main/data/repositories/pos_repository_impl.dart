
import 'package:simple_sample/feature/main/data/sources/remote/pos_remote_data_source.dart';
import 'package:simple_sample/feature/main/domain/entities/login_param/login_param.dart';
import 'package:simple_sample/feature/main/domain/repositories/pos_repository.dart';

class PosRepositoryImpl implements PosRepository {
  final PosRemoteDataSource remoteDataSource;

  PosRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> loginUser(LoginParam loginParam) async {
    await remoteDataSource.loginUser(loginParam);
  }

}