abstract class ApplicationEvent {
  const ApplicationEvent();
}

class TriggerPageEvent extends ApplicationEvent {
  final int index;
  const TriggerPageEvent(this.index) : super();
}
