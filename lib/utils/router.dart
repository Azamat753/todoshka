import 'package:auto_route/auto_route.dart';
import 'package:todoshka/pages/bottom_nav_page.dart';
import 'package:todoshka/pages/category_page.dart';
import 'package:todoshka/pages/habit_page.dart';
import 'package:todoshka/pages/task_page.dart';
import 'package:todoshka/pages/timetable_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      page: BottomNavPage,initial: true,
      children: [
        AutoRoute(page: CategoryPage, initial: true),
        AutoRoute(page: TimetablePage),
        AutoRoute(page: HabitPage),
      ],
    ),
    AutoRoute(page: TaskPage)
  ],
)
class $AppRouter {}
