import 'package:dartz/dartz.dart';

import '../../../error/failure.dart';
import '../../../usecase/base_usecase.dart';
import '../repository/base_shared_repository.dart';

class GetDataSharedPrefsUseCase
    extends BaseUseCase<dynamic, SharedPrefsGetParams> {
  final BaseSharedRepository baseSharedRepository;

  GetDataSharedPrefsUseCase(this.baseSharedRepository);

  @override
  Future<Either<Failure, dynamic>> call(SharedPrefsGetParams parameters) async {
    return await baseSharedRepository.getDataFromSharedPreference(
        key: parameters.key);
  }
}
