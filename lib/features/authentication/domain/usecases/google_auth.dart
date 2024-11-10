import 'package:climatify/features/authentication/domain/entities/google_auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:climatify/core/error/failure.dart';
import 'package:climatify/core/usecase/base_usecase.dart';
import '../repository/base_authentication_repository.dart';

class GoogleAuthUseCase extends BaseUseCase<GoogleAuthEntity, GoogleAuthParams> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  GoogleAuthUseCase(this.baseAuthenticationRepository);

  @override
  Future<Either<Failure, GoogleAuthEntity>> call(
      GoogleAuthParams parameters) async {
    return await baseAuthenticationRepository.googleAuth();
  }
}
