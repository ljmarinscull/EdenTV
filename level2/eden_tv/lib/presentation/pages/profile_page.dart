import 'package:EdenTV/presentation/pages/login_screen.dart';
import 'package:EdenTV/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/size_utils.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final username = ref.watch(authNotifierProvider)?.user?.email ?? "";

    return SafeArea(
        child: Scaffold(
      backgroundColor: appTheme.gray90001,
      appBar: CustomAppBar(
        height: getVerticalSize(53),
        title: AppbarTitle(text: "Profile", margin: getMargin(left: 16)),
      ),
      body: SizedBox(
        width: mediaQueryData.size.width,
        child: SingleChildScrollView(
          padding: getPadding(
            top: 1,
          ),
          child: Padding(
            padding: getPadding(
              bottom: 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(username, style: CustomTextStyles.headlineSmallBold)
                ]),
                CustomElevatedButton(
                  height: getVerticalSize(56),
                  text: "Log Out",
                  margin: getMargin(
                    left: 16,
                    top: 56,
                    right: 16,
                  ),
                  onTap: () {
                    _logoutConfirmation();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  _logoutConfirmation() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: appTheme.gray90001,
              title: const Text(
                "Are you sure you want logout?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: <Widget>[
                const SizedBox(width: 16),
                InkWell(
                  onTap: () => Navigator.of(context).pop(false),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Cancel",
                        style: CustomTextStyles.bodySmallOnPrimary),
                  ),
                ),
                const SizedBox(width: 8.0),
                InkWell(
                  onTap: () {
                    ref.read(authNotifierProvider.notifier).logOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const LoginScreen(), // Destination
                      ),
                      (route) => false,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Yes, I want",
                      style: CustomTextStyles.bodySmallOnPrimary,
                    ),
                  ),
                ),
              ],
            ));
  }
}
