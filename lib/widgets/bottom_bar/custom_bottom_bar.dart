import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavShip,
      activeIcon: ImageConstant.imgNavShip,
      title: "lbl_ship".tr,
      type: BottomBarEnum.Ship,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavOperate,
      activeIcon: ImageConstant.imgNavOperate,
      title: "lbl_operate".tr,
      type: BottomBarEnum.Operate,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavSetting,
      activeIcon: ImageConstant.imgNavSetting,
      title: "lbl_setting".tr,
      type: BottomBarEnum.Setting,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.v,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].icon,
                    height: 28.v,
                    width: 38.h,
                    color: appTheme.blueGray300,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.v),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: appTheme.blueGray300,
                      ),
                    ),
                  ),
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].activeIcon,
                    height: 28.v,
                    width: 32.h,
                    color: appTheme.redA200,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      style: CustomTextStyles.labelMediumRedA200.copyWith(
                        color: appTheme.redA200,
                      ),
                    ),
                  ),
                ],
              ),
              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Ship,
  Operate,
  Setting,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
