import 'dart:async';
import 'dart:io';

import 'package:baza/assets/constants/colors.dart';
import 'package:baza/assets/constants/icons.dart';
import 'package:baza/core/profile_status/status.dart';
import 'package:baza/features/profile/prezentation/bloc/profile_bloc.dart';
import 'package:baza/features/profile/prezentation/pages/edit.dart';
import 'package:baza/features/profile/prezentation/pages/firstScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({super.key});

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          switch (state.status) {
            case ProfileStatus.pure:
              context.read<ProfileBloc>().add(GetData());
              return SizedBox();
            case ProfileStatus.loading:
              return CupertinoActivityIndicator();
            case ProfileStatus.succes:
              return Scaffold(
                backgroundColor: Color(0xFFF5F8FC),
                appBar: AppBar(
                    backgroundColor: Colors.white,
                    centerTitle: true,
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => FirstScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SvgPicture.asset(AppIcons.back),
                      ),
                    ),
                    title: Text(
                      "Profil ma’lumotlari",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: auth_dark),
                    )),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                  child: Column(children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      padding: EdgeInsets.only(
                          top: 16, bottom: 20, left: 16, right: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(),
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: state.authenticatedUser!.imgurl == null
                                      ? const Icon(
                                          Icons.person,
                                          color:
                                              Color.fromARGB(162, 59, 56, 56),
                                          size: 100,
                                        )
                                      : Image.file(
                                          File(
                                              state.authenticatedUser!.imgurl!),
                                          fit: BoxFit.fill,
                                          width: 100,
                                          height: 100,
                                        ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: grr,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              ProfileEditScreen(
                                            fish: state.authenticatedUser!.fish,
                                            address: state
                                                .authenticatedUser!.address,
                                            imgUrl: state.authenticatedUser!
                                                    .imgurl ??
                                                "",
                                          ),
                                        ),
                                      );
                                    },
                                    child: SvgPicture.asset(
                                      AppIcons.edit2,
                                      color: auth_darkish,
                                      width: 32,
                                      height: 32,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Gap(20),
                            Text(
                              "F.I.Sh",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: auth_darkish,
                                  ),
                            ),
                            Gap(4),
                            Text(
                              state.authenticatedUser!.fish,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: auth_dark,
                                  ),
                            ),
                            Gap(16),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.height / 100 * 70,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                "Manzilingiz",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: auth_darkish,
                                    ),
                              ),
                            ),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.height / 100 * 70,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                state.authenticatedUser!.address,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      color: auth_dark,
                                    ),
                              ),
                            )
                          ]),
                    ),
                    Gap(16),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      padding: EdgeInsets.all(16.0),
                      child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: errorish,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppIcons.exit),
                                Gap(8),
                                Text(
                                  "Chiqish",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        color: auth_error,
                                      ),
                                )
                              ],
                            ),
                          )),
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
