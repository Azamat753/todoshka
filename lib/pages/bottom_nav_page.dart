import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoshka/resources/color_res.dart';
import 'package:todoshka/utils/router.gr.dart';
import 'package:todoshka/utils/widgets.dart';

import '../resources/text_style.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        CategoryRoute(),
        TimetableRoute(),
        HabitRoute(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ColorRes.white,
            type: BottomNavigationBarType.fixed,
            iconSize: 30,
            selectedItemColor: ColorRes.lightBlue,
            unselectedItemColor: ColorRes.gray,
            showUnselectedLabels: true,
            selectedLabelStyle:
                TextStyleBold(color: ColorRes.lightBlue, fontSize: 11.sp),
            unselectedLabelStyle:
                TextStyleBold(color: ColorRes.lightBlue, fontSize: 11.sp),
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                label: "Категории",
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: svgIcon("category_icon",
                      color: tabsRouter.activeIndex == 0
                          ? ColorRes.lightBlue
                          : ColorRes.gray,
                      size: 25.0),
                ),
              ),
              BottomNavigationBarItem(
                label: "Расписание",
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: svgIcon("timetable_icon",
                      color: tabsRouter.activeIndex == 1
                          ? ColorRes.lightBlue
                          : ColorRes.gray,
                      size: 25.0),
                ),
              ),
              BottomNavigationBarItem(
                label: "Привычки",
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: svgIcon("habit_icon",
                      color: tabsRouter.activeIndex == 2
                          ? ColorRes.lightBlue
                          : ColorRes.gray,
                      size: 25.0),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
