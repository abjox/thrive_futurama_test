import 'package:flutter/material.dart';

mixin AppPopUpsMixin {
  void showErrorSnackBar({
    required GlobalKey<ScaffoldState> scaffoldKey,
    required String message,
    required Function completion,
  }) {
    // ScaffoldFeatureController controller;
    // controller = scaffoldKey.currentState.showSnackBar(SnackBar(
    //   backgroundColor: AppColors.transparent,
    //   elevation: 0,
    //   content: GestureDetector(
    //     onTap: () {
    //       controller?.close();
    //     },
    //     child: Container(
    //       padding: const EdgeInsets.all(8),
    //       decoration: BoxDecoration(
    //         color: AppColors.harleyDavidsonOrange,
    //         borderRadius: const BorderRadius.all(Radius.circular(8)),
    //       ),
    //       width: double.maxFinite,
    //       child: Text(message,
    //           style: AppTextStyles.regularTextStyle.copyWith(
    //             fontSize: 16,
    //             color: AppColors.white,
    //           )),
    //     ),
    //   ),
    //   duration: const Duration(seconds: 5),
    // ));

    // Future.delayed(const Duration(seconds: 5), () {
    //   controller = null;
    //   completion();
    // });
  }
}
