part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {}

final class NavigationInitial extends NavigationState {}

final class NavigationChanged extends NavigationState {
  final int index;
  NavigationChanged({required this.index});
}
