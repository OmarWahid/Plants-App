import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plants_orange/modules/login_screen/login_cubit/login_states.dart';
import 'package:plants_orange/shared/component.dart';

import '../../../models/login_model.dart';
import '../../../network/cache_helper.dart';
import '../../../network/dio_helper.dart';
import '../../../shared/constant.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN_URL, data: {
      'email': email,
      'password': password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel!.data!.user!.email);

      CacheHelper.saveData(key: 'token', value: loginModel!.data!.accessToken)
          .then((value) {
        token = loginModel!.data!.accessToken!;
      });
      emit(LoginSuccessState(loginModel!));
    }).onError((error, stackTrace) {
      print(error);
      emit(LoginErrorState(error: error.toString()));
    });
  }

  void userRegister({
    required String fName,
    required String lName,
    required String email,
    required String password,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER_URL,
      data: {
        "firstName": fName,
        "lastName": lName,
        "email": email,
        "password": password,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(RegisterSuccessState(loginModel!));
    }).catchError((onError) {
      emit(RegisterErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  // void GetGoogleToken({
  //   String? token_id,
  // }) {
  //   emit(LoadingGoogleToken());
  //   DioHelper.getData(
  //       url: '/api/v1/auth/google',
  //       query: {'access_token': token_id}).then((value) {
  //     GoogleModel googleModel = GoogleModel.fromJson(value.data);
  //     print(googleModel.user!.firstName);
  //
  //     emit(SuccessGoogleToken(googleModel));
  //   }).onError((error, stackTrace) {
  //     print(error);
  //
  //     emit(ErrorGoogleToken());
  //   });
  // }
  //

  Future signIn() async {
    await GoogleSign.login().then((value) {
      emit(SuccessGoogleToken());
    }).onError((error, stackTrace) {
      print(error);
      emit(ErrorGoogleToken());
    });
  }

  bool isLogin = true;

  void pressLogin() {
    isLogin = true;
    emit(pressLoginState());
  }

  void pressRegister() {
    isLogin = false;
    emit(pressSignUpState());
  }

  bool isPass = true;
  IconData icon = Icons.visibility_outlined;

  void changeVisibilityPass() {
    isPass = !isPass;
    icon = isPass ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePassVisibilityState());
  }
}

class GoogleSign {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
}
