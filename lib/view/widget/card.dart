import 'package:flutter/material.dart';
import 'package:suriota_mobile_gateway/global/widgets/custom_button.dart';
import 'package:suriota_mobile_gateway/global/widgets/custom_textfield.dart';

import '../../constant/app_color.dart';
import '../../constant/font_setup.dart';
import '../../constant/image_asset.dart';

Card card(BuildContext context, String title) {
  return Card(
    color: AppColor.cardColor,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(ImageAsset.iconBluetooth)),
              const SizedBox(
                width: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: FontFamily.headlineMedium,
                  ),
                  Text(
                    'CC:7B:5C:28:A4:7E',
                    style: FontFamily.normal,
                  )
                ],
              ),
            ],
          ),
          // SizedBox(
          //   height: 23,
          //   child: ElevatedButton(
          //       onPressed: () {},
          //       style: ButtonStyle(
          //         backgroundColor: WidgetStatePropertyAll(
          //             Theme.of(context).appBarTheme.backgroundColor),
          //         shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
          //             borderRadius: BorderRadius.all(Radius.circular(8)))),
          //       ),
          //       child: Text(
          //         'Connect',
          //         style: FontFamily.normal
          //             .copyWith(fontSize: 10, color: Colors.white),
          //       )),
          // )
          CustomButton(
              height: 23,
              width: 95,
              titleButton: 'Connect',
              textStyle:
                  FontFamily.normal.copyWith(fontSize: 10, color: Colors.white),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: AppColor.cardColor,
                        scrollable: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28)),
                        title: Center(
                          child: Text(
                            'Device Initial',
                            style: FontFamily.headlineMedium,
                          ),
                        ),
                        content: Column(
                          children: [
                            SizedBox(
                                height: 170,
                                child:
                                    Image.asset(ImageAsset.iconDeviceInitial)),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              labelTxt: 'Device Name',
                              hintTxt: 'Enter The Device Name',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              height: 39,
                              width: MediaQuery.of(context).size.width * 1,
                              titleButton: 'Save',
                            )
                          ],
                        ),
                      );
                    });
              })
        ],
      ),
    ),
  );
}

Widget cardMenu(BuildContext context, String? iconImage, String? titleCard,
    {void Function()? onTap}) {
  // double? height;
  // double? width;

  double widthCard = MediaQuery.of(context).size.width * 0.45;

  return InkWell(
    onTap: onTap,
    child: SizedBox(
      height: 175,
      width: widthCard,
      child: Card(
        color: AppColor.cardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 86,
                child: Image.asset(iconImage ?? 'Not Found'),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 5,
              ),
              Text(
                titleCard ?? 'Enter The Title',
                textAlign: TextAlign.center,
                style: FontFamily.normal,
              )
            ],
          ),
        ),
      ),
    ),
  );
}
