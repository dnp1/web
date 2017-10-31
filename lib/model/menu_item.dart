class MenuItem {
  final String domClass;
  final String route;
  final String label;
  final MenuItemShowCondition showCondition;

  MenuItem(this.domClass, this.route, this.label, this.showCondition);

  double getMenuWidth() {
    final border = .06;
    final padding = 1;
    final fontSize = 1.3;
    final fontRatio = .72;
    final charWidth = fontSize * fontRatio;
    final textWidth = label.length * charWidth;
    return textWidth + padding + border;
  }
}

enum MenuItemShowCondition {
  always,
  authenticated,
  unauthenticated,
}