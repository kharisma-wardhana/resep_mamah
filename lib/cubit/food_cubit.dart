import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resep_mamah/models/models.dart';
import 'package:resep_mamah/services/services.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getFoods() async {
    BaseResponse<List<Food>> result = await FoodServices.getFoods();

    print("Check Value ==========> ${result.value}");

    if (result.value != null) {
      emit(FoodLoaded(result.value));
    } else {
      emit(FoodLoadingFailed(result.message));
    }
  }
}
