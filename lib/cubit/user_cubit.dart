import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:resep_mamah/models/models.dart';
import 'package:resep_mamah/services/services.dart';

part 'user_state.dart';

class UserCubit extends HydratedCubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    BaseResponse<User> result = await UserServices.signIn(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  Future<void> signUp(User user, String password, {File pictureFile}) async {
    BaseResponse<User> result =
        await UserServices.signUp(user, password, pictureFile: pictureFile);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  Future<void> uploadProfilePicture(File pictureFile) async {
    BaseResponse<String> result =
        await UserServices.uploadProfilePicture(pictureFile);

    if (result.value != null) {
      emit(UserLoaded((state as UserLoaded)
          .user
          .copyWith(picturePath: baseURL + "storage/" + result.value)));
    }
  }

  @override
  UserState fromJson(Map<String, dynamic> json) {
    try {
      User user = User.fromJson(json['user']);
      User.token = json['token'];
      return UserLoaded(user);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(UserState state) {
    try {
      if (state is UserLoaded) {
        User user = state.user;
        return <String, dynamic>{'user': user.toJson(), 'token': User.token};
      }
      return null;
    } catch (_) {
      return null;
    }
  }
}
