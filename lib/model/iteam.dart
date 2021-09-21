import 'package:equatable/equatable.dart';

class Iteam extends Equatable {
  final name;
  final List<String> type;
  Iteam({this.name, required this.type});

  @override
  List<Object?> get props => [name, type];
}
