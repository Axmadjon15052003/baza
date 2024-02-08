import 'package:baza/assets/constants/colors.dart';
import 'package:baza/assets/constants/icons.dart';
import 'package:baza/features/authentication/prezentation/pages/passwordChange.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';


class PasswordChangeScreen extends StatefulWidget {
  const PasswordChangeScreen({super.key});

  @override
  State<PasswordChangeScreen> createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            AppIcons.back,
            width: 28,
            height: 28,
          ),
        ),
      )),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 52,
          bottom: MediaQuery.of(context).padding.bottom + 24,
          left: 20,
          right: 20,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        child: Image.asset(AppIcons.logo),
                        alignment: Alignment.center,
                      ),
                      Gap(48),
                      Text(
                        "Parolni qayta tiklash",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: auth_dark),
                      ),
                      Gap(4),
                      Text(
                        "Ma’lumotlarni kiriting",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: auth_darkish),
                      ),
                      Gap(24),
                      Text(
                        "Telefon raqam",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: auth_dark),
                      ),
                      Gap(8),
                      Container(
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height / 100 * 5.9,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: auth_whitish),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: auth_dark),
                          controller: numberController,
                          decoration: InputDecoration(
                              hintText: "90 566 34 06",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(color: auth_darkish),
                              border: InputBorder.none,
                              prefix: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 5, top: 15, bottom: 2),
                                child: Text(
                                  "+998",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(color: auth_dark),
                                ),
                              )),
                        ),
                      ),
                      Gap(20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => PasswordChange(),
                          ));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          height:
                              MediaQuery.of(context).size.height / 100 * 5.9,
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
                      )
                    ]),
              ),
            ]),
      ),
    );
  }
}
