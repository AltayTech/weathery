import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathery/features/feature_bookmark/presentation/bloc/bookmark_bloc.dart';

import 'core/widgets/main_wrapper.dart';
import 'features/feature_weather/presentation/bloc/home_bloc.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();
  runApp(DevicePreview(
    enabled: kDebugMode,
    builder: (context) {
      return MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => locator<HomeBloc>(),
          ),
          BlocProvider(
            create: (_) => locator<BookmarkBloc>(),
          ),
        ],
        child: MainWrapper(),
      ),
    );
  }
}
