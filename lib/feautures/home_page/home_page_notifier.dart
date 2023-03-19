import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_riverpod/feautures/home_page/model/home_page_state.dart';

part 'home_page_notifier.g.dart';

/// Create [HomePageNotifier] and [HomePageNotifierProvider] with [riverpod_annotation]
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

/// Create [Notifier] and [Provider] without [riverpod_annotation]
class TestNotifier extends Notifier<HomePageState> {
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

/// Provider for [TestNotifier].
final testNotifierProvide =
    NotifierProvider.autoDispose<TestNotifier, HomePageState>(() {
  return TestNotifier();
});
