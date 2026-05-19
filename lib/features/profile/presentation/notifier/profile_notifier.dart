import 'package:flutter/foundation.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/usecases/get_profile.dart';

/// Estado posible de la pantalla de perfil.
sealed class ProfileState {
  const ProfileState();
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileLoaded extends ProfileState {
  const ProfileLoaded(this.profile);
  final UserProfile profile;
}

class ProfileError extends ProfileState {
  const ProfileError(this.message);
  final String message;
}

/// Notifier: orquesta el caso de uso y expone el estado a la UI.
class ProfileNotifier extends ValueNotifier<ProfileState> {
  ProfileNotifier(this._getProfile) : super(const ProfileLoading()) {
    loadProfile();
  }

  final GetProfile _getProfile;

  Future<void> loadProfile() async {
    value = const ProfileLoading();
    try {
      final profile = await _getProfile();
      value = ProfileLoaded(profile);
    } catch (e) {
      value = ProfileError(e.toString());
    }
  }
}