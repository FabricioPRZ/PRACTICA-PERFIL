import 'package:flutter/material.dart';

/// Botones de acción: Seguir y Mensaje.
class ProfileActionButtons extends StatelessWidget {
  const ProfileActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.person_add_alt_1_rounded, size: 18),
              label: const Text('Seguir'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.chat_bubble_outline_rounded,
                size: 18,
                color: colorScheme.primary,
              ),
              label: const Text('Mensaje'),
            ),
          ),
        ],
      ),
    );
  }
}