import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/theme_helper.dart';
import '../../routes/app_routes.dart';
import '../../theme/custom_text_style.dart';
import '../providers/auth_provider.dart';
import '../providers/movie_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  final ValueNotifier<bool> _loading = ValueNotifier<bool>(true);

  @override
  void initState() {
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {

       await _requestMovies();

       _init();
    });
    super.initState();
  }

  _init(){
    final result = ref.watch(requestMoviesNotifierProvider);
    if (result != null) {
      _navigationToHome();
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: appTheme.gray90001,
          title: const Text('Error'),
          content: const Text('An error has occurred. Check your internet connection or try again later.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => exit(0),
              child: Text('Got it', style: CustomTextStyles.bodySmallOnPrimary),
            ),
          ],
        ),
      );
    }
  }

  _navigationToHome(){
    final isUserLoggedIn = ref.watch(authNotifierProvider.notifier).isUserLoggedIn();
    if(isUserLoggedIn){
      Navigator.pushReplacementNamed(
          context, AppRoutes.dashboardContainerPage);
    } else {
      Navigator.pushReplacementNamed(
          context, AppRoutes.loginScreen);
    }
  }
  _requestMovies() async {
    await Future.delayed(const Duration(seconds: 2));
    _loading.value = true;
    await ref.read(requestMoviesNotifierProvider.notifier).requestMovies();
    _loading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: appTheme.gray90001,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
            color: appTheme.gray90001,
            gradient: LinearGradient(
              begin: const Alignment(0, 0),
              end: const Alignment(0, 1),
              colors: [
                theme.colorScheme.secondaryContainer,
                appTheme.gray900,
              ],
            ),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                ImageConstant.imgSplashscreen,
              ),
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              left: 50,
              right: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: ValueListenableBuilder<bool>(
                      valueListenable: _loading,
                      builder: (context, loading, child) {
                        return Visibility(
                            visible: loading,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              semanticsLabel: 'Circular progress indicator',
                            ));
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
