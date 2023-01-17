import 'package:flutter/material.dart';

class HabitPage extends StatefulWidget {
  const HabitPage({Key? key}) : super(key: key);

  @override
  State<HabitPage> createState() => _HabitPageState();
}

class _HabitPageState extends State<HabitPage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Habit",),
    );
  }
}
