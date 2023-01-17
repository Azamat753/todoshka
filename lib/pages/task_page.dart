import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../resources/color_res.dart';
import '../utils/widgets.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);
  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  var isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.lightBlue,
      child: SafeArea(
          child: Scaffold(
            appBar: buildAppBarWithBack("Здоровье", context.popRoute),
            body: SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: buildListView(),
                      )),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 300,
                              child: buildTextField(hintText: "Задача"),
                            ),
                            svgIcon("done_icon", color: ColorRes.lightBlue),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          )),
    );
  }

  Widget buildListView() {
    return ListView.separated(
      itemCount: 3,
      separatorBuilder: (context, index) {
        return const SizedBox.shrink();
      },
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
                onTap: () async {
                  isCheck = true;
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  child: CheckboxListTile(
                    title: const Text("dsa",),
                    value: isCheck,
                    activeColor: ColorRes.lightBlue,
                    checkColor: ColorRes.white,
                    onChanged: (newValue) {
                      setState((){
                        isCheck = newValue ?? false;
                      });
                    },
                  ),
                )));
      },
    );
  }
}
