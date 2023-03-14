import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePageStateNotifier extends StateNotifier<int> {
  HomePageStateNotifier() : super(0);

  void increment() => state++;
}
