import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
class PuzzleContainer extends Equatable {
  const PuzzleContainer(this.data, this.freePosition, this.currentPosition);

  final int data;
  final Offset freePosition;
  final Offset currentPosition;
  
  @override
  List<Object?> get props => throw UnimplementedError();
}
