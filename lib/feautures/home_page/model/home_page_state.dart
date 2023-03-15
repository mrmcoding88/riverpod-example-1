class HomePageState {
  final String title;
  final int counter;
  const HomePageState({required this.title, required this.counter});

  HomePageState copyWith({String? title, int? counter}) {
    return HomePageState(
        title: title ?? this.title, counter: counter ?? this.counter);
  }

  static const initial = HomePageState(
    title: 'testing',
    counter: 0,
  );
}
