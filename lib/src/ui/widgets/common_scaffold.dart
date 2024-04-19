// flutter imports
// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// package imports
import 'package:get/get.dart';

// services

// route imports

// lib imports
import '../../utils/config/uidata.dart';
import '../../utils/routes/app_routes.dart';
import '../views/dashboard.dart';
import './buttons/icon_button.dart';
import '../widgets/drawer/common_drawer.dart';
import './custom_float.dart';

class CommonScaffold extends StatelessWidget {
  final appTitle;
  final Widget bodyData;
  final showFAB;
  final showDrawer;
  final showAppBar;
  final Color? backGroundColor;
  final actionFirstIcon;
  final actionSecondIcon;
  final scaffoldKey;
  final showBottomNav;
  final floatingIcon;
  final centerDocked;
  final elevation;
  final enableHeader;
  final String? headerTitle;
  final Widget? headerIcon;
  final String headerSubTitle;
  final headerName;
  final topButton;
  final qrCallback;
  final String headerImage;
  final actionFirstIconCallBack;
  final actionSecondIconCallBack;
  final appBarSearch;
  final appBarSearchShow;
  final helpIcon;
  final Uri? helpIconLink;
  CommonScaffold({
    this.appTitle,
    required this.bodyData,
    this.showFAB = false,
    this.showDrawer = false,
    this.showAppBar = false,
    this.backGroundColor,
    this.actionFirstIcon = false,
    this.actionSecondIcon = false,
    this.scaffoldKey,
    this.showBottomNav = false,
    this.centerDocked = true,
    this.floatingIcon = Icons.add,
    this.elevation = 4.0,
    this.enableHeader = false,
    this.headerName = false,
    this.headerTitle = '',
    this.headerIcon,
    this.headerSubTitle = '',
    this.topButton = 'menu',
    this.qrCallback,
    this.headerImage = '',
    this.actionFirstIconCallBack,
    this.actionSecondIconCallBack,
    this.appBarSearch,
    this.helpIcon = false,
    this.helpIconLink,
    this.appBarSearchShow = false,
  });

  Widget myBottomBar() => BottomAppBar(
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 59,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Get.offAndToNamed(Routes.DashboardRoute);
              },
              child: Column(
                children: [Icon(Icons.home), Text("Home")],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Get.to(Order());
              },
              child: Column(
                children: [Icon(Icons.shopping_cart), Text("Order")],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Get.to(ChatWindow());
                // Get.to(ChatScreen());
              },
              child: Column(
                children: [
                  Icon(Icons.message),
                  Text(
                    "Chat",
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Get.to(Wallet());
              },
              child: Column(
                children: [Icon(Icons.wallet), Text("Wallet")],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.ProfileRoute);
                print("working");
              },
              child: Column(
                children: [Icon(Icons.person), Text("Profile")],
              ),
            ),
          ],
        ).paddingOnly(top: 10),
      ));

  @override
  Widget build(BuildContext context) {
    int topFlex = 4;
    int bottomFlex = 11;
    int totalFlex = topFlex + bottomFlex;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: scaffoldKey,
      backgroundColor: UIDataColors.commonblackColor,
      appBar: showAppBar
          ? AppBar(
              automaticallyImplyLeading: false,
              elevation: elevation,
              toolbarHeight: 40.0,
              backgroundColor: Colors.transparent,
              title: Align(
                alignment: Alignment.centerRight,
                // child: Text(
                //   "Skip",
                //   style: TextStyle(color: UIDataColors.commontextColor),
                // ),
                child: SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: UIDataColors.commonblackColor,
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.loginRoute);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                appBarSearchShow != false ? appBarSearch : SizedBox(),
                // actionFirstIcon != true ? Padding() : SizedBox(),
                actionSecondIcon != false
                    ? IconButton(
                        onPressed: actionFirstIconCallBack,
                        icon: Icon(
                          actionSecondIcon,
                          color: UIDataColors.commonnColor,
                        ),
                      )
                    : SizedBox(),
              ],
            )
          : null,
      drawer: showDrawer ? CommonDrawer() : null,
      body: OrientationBuilder(
        builder: (context, orientation) {
          // print('width : ${ (MediaQuery.of(context).size.width.ceil()).toDouble()}');
          // print('keyboard: ${MediaQuery.of(context).viewInsets.bottom}');
          return SafeArea(
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 0.85,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: backGroundColor ?? Colors.white,
                ),
                width: (MediaQuery.of(context).size.width.ceil()).toDouble(),
                height: (MediaQuery.of(context).size.height.ceil()).toDouble(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    enableHeader
                        ? Container(
                            height: Get.height * (topFlex / totalFlex) -
                                Get.height / 9,
                            decoration:
                                BoxDecoration(color: Colors.transparent),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: -15,
                                  top: -15,
                                  child: Container(
                                    width: Get.width * 0.33,
                                    height: Get.height * 0.17,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(UIDataImage.barsblue),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                helpIcon
                                    ? Positioned(
                                        right: Get.width * 0.16,
                                        top: Get.height * 0.10,
                                        child: InkWell(
                                          child: Container(
                                            child: Icon(
                                              Icons.help,
                                              color: UIDataColors.commonColor,
                                            ),
                                          ),
                                          onTap: () async {
                                            if (helpIconLink == null) {
                                              if (helpIconLink!.path == '') {
                                                Get.snackbar('Error',
                                                    'Help URL not provided',
                                                    colorText: Colors.white,
                                                    backgroundColor: Colors.red,
                                                    snackPosition:
                                                        SnackPosition.BOTTOM);
                                                return;
                                              }
                                              Get.snackbar(
                                                'Error',
                                                'Help URL not provided',
                                                colorText: Colors.white,
                                                backgroundColor: Colors.red,
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                              );
                                              return;
                                            }
                                          },
                                        ),
                                      )
                                    : SizedBox(),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Get.width * 0.04, left: 23),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      topButton == 'back'
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                  // height: Get.width * 0.10,
                                                  // width: Get.width * 0.10,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(
                                                          Get.width * 0.10),
                                                    ),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors
                                                            .grey.shade400,
                                                        blurRadius: 2.5,
                                                      ),
                                                    ],
                                                  ),
                                                  child: ReusableIconButton(
                                                    icon: topButton == 'menu'
                                                        ? UIDATAIcons.menu
                                                        : Icon(
                                                            Icons.arrow_back,
                                                            color: UIDataColors
                                                                .commonColor,
                                                          ),
                                                    onPressed: () {
                                                      topButton == 'menu'
                                                          ? scaffoldKey
                                                              .currentState
                                                              .openDrawer()
                                                          : Get.back();
                                                    },
                                                  ),
                                                ),
                                                SizedBox(width: 14.0),
                                              ],
                                            )
                                          : SizedBox(width: 0),
                                      // SizedBox(width: 14.0),
                                      //
                                      headerName
                                          ? Container(
                                              width: Get.width / 2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  headerTitle == 'Dashboard'
                                                      ? SizedBox()
                                                      : Text(
                                                          'Welcome',
                                                          // textScaleFactor: 1.5,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 20.0,
                                                            color: Color(
                                                                0xff3e3e3e),
                                                          ),
                                                        ),
                                                  Text(
                                                    headerTitle ?? '',
                                                    // textScaleFactor: 1.8,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Roboto',
                                                      fontSize: 28.0,
                                                      color: Color(0xff3e3e3e),
                                                    ),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                      headerSubTitle == ''
                                                          ? ''
                                                          : headerSubTitle,
                                                      // textScaleFactor: 1.4,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Roboto',
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontSize: 20.0,
                                                        color:
                                                            Color(0xff3e3e3e),
                                                      ),
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ],
                                              ),
                                            )
                                          : Expanded(
                                              // width: Get.width / 1.5,
                                              child: headerImage != ''
                                                  ? Row(
                                                      children: [
                                                        Container(
                                                          height: 50.0,
                                                          width: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image:
                                                                DecorationImage(
                                                              image: NetworkImage(
                                                                  headerImage),
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 10.0),
                                                        Text(
                                                          headerTitle!,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontFamily:
                                                                  'Roboto',
                                                              // fontSize: 26.0,
                                                              color: Color(
                                                                  0xff3e3e3e),
                                                              letterSpacing:
                                                                  1.5),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    )
                                                  : headerIcon != null
                                                      ? Row(
                                                          children: [
                                                            SizedBox(
                                                              width: Get.width /
                                                                      2 -
                                                                  40,
                                                              child: Text(
                                                                headerTitle ==
                                                                        ''
                                                                    ? ''
                                                                    : headerTitle!
                                                                        .splitMapJoin(
                                                                        RegExp(
                                                                            r'&',
                                                                            multiLine:
                                                                                true),
                                                                        onMatch:
                                                                            (_) =>
                                                                                '\n& ',
                                                                        onNonMatch:
                                                                            (n) =>
                                                                                n.trim(),
                                                                      ),
                                                                textScaleFactor:
                                                                    1.4,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.w700,
                                                                    fontFamily: 'Roboto',
                                                                    // fontSize:26.0,
                                                                    color: Color(0xff3e3e3e),
                                                                    letterSpacing: 1.5),
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                            headerIcon!,
                                                          ],
                                                        )
                                                      : SizedBox(
                                                          width: Get.width / 2 -
                                                              40,
                                                          child: Text(
                                                            headerTitle == ''
                                                                ? ''
                                                                : headerTitle!
                                                                    .splitMapJoin(
                                                                    RegExp(r'&',
                                                                        multiLine:
                                                                            true),
                                                                    onMatch: (_) =>
                                                                        '\n& ',
                                                                    onNonMatch:
                                                                        (n) => n
                                                                            .trim(),
                                                                  ),
                                                            textScaleFactor:
                                                                1.4,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontFamily:
                                                                    'Roboto',
                                                                // fontSize:26.0,
                                                                color: Color(
                                                                    0xff3e3e3e),
                                                                letterSpacing:
                                                                    1.5),
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(height: 0.0),
                    Expanded(flex: bottomFlex, child: bodyData),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: showFAB
          ? CustomFloat(
              builder: null,
              icon: floatingIcon,
              qrCallback: qrCallback,
            )
          : null,
      floatingActionButtonLocation: centerDocked
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: showBottomNav ? myBottomBar() : null,
    );
  }
}
