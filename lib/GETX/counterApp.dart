import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

// Controller using GetX
class CounterController extends GetxController {
  // reactive integer
  final count = 0.obs;

  void increment() => count.value++;
  void decrement() {
    if (count.value > 0) count.value--;
  }

  void reset() => count.value = 0;
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Put controller into GetX dependency system.
    // Get.put creates and stores the controller so it's accessible via Get.find()
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Counter'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset',
            onPressed: controller.reset,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),

            // Reactive widget: updates automatically when count changes
            Obx(
              () => Text(
                '${controller.count.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            const SizedBox(height: 24),

            // Buttons to increment / decrement
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: controller.decrement,
                  icon: const Icon(Icons.remove),
                  label: const Text('Decrease'),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: controller.increment,
                  icon: const Icon(Icons.add),
                  label: const Text('Increase'),
                ),
              ],
            ),
          ],
        ),
      ),

      // Floating action button also increments
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
