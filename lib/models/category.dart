class Category {
  Category({required this.title, this.isPressed = false});
  String title;
  bool isPressed;

  void active() {
    isPressed = true;
  }

  void inActive() {
    isPressed = false;
  }
}
