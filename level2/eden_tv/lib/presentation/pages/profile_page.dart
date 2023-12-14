import 'package:flutter/material.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray90001,
            appBar: CustomAppBar(
                height: getVerticalSize(53),
                title:
                    AppbarTitle(text: "Profile", margin: getMargin(left: 16)),
                actions: [
                  AppbarImage(
                      svgPath: ImageConstant.imgTrophy,
                      margin:
                          getMargin(left: 16, top: 16, right: 16, bottom: 16)),
                  AppbarImage(
                      svgPath: ImageConstant.imgLock,
                      margin:
                          getMargin(left: 16, top: 16, right: 32, bottom: 16))
                ]),
            body: Container()));
  }
}
