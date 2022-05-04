import 'package:equatable/equatable.dart';

class Iteam extends Equatable {
  final String name;
  final List<String> type;
  const Iteam({required this.name, required this.type});

  @override
  List<Object?> get props => [name, type];
}
