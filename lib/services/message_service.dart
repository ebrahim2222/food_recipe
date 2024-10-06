import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_test_app/contract/local/i_message_service.dart';
import 'package:recipe_test_app/utils/values/color_manager.dart';

@Singleton(as: IMessageService)
class MessageService implements IMessageService {
  @override
  void noInternetConnectionAlert() {
    Get.snackbar(
      'no internet',
      'please check your internet',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
    );
  }

  @override
  void showSuccessSnackBarAlert<T>({required String? message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: Text(
        message ?? "",
        style: Theme.of(Get.context!)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.white),
      ),
      duration: const Duration(milliseconds: 2000),
      backgroundColor: ColorManager.primary,
    ));
  }

  @override
  void snackBarActionAlert<T>(
      {required String? message, required Function() onButtonPressed}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: Text(
        message ?? "",
        style: Theme.of(Get.context!)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.white),
      ),
      duration: const Duration(milliseconds: 2000),
      backgroundColor: Theme.of(Get.context!).primaryColor,
    ));
  }

  @override
  void snackBarAlert<T>({required String? message, Color color = Colors.red}) {
    // TODO: implement snackBarAlert
  }
}
