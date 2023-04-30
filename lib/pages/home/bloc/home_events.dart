abstract class HomeEvent {
  const HomeEvent();
}

class HomeDotIndicatorEvent extends HomeEvent {
  final int index;
  const HomeDotIndicatorEvent(this.index);
}
