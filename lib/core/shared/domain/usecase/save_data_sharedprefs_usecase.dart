import 'package:dartz/dartz.dart';

import '../../../error/failure.dart';
import '../../../usecase/base_usecase.dart';
import '../repository/base_shared_repository.dart';

class SetDataSharedPrefsUseCase
    extends BaseUseCase<dynamic, SharedPrefsSetParams> {
  final BaseSharedRepository baseSharedRepository;

  SetDataSharedPrefsUseCase(this.baseSharedRepository);

  @override
  Future<Either<Failure, bool>> call(SharedPrefsSetParams parameters) async {
    return await baseSharedRepository.saveDataSharedPreference(
      key: parameters.key,
      value: parameters.value,
    );
  }
}
