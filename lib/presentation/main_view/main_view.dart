import 'package:flutter/material.dart';
import 'package:kidvento_task/presentation/events/events.dart';
import 'package:kidvento_task/presentation/find/find.dart';
import 'package:kidvento_task/presentation/home/home.dart';
import 'package:kidvento_task/presentation/profile/profile.dart';
import 'package:kidvento_task/presentation/resources/assets_manager.dart';
import 'package:kidvento_task/presentation/resources/colors_manager.dart';
import 'package:kidvento_task/presentation/resources/fonts_style_manager.dart';
import 'package:kidvento_task/presentation/resources/size_manager.dart';
import 'package:kidvento_task/presentation/resources/strings_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    const HomeView(),
    const FindView(),
    const EventsView(),
    const ProfileView()
  ];
  List<String> titles = [
    AppStrings.home,
    AppStrings.find,
    AppStrings.events,
    AppStrings.profile,
  ];
  //var _title = AppStrings.home.tr();
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.primaryOpacity70,
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: getBoldTextStyle(fontSize: FontSize.f12),
        unselectedLabelStyle: getRegularTextStyle(fontSize: FontSize.f12),
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  Container(
                    height: AppSizes.s2,
                    width: AppSizes.s25,
                    color: _currentIndex == 0
                        ? AppColors.primary
                        : AppColors.white,
                  ),
                  const SizedBox(
                    height: AppSizes.s3,
                  ),
                  Image.asset(_currentIndex == 0
                      ? AppImages.homeSelectedIcon
                      : AppImages.homeUnSelectedIcon)
                ],
              ),
              label: AppStrings.home),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  Container(
                    height: AppSizes.s2,
                    width: AppSizes.s25,
                    color: _currentIndex == 1
                        ? AppColors.primary
                        : AppColors.white,
                  ),
                  const SizedBox(
                    height: AppSizes.s3,
                  ),
                  Image.asset(_currentIndex == 1
                      ? AppImages.findSelectedIcon
                      : AppImages.findUnSelectedIcon)
                ],
              ),
              label: AppStrings.find),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  Container(
                    height: AppSizes.s2,
                    width: AppSizes.s25,
                    color: _currentIndex == 2
                        ? AppColors.primary
                        : AppColors.white,
                  ),
                  const SizedBox(
                    height: AppSizes.s3,
                  ),
                  Image.asset(_currentIndex == 2
                      ? AppImages.eventsSelectedIcon
                      : AppImages.eventsUnSelectedIcon)
                ],
              ),
              label: AppStrings.events),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  Container(
                    height: AppSizes.s2,
                    width: AppSizes.s25,
                    color: _currentIndex == 3
                        ? AppColors.primary
                        : AppColors.white,
                  ),
                  const SizedBox(
                    height: AppSizes.s3,
                  ),
                  Image.asset(_currentIndex == 3
                      ? AppImages.profileSelectedIcon
                      : AppImages.profileUnSelectedIcon)
                ],
              ),
              label: AppStrings.profile),
        ],
      ),
    );
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
