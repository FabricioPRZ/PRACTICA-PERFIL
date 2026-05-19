import 'package:flutter/material.dart';
import 'package:practica/features/profile/domain/entities/user_profile.dart';
import 'package:practica/shared/widgets/profile_stat_item.dart';

/// Tres estadísticas distribuidas con Row + Flexible.
class ProfileStatsRow extends StatelessWidget {
  const ProfileStatsRow({super.key, required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProfileStatItem(label: 'Posts', value: profile.posts),
          _VerticalDivider(color: colorScheme.outlineVariant),
          ProfileStatItem(label: 'Seguidores', value: profile.followers),
          _VerticalDivider(color: colorScheme.outlineVariant),
          ProfileStatItem(label: 'Seguidos', value: profile.following),
        ],
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) =>
      Container(width: 1, height: 36, color: color);
}