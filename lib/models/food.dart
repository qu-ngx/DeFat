class Food {
  String label;
  String name;
  String imagePath;
  double calories;
  double fat;
  double proteins;
  double carbs;
  double fibers;
  String details;

  Food(
      {required this.label,
      required this.name,
      required this.imagePath,
      required this.calories,
      required this.fat,
      required this.proteins,
      required this.carbs,
      required this.fibers,
      required this.details});

  // String get _label => label;
  // String get _name => name;
  // String get _imagePath => imagePath;
  // String get _calories => calories.toString();
  // String get _fat => fat.toString();
  // String get _proteins => proteins.toString();
  // String get _carbs => carbs.toString();
  // String get _fibers => fibers.toString();
}
