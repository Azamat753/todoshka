import 'package:flutter/material.dart';
import 'package:todoshka/utils/widgets.dart';

import '../resources/color_res.dart';
import '../resources/text_style.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({Key? key}) : super(key: key);

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  var isCheck = false;
  var boxWidth =150;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.lightBlue,
      child: Scaffold(
        appBar: buildAppBar("Здоровье"),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Stack(
                children: [
                  Column(
                    children: [
                      buildButton(
                          context: context, text: "Понедельник", onTap: () {}),
                      const SizedBox(
                        height: 15,
                      ),
                      buildButton(
                          context: context, text: "Вторник", onTap: () {}),
                      const SizedBox(
                        height: 15,
                      ),
                      buildButton(
                          context: context, text: "Среда", onTap: () {}),
                      const SizedBox(
                        height: 15,
                      ),
                      buildButton(
                          context: context, text: "Четверг", onTap: () {}),
                      const SizedBox(
                        height: 15,
                      ),
                      buildButton(
                          context: context, text: "Пятница", onTap: () {}),
                      const SizedBox(
                        height: 15,
                      ),
                      buildButton(
                          context: context, text: "Суббота", onTap: () {}),
                      const SizedBox(
                        height: 15,
                      ),
                      buildButton(
                          context: context, text: "Воскресенье", onTap: () {}),
                    ],
                  ),
                  Positioned(
                    right: 1,
                    bottom: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: FloatingActionButton(
                        backgroundColor: ColorRes.white,
                        onPressed: () {
                          _showCreateTimetableDialog(context);
                        },
                        child: Icon(
                          Icons.add,
                          color: ColorRes.lightBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  _showCreateTimetableDialog(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        isScrollControlled: true,
        context: context,
        builder: ((context) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          elevation: 5,
                          child: Center(
                            child: Text(
                              "В расписание",
                              style: TextStyleRegular(
                                  fontSize: 16, color: ColorRes.lightBlue),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTextField(hintText: "Что бы вы хотели сделать"),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 180,
                            child: CheckboxListTile(
                              title: Text(
                                "Понедельник",
                                style: TextStyleRegular(
                                    color: ColorRes.gray, fontSize: 14),
                              ),
                              value: isCheck,
                              activeColor: ColorRes.lightBlue,
                              checkColor: ColorRes.white,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (newValue) {
                                setState(() {
                                  isCheck = newValue ?? false;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: CheckboxListTile(
                              title: Text(
                                "Вторник",
                                style: TextStyleRegular(
                                    color: ColorRes.gray, fontSize: 14),
                              ),
                              value: isCheck,
                              activeColor: ColorRes.lightBlue,
                              checkColor: ColorRes.white,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (newValue) {
                                setState(() {
                                  isCheck = newValue ?? false;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: CheckboxListTile(
                              title: Text(
                                "Среда",
                                style: TextStyleRegular(
                                    color: ColorRes.gray, fontSize: 14),
                              ),
                              value: isCheck,
                              activeColor: ColorRes.lightBlue,
                              controlAffinity: ListTileControlAffinity.leading,
                              checkColor: ColorRes.white,
                              onChanged: (newValue) {
                                setState(() {
                                  isCheck = newValue ?? false;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: CheckboxListTile(
                              title: Text(
                                "Четверг",
                                style: TextStyleRegular(
                                    color: ColorRes.gray, fontSize: 14),
                              ),
                              value: isCheck,
                              activeColor: ColorRes.lightBlue,
                              checkColor: ColorRes.white,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (newValue) {
                                setState(() {
                                  isCheck = newValue ?? false;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: CheckboxListTile(
                              title: Text(
                                "Пятница",
                                style: TextStyleRegular(
                                    color: ColorRes.gray, fontSize: 14),
                              ),
                              value: isCheck,
                              activeColor: ColorRes.lightBlue,
                              checkColor: ColorRes.white,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (newValue) {
                                setState(() {
                                  isCheck = newValue ?? false;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: CheckboxListTile(
                              title: Text(
                                "Суббота",
                                style: TextStyleRegular(
                                    color: ColorRes.gray, fontSize: 14),
                              ),
                              value: isCheck,
                              activeColor: ColorRes.lightBlue,
                              controlAffinity: ListTileControlAffinity.leading,
                              checkColor: ColorRes.white,
                              onChanged: (newValue) {
                                setState(() {
                                  isCheck = newValue ?? false;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: CheckboxListTile(
                              title: Text(
                                "Воскресенье",
                                style: TextStyleRegular(
                                    color: ColorRes.gray, fontSize: 14),
                              ),
                              value: isCheck,
                              activeColor: ColorRes.lightBlue,
                              controlAffinity: ListTileControlAffinity.leading,
                              checkColor: ColorRes.white,
                              onChanged: (newValue) {
                                setState(() {
                                  isCheck = newValue ?? false;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      color: ColorRes.lightBlue,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: svgIcon("image_icon"),
                          label: Text(
                            "Начинается",
                            style: TextStyleRegular(
                                fontSize: 14, color: ColorRes.white),
                          )),
                    ),
                  const  SizedBox(height: 10,),
                    Card(
                      color: ColorRes.lightBlue,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: svgIcon("image_icon"),
                          label: Text(
                            "Заканчивается",
                            style: TextStyleRegular(
                                fontSize: 14, color: ColorRes.white),
                          )),
                    ),
                    buildButton(
                        context: context, text: "Создать", onTap: () => {})
                  ],
                ),
              ));
        }));
  }
}
