import 'package:flutter/material.dart';
import 'package:practica/features/profile/domain/entities/user_profile.dart';
import 'package:practica/shared/widgets/verified_badge.dart';

/// Nombre, username y bio centrados con Column.
class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key, required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  profile.name,
                  style: textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              if (profile.isVerified) ...[
                const SizedBox(width: 6),
                const VerifiedBadge(size: 22),
              ],
            ],
          ),
          const SizedBox(height: 4),
          Text(
            profile.username,
            style: textTheme.bodyMedium
                ?.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 12),
          Text(
            profile.bio,
            textAlign: TextAlign.center,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}