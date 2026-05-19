import 'package:flutter/material.dart';

/// Ícono de verificación reutilizable con tamaño configurable.
class VerifiedBadge extends StatelessWidget {
  const VerifiedBadge({super.key, this.size = 20});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.verified_rounded,
      color: Theme.of(context).colorScheme.primary,
      size: size,
    );
  }
}