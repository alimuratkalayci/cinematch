import 'package:cinematch/features/profile_screen/provider/profile_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/custom_app_bar.dart';
import '../../constants/ui_theme.dart';
import 'components/profile_id_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProfilePageProvider>().fetchProfileDatas();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profilePageProvider = context.watch<ProfilePageProvider>();
    final profileData = profilePageProvider.profileData;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(title: 'Profil', showLimitedOffer: true),
      body: profileData == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileIdCard(
                    id: profileData.id,
                    name: profileData.name,
                    photoUrl: profileData.photoUrl,
                  ),
                  Text(
                    'Beğendiğim Filmler',
                    style: CustomTextStyle.circular13px700wWhite,
                  ),
                ],
              ),
            ),
    );
  }
}
