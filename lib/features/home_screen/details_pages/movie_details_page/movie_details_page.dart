import 'package:flutter/material.dart';
import 'package:cinematch/features/home_screen/models/movie_list_models.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import '../../../../constants/ui_theme.dart';
import '../../../profile_screen/provider/profile_page_provider.dart';
import '../../provider/home_screen_provider.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  bool _isFavorite = false;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.movie.isFavorite;
    print(_isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPosterImage(screenSize),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(widget.movie.title,
                              style: CustomTextStyle.circular18px600wWhite),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: _buildExpandableText(),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // context.read<ProfilePageProvider>().fetchProfileDatas();
                            context.read<ProfilePageProvider>().fetchMovies();
                            // context.read<HomeScreenProvider>().fetchMovies();
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonRed,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Geri',
                            style: CustomTextStyle.circular15px500wWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableText() {
    const int maxLength = 60;
    String fullText = widget.movie.plot;
    bool isLongText = fullText.length > maxLength;
    String shortText =
        isLongText ? "${fullText.substring(0, maxLength)}..." : fullText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.movie.released,
          style: CustomTextStyle.circular13px400wWhite.copyWith(color: AppColors.buttonRed),
        ),
        Text(
          widget.movie.genre,
          style: CustomTextStyle.circular13px400wWhite.copyWith(color: AppColors.buttonRed),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            _isExpanded ? fullText : shortText,
            style: CustomTextStyle.circular13px400wWhite,
          ),
        ),
        if (isLongText)
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? "Daha Az" : "Daha Fazlası",
              style: CustomTextStyle.circular13px700wWhite,
            ),
          ),
      ],
    );
  }

  Widget _buildPosterImage(Size screenSize) {
    String imageUrl = widget.movie.poster;

    // Eğer HTTP kullanılıyorsa HTTPS olarak değiştir
    if (imageUrl.startsWith("http://")) {
      imageUrl = imageUrl.replaceFirst("http://", "https://");
    }

    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.7,
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return _buildFallbackImage();
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80, // Gradient yüksekliği
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.backgroundColor.withOpacity(0.8),
                    AppColors.backgroundColor,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(82),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                  child: IconButton(
                    icon: Icon(
                      _isFavorite ? IconlyBold.heart : IconlyBold.heart,
                      color: _isFavorite ? AppColors.buttonRed : Colors.white,
                      size: 32,
                    ),
                    onPressed: () {
                      context
                          .read<HomeScreenProvider>()
                          .toggleFavorite(widget.movie.id);
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFallbackImage() {
    return Container(
      color: Colors.grey[900],
      height: 300,
      width: double.infinity,
      child: Center(
        child: Text(
          widget.movie.title.isNotEmpty
              ? widget.movie.title[0].toUpperCase()
              : "?",
          style: const TextStyle(
              color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
