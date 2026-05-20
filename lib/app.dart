import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:practica/features/profile/data/datasources/profile_local_datasource.dart';
import 'package:practica/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:practica/features/profile/domain/usecases/get_profile.dart';
import 'package:practica/features/profile/presentation/notifier/profile_notifier.dart';
import 'package:practica/features/profile/presentation/pages/profile_page.dart';
import 'package:practica/shared/theme/theme.dart';
import 'package:practica/shared/theme/util.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ProfileNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = ProfileNotifier(
      GetProfile(
        ProfileRepositoryImpl(
          const ProfileLocalDataSourceImpl(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final TextTheme textTheme = createTextTheme(context, 'Poppins', 'Poppins');
    final MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Perfil de Usuario',
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: ProfilePage(notifier: _notifier),
    );
  }
}