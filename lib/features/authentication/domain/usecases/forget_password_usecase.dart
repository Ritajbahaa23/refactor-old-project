import 'package:climatify/features/authentication/domain/entities/basic_enitty.dart';
import 'package:dartz/dartz.dart';
import 'package:climatify/core/error/failure.dart';
import 'package:climatify/core/usecase/base_usecase.dart';
import '../repository/base_authentication_repository.dart';

class ForgetPasswordUseCase
    extends BaseUseCase<BasicEntity, ForgetPasswordParams> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  ForgetPasswordUseCase(this.baseAuthenticationRepository);

  @override
  Future<Either<Failure, BasicEntity>> call(
      ForgetPasswordParams parameters) async {
    return await baseAuthenticationRepository.forgetPassword(
      email: parameters.email,
    );
  }
}
