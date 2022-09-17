import 'package:flutter/material.dart';
import 'package:kidvento_task/presentation/resources/assets_manager.dart';
import 'package:kidvento_task/presentation/resources/fonts_style_manager.dart';
import 'package:kidvento_task/presentation/resources/size_manager.dart';
import 'package:kidvento_task/presentation/resources/strings_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.backGround), fit: BoxFit.fill)),
      child: Stack(
        children: [
          Center(
            child: Text(
              AppStrings.home,
              style: getBoldTextStyle(),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: AppPadding.p30),
              child: SizedBox(
                  height: AppSizes.s50, width: AppSizes.s50, child: Image.asset(AppImages.appIcon)),
            ),
          )
        ],
      ),
    );
  }
}
