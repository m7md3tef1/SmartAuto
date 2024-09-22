part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}
//get_plate
class GetPlateLoading extends HomeState {}

class GetPlateSuccess extends HomeState {}

class GetPlateFailed extends HomeState {}
//get_cost
class GetCostLoading extends HomeState {}

class GetCostSuccess extends HomeState {}

class GetCostFailed extends HomeState {}
//get_contract
class GetContractLoading extends HomeState {}

class GetContractSuccess extends HomeState {}

class GetContractFailed extends HomeState {}

//get_place
class GetPlaceLoading extends HomeState {}

class GetPlaceSuccess extends HomeState {}

class GetPlaceFailed extends HomeState {}
