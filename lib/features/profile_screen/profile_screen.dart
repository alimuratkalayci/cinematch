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
    context.watch()<ProfilePageProvider>().fetchProfileDatas();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(title: 'Profil', showLimitedOffer: true),
      body: Consumer<ProfilePageProvider>(
        builder: (context, profilePageProvider, child) {
          final profileData = profilePageProvider.profileData;
          if (profileData == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              ProfileIdCard(
                id: profileData.id,
                name: profileData.name,
                photoUrl: profileData.photoUrl,
              ),
            ],
          );
        },
      ),
    );
  }
}

