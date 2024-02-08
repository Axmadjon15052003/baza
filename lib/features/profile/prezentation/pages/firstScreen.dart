import 'dart:io';

import 'package:baza/assets/constants/colors.dart';
import 'package:baza/assets/constants/icons.dart';
import 'package:baza/core/profile_status/status.dart';
import 'package:baza/features/profile/prezentation/bloc/profile_bloc.dart';
import 'package:baza/features/profile/prezentation/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          switch (state.status) {
            case ProfileStatus.pure:
              context.read<ProfileBloc>().add(GetData());
              return CupertinoActivityIndicator();
            case ProfileStatus.loading:
              return CupertinoActivityIndicator();
            case ProfileStatus.succes:
              List<String> ls = state.authenticatedUser!.fish.split(" ");
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: 150,
                  title: Padding(
                    padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: MediaQuery.of(context).padding.top + 24,
                        bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: state.authenticatedUser!.imgurl == null
                                  ? const Icon(
                                      Icons.person,
                                      color: Color.fromARGB(162, 59, 56, 56),
                                      size: 64,
                                    )
                                  : Image.file(
                                      File(state.authenticatedUser!.imgurl!),
                                      fit: BoxFit.fill,
                                      width: 64,
                                      height: 64,
                                    ),
                            ),
                            Gap(16),
                            Row(
                              children: [
                                Text(
                                  ls[1],
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(color: auth_dark),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Gap(8),
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    ls[0],
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(color: auth_darkish),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            ),
                            Gap(16),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => ProfileMainScreen(),
                              ),
                            );
                          },
                          child: SvgPicture.asset(AppIcons.back2),
                        )
                      ],
                    ),
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: 16,
                            left: 16,
                            right: 16,
                            bottom: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(children: [
                            SvgPicture.asset(AppIcons.heart),
                            Gap(12),
                            Text(
                              "Saqlanganlar",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: auth_dark),
                            )
                          ]),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 16,
                            left: 16,
                            right: 16,
                            bottom: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(children: [
                            SvgPicture.asset(AppIcons.notification),
                            Gap(12),
                            Text(
                              "Habarnomalar",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: auth_dark),
                            )
                          ]),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 16,
                            left: 16,
                            right: 16,
                            bottom: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(children: [
                            SvgPicture.asset(AppIcons.setting),
                            Gap(12),
                            Text(
                              "Sozlamalar",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: auth_dark),
                            )
                          ]),
                        ),
                      ],
                    ),
                    Gap(24),
                    Container(
                      padding: EdgeInsets.only(
                          left: 8, right: 14, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.note),
                              Gap(12),
                              Text(
                                "Yo'riqnoma",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: auth_dark),
                              ),
                            ],
                          ),
                          SvgPicture.asset(AppIcons.back2)
                        ],
                      ),
                    ),
                    Gap(24),
                    Container(
                      padding: EdgeInsets.only(
                          left: 8, right: 14, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.iBaza),
                              Gap(12),
                              Text(
                                "Ilova Haqida",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: auth_dark),
                              ),
                            ],
                          ),
                          SvgPicture.asset(AppIcons.back2)
                        ],
                      ),
                    ),
                    Gap(24),
                    Container(
                      padding: EdgeInsets.only(
                          left: 8, right: 14, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.info),
                              Gap(12),
                              Text(
                                "Foydalanish qoidalari",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: auth_dark),
                              ),
                            ],
                          ),
                          SvgPicture.asset(AppIcons.back2)
                        ],
                      ),
                    ),
                    Gap(24),
                    Container(
                      padding: EdgeInsets.only(
                          left: 8, right: 14, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.info2),
                              Gap(12),
                              Text(
                                "Bonus balansi",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: auth_dark),
                              ),
                            ],
                          ),
                          SvgPicture.asset(AppIcons.back2)
                        ],
                      ),
                    ),
                    Gap(24),
                    Container(
                      padding: EdgeInsets.only(
                          left: 8, right: 14, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.info3),
                              Gap(12),
                              Text(
                                "Yordam",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: auth_dark),
                              ),
                            ],
                          ),
                          SvgPicture.asset(AppIcons.back2)
                        ],
                      ),
                    )
                  ]),
                ),
              );
          }
        },
      ),
    );
  }
}
