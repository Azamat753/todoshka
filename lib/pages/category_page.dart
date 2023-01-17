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
