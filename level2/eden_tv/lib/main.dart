import 'package:EdenTV/routes/app_routes.dart';
import 'package:EdenTV/theme/theme_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'data/datasource/movie_local_datasource.dart';
import 'data/models/movie_model.dart';
import 'data/models/watchlist_model.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(MovieModelAdapter());
  Hive.registerAdapter(WatchListAdapter());
  await Hive.openBox<MovieModel>(MovieLocalDataSource.movieKey);
  await Hive.openBox<WatchList>(MovieLocalDataSource.watchlistKey);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ThemeHelper().changeTheme('primary');
  runApp(const ProviderScope(child: EdenTVApp()));
}

class EdenTVApp extends StatelessWidget {
  const EdenTVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'EdenTV',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}
