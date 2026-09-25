class StatisticModel {
  final String value;
  final String label;
  final String suffix;

  const StatisticModel({
    required this.value,
    required this.label,
    this.suffix = '',
  });
}
