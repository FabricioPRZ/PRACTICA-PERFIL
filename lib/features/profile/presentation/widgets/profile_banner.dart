import 'package:flutter/material.dart';
import 'package:practica/features/profile/domain/entities/user_profile.dart';
import 'package:practica/shared/widgets/verified_badge.dart';

/// Banner con avatar superpuesto y badge "Pro".
class ProfileBanner extends StatelessWidget {
  const ProfileBanner({
    super.key,
    required this.profile,
    required this.bannerHeight,
    required this.avatarRadius,
  });

  final UserProfile profile;
  final double bannerHeight;
  final double avatarRadius;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Imagen del banner
        SizedBox(
          height: bannerHeight,
          width: double.infinity,
          child: Image.network(
            profile.bannerUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                ColoredBox(color: colorScheme.primaryContainer),
          ),
        ),

        // Gradiente oscuro
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.4),
                ],
              ),
            ),
          ),
        ),

        // Badge superpuesto (Stack + Positioned)
        const Positioned(
          top: 12,
          right: 12,
          child: _ProBadge(),
        ),

        // CircleAvatar sobresaliendo del banner (Stack + Positioned)
        Positioned(
          bottom: -(avatarRadius + 6),
          left: 0,
          right: 0,
          child: Center(
            child: _ProfileAvatar(
              avatarUrl: profile.avatarUrl,
              radius: avatarRadius,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProBadge extends StatelessWidget {
  const _ProBadge();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded, size: 14, color: colorScheme.primary),
          const SizedBox(width: 4),
          Text(
            'Pro',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({required this.avatarUrl, required this.radius});

  final String avatarUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: colorScheme.surface, width: 4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(avatarUrl),
        backgroundColor: colorScheme.primaryContainer,
      ),
    );
  }
}