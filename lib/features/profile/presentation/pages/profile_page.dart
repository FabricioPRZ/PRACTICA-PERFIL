import 'package:flutter/material.dart';
import 'package:practica/features/profile/domain/entities/user_profile.dart';
import 'package:practica/features/profile/presentation/notifier/profile_notifier.dart';
import 'package:practica/features/profile/presentation/widgets/profile_banner.dart';
import 'package:practica/features/profile/presentation/widgets/profile_info.dart';
import 'package:practica/features/profile/presentation/widgets/profile_stats_row.dart';
import 'package:practica/features/profile/presentation/widgets/profile_action_buttons.dart';

/// Página de perfil. Escucha al ProfileNotifier y delega
/// el renderizado a widgets privados de la feature.
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.notifier});

  final ProfileNotifier notifier;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    widget.notifier.addListener(_onStateChanged);
  }

  @override
  void dispose() {
    widget.notifier.removeListener(_onStateChanged);
    super.dispose();
  }

  void _onStateChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: switch (widget.notifier.value) {
        ProfileLoading() => const Center(child: CircularProgressIndicator()),
        ProfileError(:final message) => Center(child: Text(message)),
        ProfileLoaded(:final profile) => _ProfileBody(profile: profile),
      },
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody({required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileBanner(
              profile: profile,
              bannerHeight: isLandscape ? 130 : 180,
              avatarRadius: isLandscape ? 44 : 54,
            ),
            const SizedBox(height: 56),
            ProfileInfo(profile: profile),
            const SizedBox(height: 24),
            ProfileStatsRow(profile: profile),
            const SizedBox(height: 24),
            const ProfileActionButtons(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}