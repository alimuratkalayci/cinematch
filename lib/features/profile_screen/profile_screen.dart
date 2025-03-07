import 'package:cinematch/features/profile_screen/provider/profile_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/custom_app_bar.dart';
import '../../constants/ui_theme.dart';
import 'components/profile_id_card.dart';
import 'components/favorite_movies_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final provider = context.read<ProfilePageProvider>();
    await provider.fetchProfileDatas();
    await provider.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    final profilePageProvider = context.watch<ProfilePageProvider>();
    final profilePagemovies = context.watch<ProfilePageProvider>().movies;
    final profileData = profilePageProvider.profileData;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(title: 'Profil', showLimitedOffer: true),
      body: RefreshIndicator(
        onRefresh: _fetchData,
        child: profileData == null
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
              const SizedBox(height: 10),
              Expanded(
                child: Consumer<ProfilePageProvider>(
                  builder: (context, provider, child) {
                    final favoriteMovies = profilePagemovies;
                    return favoriteMovies.isEmpty
                        ? Center(
                        child: Text('Henüz favori film eklemediniz',style: CustomTextStyle.circular18px600wWhite,))
                        : GridView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: favoriteMovies.length,
                      itemBuilder: (context, index) {
                        final movie = favoriteMovies[index];
                        return FavoriteMoviesCard(movie: movie);
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}