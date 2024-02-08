import 'dart:io';
import 'dart:ui';

import 'package:baza/assets/constants/colors.dart';
import 'package:baza/assets/constants/icons.dart';
import 'package:baza/features/profile/prezentation/bloc/profile_bloc.dart';
import 'package:baza/features/profile/prezentation/pages/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditScreen extends StatefulWidget {
  final String fish;
  final String address;
  final String imgUrl;
  const ProfileEditScreen({
    super.key,
    required this.address,
    required this.fish,
    required this.imgUrl,
  });

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  File? avatar;
  Future<void> pickAvatar() async {
    ImagePicker imagePicker = ImagePicker();

    final file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        avatar = File.fromUri(
          Uri.file(file.path),
        );
      });
    }
  }

  TextEditingController fishController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  void initState() {
    avatar = File(widget.imgUrl);
    fishController.text = widget.fish;
    addressController.text = widget.address;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xFFF5F8FC),
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                "Profilni tahrirlash",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: auth_dark),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(
                top: 24,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).padding.bottom + 20,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white),
                      padding: EdgeInsets.all(16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                alignment: Alignment.center,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color.fromARGB(31, 61, 59, 59),
                                ),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    avatar == null
                                        ? const Icon(
                                            Icons.person,
                                            color:
                                                Color.fromARGB(162, 59, 56, 56),
                                            size: 100,
                                          )
                                        : Image.file(
                                            avatar!,
                                            fit: BoxFit.cover,
                                            width: 100,
                                            height: 100,
                                          ),
                                    GestureDetector(
                                      onTap: () {
                                        pickAvatar();
                                      },
                                      child: ClipRect(
                                        child: Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 6),
                                          width: double.maxFinite,
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 4, sigmaY: 4),
                                            child: SvgPicture.asset(
                                              AppIcons.edit2,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            Gap(10),
                            Text(
                              "F.I.Sh",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: auth_dark),
                            ),
                            Gap(8),
                            Container(
                              padding: EdgeInsets.only(left: 12),
                              width: double.maxFinite,
                              height: MediaQuery.of(context).size.height /
                                  100 *
                                  5.9,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: auth_whitish),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(color: auth_dark),
                                controller: fishController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Gap(16),
                            Container(
                              padding: EdgeInsets.only(left: 12, right: 12),
                              width: double.maxFinite,
                              height:
                                  MediaQuery.of(context).size.height / 100 * 18,
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: auth_whitish),
                              child: TextField(
                                maxLines: 8,
                                keyboardType: TextInputType.text,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(color: auth_dark),
                                controller: addressController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ]),
                    )
                  ]),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.white,
              elevation: 0,
              child: GestureDetector(
                onTap: () async {
                  context.read<ProfileBloc>().add(
                        SetData(
                          fish: fishController.text,
                          address: addressController.text,
                          imgurl: avatar!.path,
                        ),
                      );
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => ProfileMainScreen()),
                      (route) => false);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height / 100 * 5.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: auth_yell,
                  ),
                  child: Text(
                    "Saqlash",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: auth_dark),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
