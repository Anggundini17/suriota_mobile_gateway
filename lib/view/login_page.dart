import 'package:flutter/material.dart';
import 'package:suriota_mobile_gateway/constant/app_color.dart';
import 'package:suriota_mobile_gateway/constant/font_setup.dart';
import 'package:suriota_mobile_gateway/constant/image_asset.dart';
import 'package:suriota_mobile_gateway/global/widgets/custom_textfield.dart';
import 'package:suriota_mobile_gateway/view/homepage.dart';
import 'package:suriota_mobile_gateway/view/register.dart';

import '../global/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 38,
              child: Image.asset(ImageAsset.logoSuriota),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Welcome to Suriota Mobile Gateway!',
              style: FontFamily.titleLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Sign in to continue',
              style: FontFamily.normal
                  .copyWith(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 186),

            const CustomTextFormField(
              labelTxt: 'Email',
              hintTxt: 'Enter your email',
              prefixIcon: Icon(
                Icons.email,
                color: AppColor.primaryColor,
              ),
            ),
            const CustomTextFormField(
              labelTxt: 'Password',
              hintTxt: 'Enter your password',
              prefixIcon: Icon(
                Icons.key,
                color: AppColor.primaryColor,
              ),
            ),

            const SizedBox(
              height: 24,
            ),
            CustomButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePage(
                          // title: 'Main Menu',
                          )),
                  (Route<dynamic> route) => false,
                );
              },
              titleButton: 'SIGN IN',
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Text(
                'OR',
                style: FontFamily.headlineMedium.copyWith(color: AppColor.grey),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 57,
              width: MediaQuery.of(context).size.width * 1,
              child: ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        side: BorderSide(
                          color: AppColor.primaryColor,
                          width: 2,
                        ))),
                    fixedSize: MaterialStatePropertyAll(Size.infinite)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.g_mobiledata),
                    SizedBox(
                        height: 25,
                        child: Image.asset(
                          ImageAsset.iconGoogle,
                        )),
                    const SizedBox(width: 30),
                    Text(
                      'SIGN IN WITH GOOGLE',
                      style: FontFamily.headlineMedium
                          .copyWith(color: AppColor.primaryColor),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have any account? ",
                    style: FontFamily.headlineMedium.copyWith(
                        color: AppColor.grey, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "Register Here",
                    style: FontFamily.headlineMedium.copyWith(
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FormTextFieldApp extends StatelessWidget {
  const FormTextFieldApp({
    super.key,
    this.hintText,
    this.prefixIcon,
  });

  final String? hintText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39,
      child: TextField(
        style: FontFamily.labelText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(2),
          prefixIcon: prefixIcon,
          // Icon(
          //   prefixIcon,
          //   color: AppColor.primaryColor,
          // ),
          hintText: hintText,
          hintStyle: FontFamily.labelText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: AppColor.primaryColor, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: AppColor.primaryColor, width: 2)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: AppColor.primaryColor, width: 2)),
          // fillColor: Color(0xfff3f3f4),
          // filled: true,
        ),
      ),
    );
  }
}
