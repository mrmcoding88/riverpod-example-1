import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_page_notifier.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const TitleWidget(),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: titleController,
          ),
          IconButton(
            onPressed: () {
              ref
                  .read(homePageNotifierProvider.notifier)
                  .changeTitle(titleController.text);
              titleController.clear();
            },
            icon: const Icon(Icons.published_with_changes),
          ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            'You have pushed the button this many times:',
          ),
          const CounterWidget(),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(homePageNotifierProvider.notifier).increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final counter =
          ref.watch(homePageNotifierProvider.select((value) => value.counter));
      return Text(
        '$counter',
        style: Theme.of(context).textTheme.headlineMedium,
      );
    });
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final title =
          ref.watch(homePageNotifierProvider.select((value) => value.title));
      return Text(title);
    });
  }
}
