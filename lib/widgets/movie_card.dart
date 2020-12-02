import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class MovieCard extends StatelessWidget {
  final String posterPath;
  final Function onTap;

  const MovieCard({
    Key key,
    this.posterPath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: FancyShimmerImage(
          imageUrl: 'https://image.tmdb.org/t/p/w220_and_h330_face$posterPath',
          shimmerBaseColor: Colors.black87,
          shimmerBackColor: Colors.blueGrey,
          shimmerHighlightColor: Colors.white,
          errorWidget: Image.network(
              'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
        ),
      ),
    );
  }
}
