import 'package:flutter/material.dart';
import 'package:suriota_mobile_gateway/view/device_menu.dart';
import 'package:suriota_mobile_gateway/view/widget/card.dart';

import '../constant/app_color.dart';
import '../constant/font_setup.dart';
import '../constant/image_asset.dart';
import '../constant/theme.dart';
import 'add_device_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Transform.scale(
              alignment: Alignment.centerLeft,
              scale: 0.5,
              child: Image.asset(ImageAsset.logoSuriota)),
        ),
        endDrawer: Drawer(child: sideBar(context)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hallo, Jefferey👋',
                style: FontFamily.titleLarge,
              ),
              Text(
                'Connecting the device near you',
                style: FontFamily.normal.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 53,
              ),
              Text(
                'Device List',
                style: FontFamily.headlineMedium,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                       DeviceMenuConfigurationPage(title: 'Suriota Gateway ${index+1}',)));
                        },
                        child: card(context, 'Suriota Gateway ${index + 1}'));
                  })
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddDevicePage()));
          },
          label: Text(
            'Add Device',
            style: FontFamily.normal
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 25,
          ),
          shape: (const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
        )
        // / This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
