import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:suriota_mobile_gateway/global/widgets/custom_appbar.dart';
import 'package:suriota_mobile_gateway/global/widgets/custom_button.dart';
import 'package:suriota_mobile_gateway/global/widgets/custom_textfield.dart';
import '../../constant/font_setup.dart';
import '../../constant/theme.dart';
import '../../global/widgets/custom_dropdown.dart';
import '../../global/widgets/custom_radiotile.dart';
import '../../global/widgets/title_tile.dart';

class FomDeviceSetupView extends StatefulWidget {
  const FomDeviceSetupView({super.key});

  @override
  State<FomDeviceSetupView> createState() => _FomDeviceSetupViewState();
}

class _FomDeviceSetupViewState extends State<FomDeviceSetupView> {
  String modBusSelected = "RS-485";
  String protocolSelected = "IPv4";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Device Communications Setup",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        children: [
          const CustomTextFormField(
            labelTxt: "Device Name",
            hintTxt: "Enter the Device Name",
          ),
          if (modBusSelected == "RS-485")
            const CustomTextFormField(
              labelTxt: "Refresh Rate",
              hintTxt: "Enter the Refresh Rate",
              suffixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("m/s")]),
            ),
          const Gap(6),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Choose Moodbus Type", style: FontFamily.headlineMedium),
              CustomRadioTile(
                value: "RS-485",
                grupValue: modBusSelected,
                onChanges: () {
                  if (modBusSelected != "RS-485") {
                    setState(() {
                      modBusSelected = "RS-485";
                    });
                  }
                },
              ),
              CustomRadioTile(
                value: "TCP/IP",
                grupValue: modBusSelected,
                onChanges: () {
                  if (modBusSelected != "TCP/IP") {
                    setState(() {
                      modBusSelected = "TCP/IP";
                    });
                  }
                },
              ),
              const Gap(8),
              if (modBusSelected == "RS-485") rs485Field(),
              if (modBusSelected == "TCP/IP") tcpIpField(),
            ],
          ),
          const Gap(20),
          CustomButton(
            titleButton: "SAVE",
            onPressed: () {
              dialogSuccess(context);
            },
          ),
        ],
      ),
    );
  }

  Widget tcpIpField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const TitleTile(title: "Modbus Setup TCP/IP"),
        const Gap(6),
        const CustomTextFormField(
          labelTxt: "IP Address",
          hintTxt: "127.0.0.1",
        ),
        const CustomTextFormField(
          labelTxt: "Server Port",
          hintTxt: "502",
        ),
        const CustomTextFormField(
          labelTxt: "Connect Timeout",
          hintTxt: "3000 m/s",
        ),
        const Gap(10),
        Text("Choose Internet Protocol", style: FontFamily.headlineMedium),
        CustomRadioTile(
          value: "IPv4",
          grupValue: protocolSelected,
          onChanges: () {
            if (protocolSelected != "IPv4") {
              setState(() {
                protocolSelected = "IPv4";
              });
            }
          },
        ),
        CustomRadioTile(
          value: "IPv6",
          grupValue: protocolSelected,
          onChanges: () {
            if (protocolSelected != "IPv6") {
              setState(() {
                protocolSelected = "IPv6";
              });
            }
          },
        ),
      ],
    );
  }

  Widget rs485Field() {
    List<String> baudrates = [
      '9600 Baud',
      '19200 Baud',
      '38400 Baud',
      '57600 Baud',
      '115200 Baud'
    ];
    List<String> bitData = [
      '7 Data Bits',
      '8 Data Bits',
    ];
    List<String> parity = ['None Parity', 'Odd Parity', 'Even Parity'];
    List<String> stopBits = [
      '1 Stop Bit',
      '2 Stop Bits',
    ];
    String? selectedBaudRate;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TitleTile(title: "Modbus Setup RS-485"),
        const Gap(6),
        Text(
          'Choose Baudrate',
          style: FontFamily.headlineMedium,
        ),
        const Gap(4),
        CustomDropdown(
          listItem: baudrates,
          hintText: 'Choose the baudrate',
          selectedItem: selectedBaudRate ?? '',
        ),
        const Gap(6),
        Text(
          'Choose Bit Data',
          style: FontFamily.headlineMedium,
        ),
        const Gap(4),
        CustomDropdown(listItem: bitData, hintText: 'Choose bit data'),
        const Gap(6),
        Text(
          'Choose Parity',
          style: FontFamily.headlineMedium,
        ),
        const Gap(4),
        CustomDropdown(listItem: parity, hintText: 'Choose the parity'),
        const Gap(6),
        Text(
          'Choose Stop Bit',
          style: FontFamily.headlineMedium,
        ),
        const Gap(4),
        CustomDropdown(listItem: stopBits, hintText: 'Choose the stop bit'),
      ],
    );
  }
}
