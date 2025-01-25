import 'package:equatable/equatable.dart';

abstract class PaginationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchItemsEvent extends PaginationEvent {}