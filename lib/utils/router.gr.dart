// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../pages/bottom_nav_page.dart' as _i1;
import '../pages/category_page.dart' as _i3;
import '../pages/habit_page.dart' as _i5;
import '../pages/task_page.dart' as _i2;
import '../pages/timetable_page.dart' as _i4;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    BottomNavRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.BottomNavPage(),
      );
    },
    TaskRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.TaskPage(),
      );
    },
    CategoryRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.CategoryPage(),
      );
    },
    TimetableRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.TimetablePage(),
      );
    },
    HabitRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.HabitPage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          BottomNavRoute.name,
          path: '/',
          children: [
            _i6.RouteConfig(
              CategoryRoute.name,
              path: '',
              parent: BottomNavRoute.name,
            ),
            _i6.RouteConfig(
              TimetableRoute.name,
              path: 'timetable-page',
              parent: BottomNavRoute.name,
            ),
            _i6.RouteConfig(
              HabitRoute.name,
              path: 'habit-page',
              parent: BottomNavRoute.name,
            ),
          ],
        ),
        _i6.RouteConfig(
          TaskRoute.name,
          path: '/task-page',
        ),
      ];
}

/// generated route for
/// [_i1.BottomNavPage]
class BottomNavRoute extends _i6.PageRouteInfo<void> {
  const BottomNavRoute({List<_i6.PageRouteInfo>? children})
      : super(
          BottomNavRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'BottomNavRoute';
}

/// generated route for
/// [_i2.TaskPage]
class TaskRoute extends _i6.PageRouteInfo<void> {
  const TaskRoute()
      : super(
          TaskRoute.name,
          path: '/task-page',
        );

  static const String name = 'TaskRoute';
}

/// generated route for
/// [_i3.CategoryPage]
class CategoryRoute extends _i6.PageRouteInfo<void> {
  const CategoryRoute()
      : super(
          CategoryRoute.name,
          path: '',
        );

  static const String name = 'CategoryRoute';
}

/// generated route for
/// [_i4.TimetablePage]
class TimetableRoute extends _i6.PageRouteInfo<void> {
  const TimetableRoute()
      : super(
          TimetableRoute.name,
          path: 'timetable-page',
        );

  static const String name = 'TimetableRoute';
}

/// generated route for
/// [_i5.HabitPage]
class HabitRoute extends _i6.PageRouteInfo<void> {
  const HabitRoute()
      : super(
          HabitRoute.name,
          path: 'habit-page',
        );

  static const String name = 'HabitRoute';
}
