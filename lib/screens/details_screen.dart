import 'package:flutter/material.dart';
import 'package:flutter_app_cap7/widgets/casting_cards.dart';

import '../models/models.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie: movie),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              _PosterAndTitle(movie: movie),
              const SizedBox(height: 20),
              _Overview(movie: movie),
              CastingCards(movieId: movie.id),
            ]),
          ),
          // const SliverFillRemaining(
          //   hasScrollBody: true,
          //   child: Text('ddddd'),
          // ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar({required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.amber,
      expandedHeight: 200,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: const Text('Populares'),
        background: FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image: NetworkImage(movie.fullBackdropPath),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter),
      ),
    );
  }
}
// 'https://scontent.fvlc4-1.fna.fbcdn.net/v/t31.18172-8/13735040_10209293401032695_798583454244267084_o.jpg?_nc_cat=104&ccb=1-7&_nc_sid=174925&_nc_ohc=Ewpt3FkHS8UAX-pEZEe&_nc_ht=scontent.fvlc4-1.fna&oh=00_AfCPpPMzWCzgceMaMMwblkUoa1mYkMT5M44QgSn5C10v3g&oe=65462341'

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle({required this.movie});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(23),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
                height: 120,
                width: 100,
              ),
            ),
          ),
          const SizedBox(width: 10),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  movie.title,
                  style: const TextStyle(
                      fontSize: 23, overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                ),
                Text(movie.originalTitle, style: textTheme.bodySmall),
                Row(
                  children: [
                    Text(movie.originalLanguage, style: textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;

  const _Overview({required this.movie});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
