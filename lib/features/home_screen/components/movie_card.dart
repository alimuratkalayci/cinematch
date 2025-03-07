import 'package:cinematch/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iconly/iconly.dart';
import '../../../constants/ui_theme.dart';
import '../models/movie_list_models.dart';

class MovieCard extends StatefulWidget {
  final Movie movie;
  final VoidCallback onFavoriteToggle;

  const MovieCard({
    Key? key,
    required this.movie,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider(
                items: widget.movie.images.map((imageUrl) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey.withOpacity(0.2),
                          child: const Icon(Icons.movie, color: Colors.white),
                        );
                      },
                    ),
                  );
                }).toList(),
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  viewportFraction: 1.0,
                  autoPlay: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.movie.images.length,
                    (index) => Container(
                      width: _currentIndex == index ? 8 : 6,
                      height: _currentIndex == index ? 8 : 6,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.movie.title,
                        style: CustomTextStyle.circular18px600wWhite,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${widget.movie.year} • ${AppLocalizations.of(context)!.translate('${widget.movie.genre.split(',').first.trim()}')}',
                        style: CustomTextStyle.circular13px400wWhite
                            .copyWith(color: Colors.white.withOpacity(0.7)),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(IconlyBold.star,
                              color: Colors.amber, size: 13),
                          const SizedBox(width: 4),
                          Text(
                            widget.movie.imdbRating,
                            style: CustomTextStyle.circular13px400wWhite,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
