import 'package:baza/assets/constants/colors.dart';
import 'package:baza/assets/constants/icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    PinTheme defaultPinTheme = PinTheme(
      width: 51,
      height: 55,
      textStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: auth_gray,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    final TextEditingController pinPutController = TextEditingController();
    bool isPinPutValid = false;
    bool isError = false;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 52,
          bottom: MediaQuery.of(context).padding.bottom + 24,
          left: 20,
          right: 20,
        ),
        child: Column(children: [
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Align(
                child: Image.asset(AppIcons.logo),
                alignment: Alignment.center,
              ),
              Gap(48),
              Text(
                "Ro‘yxatdan o‘tish",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: auth_dark),
              ),
              Gap(4),
              Text(
                "Tasdiqlash kodini kiriting",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: auth_darkish),
              ),
              Gap(22),
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Ro‘yxatdan o‘tish uchun kod telefon",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: auth_darkish),
                    ),
                    Text(
                      "Raqamingizga yuborildi",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: auth_darkish),
                    ),
                    Gap(8.5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "+998 90 566 34 06",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: auth_dark),
                        ),
                        Gap(8),
                        SvgPicture.asset(AppIcons.edit)
                      ],
                    ),
                    Gap(26.5),
                    Pinput(
                      length: 6,
                      // controller: pinPutController,
                      // enableSuggestions: isPinPutValid,
                      defaultPinTheme: defaultPinTheme,
                      // focusedPinTheme: defaultPinTheme.copyBorderWith(
                      //   border: Border.all(
                      //     color: auth_gray,
                      //   ),
                      // ),
                      // errorPinTheme: defaultPinTheme.copyBorderWith(
                      //   border: Border.all(
                      //     color: !isPinPutValid ? auth_error : Colors.green,
                      //   ),
                      // ),
                    ),
                    Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Kod kelmadimi?",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: auth_darkish),
                        ),
                        Gap(6),
                        Text(
                          "Qaytadan yuborish",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: auth_dark),
                        )
                      ],
                    ),
                    Gap(20),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height / 100 * 5.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: auth_yell,
                        ),
                        child: Text(
                          "Davom etish",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: auth_dark),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
