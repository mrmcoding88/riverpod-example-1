import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_page_notifier.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePageState = ref.watch(homePageNotifierProvider);
    final homePageNotifier = ref.read(homePageNotifierProvider.notifier);

    final titleController = useTextEditingController();
    final titleValue = useValueListenable(titleController).text;

    return Scaffold(
      appBar: AppBar(
        title: Text(homePageState.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: titleController,
          ),
          IconButton(
            onPressed: () => homePageNotifier.changeTitle(titleValue),
            icon: const Icon(Icons.published_with_changes),
          ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '${homePageState.counter}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: homePageNotifier.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
