import 'package:baza/assets/constants/colors.dart';
import 'package:baza/assets/constants/icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PasswordChange extends StatefulWidget {
  const PasswordChange({super.key});

  @override
  State<PasswordChange> createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
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
                        "Parol o‘rnating",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: auth_darkish),
                      ),
                      Gap(24),
                      Text(
                        "Yangi parol",
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
                          keyboardType: TextInputType.phone,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: auth_dark),
                          controller: numberController,
                          decoration: InputDecoration(
                            hintText: "Parolni kiriting",
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
                        "Yangi parolni tasdiqlash",
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
                            hintText: "Parolni qaytadan kiriting",
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
                            "Parolni qayta tiklash",
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
