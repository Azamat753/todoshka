import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todoshka/resources/color_res.dart';
import 'package:todoshka/resources/text_style.dart';
import 'package:todoshka/utils/router.gr.dart';

import '../utils/widgets.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.lightBlue,
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppBar("Категория"),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: buildListView(),
                      )),
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
                          _showCreateCategoryDialog(context);
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

  void showIconDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => Dialog(
            child: SizedBox(
                height: 300,
                child: Center(child: Expanded(child: buildIconListView())))));
  }

  _showCreateCategoryDialog(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        isScrollControlled: true,
        context: context,
        builder: ((context) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
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
                              "Новая категория",
                              style: TextStyleRegular(
                                  fontSize: 16, color: ColorRes.lightBlue),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTextField(hintText: "Название категории"),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      color: ColorRes.lightBlue,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: svgIcon("image_icon"),
                          label: Text(
                            "Иконка",
                            style: TextStyleRegular(
                                fontSize: 14, color: ColorRes.white),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildButton(
                        context: context,
                        text: "Создать",
                        onTap: () => {showIconDialog(context)})
                  ],
                ),
              ));
        }));
  }

  Widget buildIconListView() {
    return GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 50,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, childAspectRatio: 1),
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            child: Center(
                child: Text(
              "😏",
              style: TextStyleRegular(fontSize: 24, color: ColorRes.white),
            )),
          );
        });
  }

  Widget buildListView() {
    return GridView.builder(
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: ()=>{
            context.pushRoute(const TaskRoute())
          },
          child: Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                Positioned(
                  right: 1,
                  top: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "❤️",
                      style: TextStyleRegular(
                          color: ColorRes.lightBlue, fontSize: 16.0),
                    ),
                  ),
                ),
                Positioned(
                  right: 1,
                  left: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Column(
                      children: [
                        Text(
                          "0",
                          style: TextStyleRegular(
                              color: ColorRes.lightBlue, fontSize: 24.0),
                        ),
                        Text(
                          "Здоровье",
                          style: TextStyleRegular(
                              color: ColorRes.lightBlue, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}


class ShowBottomSheet extends StatefulWidget {
  const ShowBottomSheet({super.key});

  @override
  State<ShowBottomSheet> createState() => _ShowBottomSheet();
}

class _ShowBottomSheet extends State<ShowBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: IntrinsicHeight(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            newCategory(),
            fieldCategoryName(),
            openEmojiDialog(),
            buttonDialog("Создать", () {
            }),
          ],
        ),
      ),
    );
  }
}


Widget buttonDialog(String text, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 14.0),
      ),
    ),
  );
}

Widget newCategory() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: IntrinsicHeight(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: const Text(
          "Новая категория",
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
      ),
    ),
  );
}

Widget fieldCategoryName() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 44, vertical: 26),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blue),
                borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blue),
                borderRadius: BorderRadius.circular(16)),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.red),
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: "Название категории"),
      ),
    ),
  );
}

Widget openEmojiDialog() {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 108,
    ),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blue),
                borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blue),
                borderRadius: BorderRadius.circular(16)),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.red),
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: "Иконка"),
      ),
    ),
  );
}

Widget categoryContainer(BuildContext context) {
  return IntrinsicHeight(
    child: Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "O",
                ),
              )),
          Padding(
            padding:
            const EdgeInsets.only(left: 72, right: 72, top: 28, bottom: 6),
            child: Text(
              "0",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Здоровье",
                style: TextStyle(fontSize: 10, color: Colors.blue),
              ),
            ),
          )
        ],
      ),
      color: Colors.white,
    ),
  );
}

