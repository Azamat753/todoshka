
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/router.gr.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await $initGetIt(locator);

@module
abstract class AppModule{
  // @preResolve
  // Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @injectable
  AppRouter get appRouter => AppRouter();

}