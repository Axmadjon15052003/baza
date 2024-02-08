import 'package:baza/assets/constants/colors.dart';
import 'package:baza/assets/constants/icons.dart';
import 'package:baza/features/authentication/prezentation/pages/home.dart';
import 'package:baza/features/authentication/prezentation/pages/verifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        "Ro‘yxatdan o‘tish",
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
                        "F.I.Sh",
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
                          controller: numberController,
                          decoration: InputDecoration(
                            hintText: "To‘liq ismingizni kiriting",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: auth_darkish),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Gap(16),
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
                          keyboardType: TextInputType.text,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: auth_dark),
                          controller: passwordController,
                          decoration: InputDecoration(
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
                            ),
                            hintText: "90 566 34 06",
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
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => VerificationScreen(),
                              ),
                              (route) => false);
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
                      ),
                    ]),
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Ro‘yxatdan o‘tganmisiz?",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: auth_darkish),
                ),
              ),
            ]),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
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
              "Kirish",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: auth_dark),
            ),
          ),
        ),
      ),
    );
  }
}
