import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suriota_mobile_gateway/constant/app_color.dart';
import 'package:suriota_mobile_gateway/view/profile.dart';

import '../view/about_us_page.dart';
import '../view/login_page.dart';
import 'font_setup.dart';
import 'image_asset.dart';

ThemeData themeData() {
  return ThemeData(
    // drawerTheme: DrawerThemeData(backgroundColor: AppColor.cardColor),
    appBarTheme: AppBarTheme(
        backgroundColor: AppColor.primaryColor,
        // centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        toolbarTextStyle: GoogleFonts.poppins(
          color: AppColor.primaryColor,
          fontSize: 16,
        ),
        iconTheme: const IconThemeData(
          color: AppColor.primaryColor,
        )),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
          fontSize: 32,
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold),
      titleMedium: GoogleFonts.poppins(
          color: AppColor.primaryColor, fontWeight: FontWeight.bold),
      titleSmall: GoogleFonts.poppins(color: AppColor.primaryColor),
      headlineLarge: GoogleFonts.poppins(
          color: AppColor.primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w800),
      headlineMedium: GoogleFonts.poppins(
          fontSize: 16,
          color: AppColor.primaryColor,
          fontWeight: FontWeight.w800),
      labelSmall: GoogleFonts.poppins(color: AppColor.primaryColor),
      labelMedium: GoogleFonts.poppins(color: AppColor.primaryColor),
    ),
    // colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
    useMaterial3: true,
  );
}

//VIEW DATA KOSONG
Center dataEmptyView(BuildContext context, String message) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
            height: 169, width: 203, child: Image.asset('assets/error.png')),
        Text(
          message.toUpperCase(),
          // 'Sorry, the data is not found!'.toUpperCase(),
          style: Theme.of(context).textTheme.headlineLarge,
        )
      ],
    ),
  );
}

Padding sideBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImageAsset.profile2,
          height: 100,
          fit: BoxFit.scaleDown,
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            'Jefferey Wijaya',
            style: FontFamily.headlineLarge,
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
            color: AppColor.primaryColor,
          ),
          title: Text(
            'Home',
            style: FontFamily.normal,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
            color: AppColor.primaryColor,
          ),
          title: Text(
            'Profile',
            style: FontFamily.normal,
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.info,
            color: AppColor.primaryColor,
          ),
          title: Text(
            'About Us',
            style: FontFamily.normal,
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutUsPage()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: AppColor.primaryColor,
          ),
          title: Text(
            'Log Out',
            style: FontFamily.normal,
          ),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (Route route) => false);
          },
        ),
      ],
    ),
  );
}

Future<dynamic> dialogSuccess(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.center,
          title: const Icon(
            size: 65,
            Icons.check_circle,
            color: AppColor.primaryColor,
          ),
          content: Text(
            'Data Saved Successed',
            style: FontFamily.headlineMedium,
            textAlign: TextAlign.center,
          ),
        );
      });
}
