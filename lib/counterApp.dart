import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_statemanagement/counterController.dart';

class CounterApp extends StatelessWidget {
  final CounterController counter = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Theme.of(context).brightness == Brightness.light
                      ? Get.changeTheme(ThemeData.dark())
                      : Get.changeTheme(ThemeData.light());
                },
                icon: const Icon(Icons.light_mode)),
            const SizedBox(
              width: 10,
            )
          ],
          title: const Text("Counter App"),
          centerTitle: true,
        ),
        body: Obx(
          () => Center(
              child: Text(
            counter.count.toString(),
            style: TextStyle(fontSize: 25),
          )),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {
                counter.increment();
                // Get.changeTheme(ThemeData.light());
              },
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                counter.decrement();
                // Get.changeTheme(ThemeData.dark());
              },
              child: const Icon(Icons.remove),
            )
          ],
        ));
  }
}
