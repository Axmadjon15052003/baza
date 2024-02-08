import 'package:baza/assets/constants/colors.dart';
import 'package:baza/assets/constants/icons.dart';
import 'package:baza/features/authentication/prezentation/pages/passwordChangeScreen.dart';
import 'package:baza/features/authentication/prezentation/pages/signUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        "Xush kelibsiz!",
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
                      Gap(16),
                      Text(
                        "Parol",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: auth_dark),
                      ),
                      Gap(8),
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height / 100 * 5.9,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: auth_whitish),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: auth_dark),
                          controller: passwordController,
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                                right: 12,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) =>
                                        PasswordChangeScreen(),
                                  ));
                                },
                                child: Text(
                                  "Unutdingizmi?",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: auth_darkish),
                                ),
                              ),
                            ),
                            hintText: "Parolni kiriting",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: auth_darkish),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Gap(20),
                      GestureDetector(
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
                            "Kirish",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: auth_dark),
                          ),
                        ),
                      )
                    ]),
              ),
              Container(
                child: Column(children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Ilovada yangimisiz?",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: auth_darkish),
                    ),
                  ),
                  Gap(14),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                          (route) => false);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height / 100 * 5.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: auth_yelwish,
                      ),
                      child: Text(
                        "Ro‘yxatdan o‘tish",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: auth_dark),
                      ),
                    ),
                  )
                ]),
              )
            ]),
      ),
    );
  }
}
