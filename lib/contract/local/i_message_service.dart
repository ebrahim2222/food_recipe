import 'package:flutter/material.dart';

abstract class IMessageService {
  void snackBarAlert<T>({required String? message, Color color = Colors.red});

  void showSuccessSnackBarAlert<T>({required String? message});

  void noInternetConnectionAlert();

  void snackBarActionAlert<T>({
    required String? message,
    required Function() onButtonPressed,
  });
}
