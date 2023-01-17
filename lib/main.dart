import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loggy/loggy.dart';
import 'package:todoshka/resources/color_res.dart';
import 'package:todoshka/utils/general_bloc_observable.dart';
import 'package:todoshka/utils/router.gr.dart';
import 'package:todoshka/utils/router_observer.dart';
import 'di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  // final database = await $FloorAppDataBase
  //     .databaseBuilder('flutter_database.db')
  //     .build();
  // final dao = database.taskDao;

  await ScreenUtil.ensureScreenSize();
  Loggy.initLoggy(logPrinter: const PrettyPrinter());
  Bloc.observer = GeneralBlocObservable();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final _appRouter = locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenUtilInit(builder: ((context,child){
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(navigatorObservers: () => [RouterObserver()],),
          theme: ThemeData(
            colorScheme:
            ThemeData().colorScheme.copyWith(primary: ColorRes.white),
          ),
        );
      })),
    );
  }
}

