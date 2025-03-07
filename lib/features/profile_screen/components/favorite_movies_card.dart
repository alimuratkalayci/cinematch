import 'package:cinematch/constants/ui_theme.dart';
import 'package:cinematch/features/profile_screen/models/favorite_movies_model.dart';
import 'package:flutter/material.dart';

class FavoriteMoviesCard extends StatelessWidget {
  final FavoriteMoviesModel movie;

  const FavoriteMoviesCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              movie.images[0],
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: Text(
            movie.title,
            style: CustomTextStyle.circular12px500wWhite,
          ),
        ),
        Text(
          movie.director,
          style: CustomTextStyle.circular12px400wWhiteOpacity50,
        ),
      ],
    );
  }
}
