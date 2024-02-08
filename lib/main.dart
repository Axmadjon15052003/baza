import 'dart:io';

import 'package:baza/assets/theme/theme.dart';
import 'package:baza/core/adapter/adapter.dart';
import 'package:baza/core/setup_injector/setup_locator.dart';
import 'package:baza/core/store_injector/store_repository.dart';
import 'package:baza/features/profile/prezentation/pages/firstScreen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



void main() async {
  registerAdapter();
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  await HiveRepository.getInstance();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // void _increment() async {
  //   await StorageRepository.setStatus(true);
  //   await HiveRepository.putName("","");
  // }

  File? avatar;

  Future<void> pickAvatar() async {
    ImagePicker imagePicker = ImagePicker();

    final file = await imagePicker.pickImage(source: ImageSource.camera);
    if (file != null) {
      setState(() {
        avatar = File.fromUri(
          Uri.file(file.path),
        );
      });
    }
  }

  List<File> files = [];

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      files.addAll(
        result.files
            .map(
              (file) => File.fromUri(
                Uri.file(file.path ?? ""),
              ),
            )
            .toList(),
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.darkTheme(),
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
      // home: Scaffold(
      //     appBar: AppBar(
      //       title: Text("Image Picker"),
      //     ),
      //     body: Column(children: [
      //       Align(
      //         alignment: Alignment.center,
      //         child: Container(
      //           clipBehavior: Clip.hardEdge,
      //           decoration: BoxDecoration(shape: BoxShape.circle),
      //           child: avatar == null
      //               ? const Icon(
      //                   Icons.person,
      //                   color: Colors.green,
      //                   size: 100,
      //                 )
      //               : Image.file(
      //                   avatar!,
      //                   fit: BoxFit.cover,
      //                 ),
      //         ),
      //       ),
      //       Wrap(
      //         children: List.generate(
      //             files.length,
      //             (index) => GestureDetector(
      //                   onLongPress: () async {
      //                     await Share.share("Hi friends");
      //                   },
      //                   onTap: () async {
      //                     await OpenFile.open(files[index].path);
      //                   },
      //                   child: Container(
      //                     padding: EdgeInsets.all(10),
      //                     decoration: BoxDecoration(
      //                       color: Colors.green,
      //                       borderRadius: BorderRadius.circular(8),
      //                     ),
      //                     child: Text(
      //                       files[index]
      //                           .path
      //                           .split(Platform.pathSeparator)
      //                           .last,
      //                       style: TextStyle(
      //                         fontSize: 24,
      //                         color: Colors.white,
      //                         fontWeight: FontWeight.w700,
      //                       ),
      //                     ),
      //                   ),
      //                 )),
      //       )
      //     ]),
      //     floatingActionButton: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         FloatingActionButton(
      //           onPressed: () {
      //             pickAvatar();
      //           },
      //           child: Icon(Icons.camera),
      //         ),
      //         FloatingActionButton(
      //           onPressed: () {
      //             pickFile();
      //           },
      //           child: Icon(Icons.file_copy),
      //         ),
      //       ],
      //     )),
      // home: Scaffold(
      //   floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.sports_martial_arts_rounded),
      //     onPressed: () async {
      //       _increment();
      //       print("Come here 1");
      //       setState(() {});
      //     },
      //   ),
      //   body: Center(
      //     child: Text('${HiveRepository.getName()}'),
      //   ),
      // ),
    );
  }
}
