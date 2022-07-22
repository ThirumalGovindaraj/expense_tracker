/*import 'package:equatable/equatable.dart';

/// Denomination
class Denomination extends Equatable {
  double amount;
  String description;

  Denomination({this.amount=0.0, this.description=""});

  @override
  List<Object> get props => [amount, description];

  factory Denomination.fromJson(Map<String, dynamic> data) {
    double amount = double.parse((data['amount'] ?? 0.0).toString());
    String description = data['description'] ?? "";

    return Denomination(amount: amount, description: description);
  }
}*/
