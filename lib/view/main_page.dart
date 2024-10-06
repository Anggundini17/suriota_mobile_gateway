import 'package:flutter/material.dart';
import 'package:suriota_mobile_gateway/constant/app_color.dart';
import 'package:suriota_mobile_gateway/constant/font_setup.dart';
import 'package:suriota_mobile_gateway/view/about_us_page.dart';
import 'package:suriota_mobile_gateway/view/homepage.dart';
import 'package:suriota_mobile_gateway/view/login_page.dart';

import '../constant/image_asset.dart';
import 'profile.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key, required this.title});

  final String title;

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  int bottomSelectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageAsset.profile2,
                height: 100,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Jefferey Wijaya',
                  style: FontFamily.headlineLarge,
                ),
              ),
              const SizedBox(height: 100),
              ListTile(
                selected: bottomSelectedIndex == 0,
                leading: const Icon(
                  Icons.home,
                  color: AppColor.primaryColor,
                ),
                title: Text(
                  'Home',
                  style: FontFamily.normal,
                ),
                onTap: () {
                  onItemTapped(0);
                  Navigator.pop(context); // Menutup drawer setelah tap
                },
              ),
              ListTile(
                selected: bottomSelectedIndex == 1,
                leading: const Icon(
                  Icons.person,
                  color: AppColor.primaryColor,
                ),
                title: Text(
                  'Profile',
                  style: FontFamily.normal,
                ),
                onTap: () {
                  onItemTapped(1);
                  Navigator.pop(context); // Menutup drawer setelah tap
                },
              ),
              ListTile(
                selected: bottomSelectedIndex == 2,
                leading: const Icon(
                  Icons.info,
                  color: AppColor.primaryColor,
                ),
                title: Text(
                  'About Us',
                  style: FontFamily.normal,
                ),
                onTap: () {
                  onItemTapped(2);
                  Navigator.pop(context); // Menutup drawer setelah tap
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
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: bottomSelectedIndex,
        children: const [
          HomePage(),
          ProfilePage(),
          AboutUsPage(),
        ],
      ),
    );
  }
}
