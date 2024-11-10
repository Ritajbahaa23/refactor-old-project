import 'package:dartz/dartz.dart';

import '../../../error/failure.dart';
import '../../../usecase/base_usecase.dart';
import '../repository/base_shared_repository.dart';


class ClearDataSharedPrefsUseCase
    extends BaseUseCase<dynamic, NoParameters> {
  final BaseSharedRepository baseSharedRepository;

  ClearDataSharedPrefsUseCase(this.baseSharedRepository);

  @override
  Future<Either<Failure, dynamic>> call(NoParameters parameters) async {
    return await baseSharedRepository.clearData();
  }
}
