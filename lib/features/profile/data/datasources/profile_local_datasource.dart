import '../models/user_profile_model.dart';

/// Contrato del datasources local.
abstract interface class ProfileLocalDataSource {
  Future<UserProfileModel> getProfile();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  const ProfileLocalDataSourceImpl();

  @override
  Future<UserProfileModel> getProfile() async {
    // Simula latencia de lectura local
    await Future<void>.delayed(const Duration(milliseconds: 300));

    return const UserProfileModel(
      name: 'Fabricio Perez',
      username: '@fabricio.prz',
      bio:
      'Flutter Developer · Chiapas, MX 🇲🇽.',
      avatarUrl: 'https://cdn-icons-png.flaticon.com/512/4792/4792929.png',
      bannerUrl: 'https://i.etsystatic.com/34466454/r/il/3ffa97/4635429584/il_570xN.4635429584_li5d.jpg',
      posts: 248,
      followers: 14300,
      following: 512,
      isVerified: true,
    );
  }
}