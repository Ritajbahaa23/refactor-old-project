import 'package:dartz/dartz.dart';
import 'package:climatify/core/error/failure.dart';
import 'package:climatify/core/usecase/base_usecase.dart';

import '../../../../core/shared/domain/entities/login_entity.dart';
import '../repository/base_authentication_repository.dart';

class LoginUseCase extends BaseUseCase<LoginEntity, LoginParams> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  LoginUseCase(this.baseAuthenticationRepository);

  @override
  Future<Either<Failure, LoginEntity>> call(LoginParams parameters) async {
    return await baseAuthenticationRepository.login(
      username: parameters.username,
      password: parameters.password,
    );
  }
}
