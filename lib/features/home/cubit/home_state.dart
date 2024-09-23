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

//get_customer
class GetCustomerLoading extends HomeState {}

class GetCustomerSuccess extends HomeState {}

class GetCustomerFailed extends HomeState {}

//get_employee
class GetEmployeeLoading extends HomeState {}

class GetEmployeeSuccess extends HomeState {}

class GetEmployeeFailed extends HomeState {}

//get_max_key
class GetMaxKeyLoading extends HomeState {}

class GetMaxKeySuccess extends HomeState {}

class GetMaxKeyFailed extends HomeState {}

//add_car_rent
class AddCarRentLoading extends HomeState {}

class AddCarRentSuccess extends HomeState {}

class AddCarRentFailed extends HomeState {}
