import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_riverpod/feautures/home_page/model/home_page_state.dart';

part 'home_page_notifier.g.dart';

@riverpod
class HomePageNotifier extends _$HomePageNotifier {
  @override
  HomePageState build() {
    return HomePageState.initial;
  }

  void increment() {
    state = state.copyWith(counter: state.counter + 1);
  }

  void changeTitle(String newTitle) {
    state = state.copyWith(title: newTitle);
  }
}
