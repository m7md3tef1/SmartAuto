part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetPlateLoading extends HomeState {}

class GetPlateSuccess extends HomeState {}

class GetPlateFailed extends HomeState {}

class GetContractLoading extends HomeState {}

class GetContractSuccess extends HomeState {}

class GetContractFailed extends HomeState {}
