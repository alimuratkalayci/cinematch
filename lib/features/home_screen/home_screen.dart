import 'package:cinematch/components/custom_app_bar.dart';
import 'package:cinematch/features/home_screen/provider/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/ui_theme.dart';
import '../../core/localization/app_localizations.dart';
import 'components/movie_card.dart';
import 'details_pages/movie_details_page/movie_details_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeScreenProvider>().fetchMovies();
    });

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll >= maxScroll * 0.9) {
      final provider = context.read<HomeScreenProvider>();
      if (!provider.isLoading && provider.hasMore) {
        provider.fetchMovies();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeScreenProvider>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(title: 'explore'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                AppLocalizations.of(context)!.translate('movies'),
                style: CustomTextStyle.circular18px600wWhite,
              ),
            ),
            if (provider.error != null)
              Expanded(
                child: Center(
                  child: Text(
                    'Hata: ${provider.error}',
                    style: CustomTextStyle.circular13px400wWhite,
                  ),
                ),
              ),
            if (provider.isLoading && provider.movies.isEmpty)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            if (provider.movies.isNotEmpty)
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => provider.fetchMovies(isRefresh: true),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount:
                        provider.movies.length + (provider.hasMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == provider.movies.length) {
                        return provider.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : const SizedBox.shrink();
                      }

                      final movie = provider.movies[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailPage(movie: movie)),
                          );
                        },
                        child: MovieCard(
                          movie: movie,
                          onFavoriteToggle: () =>
                              provider.toggleFavorite(movie.movieId),
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
