import 'package:climatify/features/authentication/domain/entities/basic_enitty.dart';
import 'package:dartz/dartz.dart';
import 'package:climatify/core/error/failure.dart';
import 'package:climatify/core/usecase/base_usecase.dart';
import '../repository/base_authentication_repository.dart';

class ResendVerifyCodeUseCase
    extends BaseUseCase<BasicEntity, ResendVerifyCodeParams> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  ResendVerifyCodeUseCase(this.baseAuthenticationRepository);

  @override
  Future<Either<Failure, BasicEntity>> call(
      ResendVerifyCodeParams parameters) async {
    return await baseAuthenticationRepository.resendVerifyCode(
      username: parameters.username,
    );
  }
}
