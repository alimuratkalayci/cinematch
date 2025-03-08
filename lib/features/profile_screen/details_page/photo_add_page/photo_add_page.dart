import 'dart:io';
import 'package:cinematch/components/custom_app_bar.dart';
import 'package:cinematch/constants/ui_theme.dart';
import 'package:cinematch/core/localization/app_localizations.dart';
import 'package:cinematch/features/profile_screen/details_page/photo_add_page/provider/photo_add_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/profile_page_provider.dart';

class PhotoAddPage extends StatefulWidget {
  const PhotoAddPage({super.key});

  @override
  State<PhotoAddPage> createState() => _PhotoAddPageState();
}

class _PhotoAddPageState extends State<PhotoAddPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PhotoAddPageProvider(),
      child: Consumer<PhotoAddPageProvider>(
        builder: (context, photoProvider, child) {
          return Scaffold(
            appBar: const CustomAppBar(
              title: 'profile_detail',
              showLeading: true,
            ),
            backgroundColor: AppColors.backgroundColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!
                              .translate('upload_your_photo'),
                          style: CustomTextStyle.circular18px600wWhite,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await photoProvider.pickImage();
                          },
                          child: Builder(
                            builder: (context) {
                              final screenWidth =
                                  MediaQuery.of(context).size.width;
                              final containerSize = screenWidth * 0.5;

                              return Container(
                                width: containerSize,
                                height: containerSize,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.3),
                                      width: 2),
                                ),
                                child: Center(
                                  child: photoProvider.image == null
                                      ? const Icon(Icons.add,
                                          color: Colors.white, size: 40)
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.file(
                                            File(photoProvider.image!.path),
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            await photoProvider.submitPhoto(context);
                            Navigator.pop(context);
                            context
                                .read<ProfilePageProvider>()
                                .fetchProfileDatas();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonRed,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.translate('continue'),
                            style: CustomTextStyle.circular15px500wWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
