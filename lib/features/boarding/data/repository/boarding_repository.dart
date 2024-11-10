
import '../../domain/repository/base_boarding_repository.dart';
import '../datasource/boarding_local_datasource.dart';
import '../datasource/boarding_remote_data_source.dart';

class BoardingRepository extends BaseBoardingRepository {
  final BaseBoardingLocalDataSource baseBoardingLocalDataSource;
  final BaseBoardingRemoteDataSource baseBoardingRemoteDataSource;

  BoardingRepository(
      this.baseBoardingLocalDataSource, this.baseBoardingRemoteDataSource);

}
