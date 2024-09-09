// lib/data/models/salary_model.dart
class SalaryModel {
  final int id;
  final double baseSalary; // Оклад
  final double bonusRate; // Ставка премии
  final int year; // Год выплаты
  final int month; // Месяц выплаты

  SalaryModel({
    required this.id,
    required this.baseSalary,
    required this.bonusRate,
    required this.year,
    required this.month,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'baseSalary': baseSalary,
      'bonusRate': bonusRate,
      'year': year,
      'month': month,
    };
  }

  factory SalaryModel.fromMap(Map<String, dynamic> map) {
    return SalaryModel(
      id: map['id'],
      baseSalary: map['baseSalary'],
      bonusRate: map['bonusRate'],
      year: map['year'],
      month: map['month'],
    );
  }
}
