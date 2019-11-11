abstract class NavigationState {
  const NavigationState();
}

class ActivityPageState extends NavigationState {
  final int index = 0;
}

class DuePageState extends NavigationState {
  final int index = 1;
}

class InboxPageState extends NavigationState {
  final int index = 2;
}

class UpdatePageState extends NavigationState {
  final int index = 3;
}

class ProfilePageState extends NavigationState {
  final int index = 4;
}
