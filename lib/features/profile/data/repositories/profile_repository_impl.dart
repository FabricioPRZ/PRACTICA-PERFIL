import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_datasource.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl(this._localDataSource);

  final ProfileLocalDataSource _localDataSource;

  @override
  Future<UserProfile> getProfile() => _localDataSource.getProfile();
}