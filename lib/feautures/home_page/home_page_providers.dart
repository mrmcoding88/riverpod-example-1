import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_riverpod/feautures/home_page/home_page_state_notifier.dart';

part 'home_page_providers.g.dart';

@riverpod
homePage(HomePageRef ref) => HomePageStateNotifier();
