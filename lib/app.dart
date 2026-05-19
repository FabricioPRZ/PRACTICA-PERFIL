import 'package:flutter/material.dart';
import 'package:practica/features/profile/data/datasources/profile_local_datasource.dart';
import 'package:practica/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:practica/features/profile/domain/usecases/get_profile.dart';
import 'package:practica/features/profile/presentation/notifier/profile_notifier.dart';
import 'package:practica/features/profile/presentation/pages/profile_page.dart';
import 'package:practica/shared/theme/theme.dart';
import 'package:practica/shared/theme/util.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final TextTheme textTheme = createTextTheme(context, 'Poppins', 'Poppins');
    final MaterialTheme theme = MaterialTheme(textTheme);

    // Inyección manual de dependencias
    // datasource → repository → use case → notifier → page
    final notifier = ProfileNotifier(
      GetProfile(
        ProfileRepositoryImpl(
          const ProfileLocalDataSourceImpl(),
        ),
      ),
    );

    return MaterialApp(
      title: 'Perfil de Usuario',
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: ProfilePage(notifier: notifier),
    );
  }
}