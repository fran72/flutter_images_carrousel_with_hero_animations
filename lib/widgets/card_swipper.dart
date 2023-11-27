import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import '../models/models.dart';

class CardSwipper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwipper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (movies.isEmpty) {
      return SizedBox(
          width: double.infinity,
          height: size.height * 0.6,
          child: const Center(child: CircularProgressIndicator()));
    }

    return SizedBox(
        width: double.infinity,
        height: size.height * 0.6,
        child: Swiper(
          itemCount: movies.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.width * 0.9,
          pagination: const SwiperPagination(),
          control: const SwiperControl(),
          itemBuilder: (_, index) {
            final movie = movies[index];

            final swipperMovieHeroId = movie.heroId = UniqueKey().toString();

            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'details', arguments: movie),
              child: Hero(
                tag: swipperMovieHeroId,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(21)),
                  child: FadeInImage(
                      placeholder: const AssetImage('assets/no-image.jpg'),
                      image: NetworkImage(movie.fullPosterImg),
                      fit: BoxFit.cover),
                ),
              ),
            );
          },
        ));
  }
}
