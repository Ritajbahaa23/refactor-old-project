import 'package:climatify/features/authentication/domain/entities/basic_enitty.dart';
import 'package:dartz/dartz.dart';
import 'package:climatify/core/error/failure.dart';
import 'package:climatify/core/usecase/base_usecase.dart';
import '../repository/base_authentication_repository.dart';

class ConfirmForgetPasswordUseCase
    extends BaseUseCase<BasicEntity, ConfirmForgetPasswordParams> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  ConfirmForgetPasswordUseCase(this.baseAuthenticationRepository);

  @override
  Future<Either<Failure, BasicEntity>> call(
      ConfirmForgetPasswordParams parameters) async {
    return await baseAuthenticationRepository.confirmForgetPassword(
      code: parameters.code,
      email: parameters.email,
      password: parameters.password,
    );
  }
}
