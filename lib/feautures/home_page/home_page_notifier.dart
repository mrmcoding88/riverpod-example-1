import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_notifier.g.dart';

@riverpod
class HomePageNotifier extends _$HomePageNotifier {
  @override
  int build() {
    return 0;
  }

  void increment() => state++;
}
