import 'package:flutter/material.dart';
import '../controllers/movie_detail_controller.dart';
import '../widgets/centered_message.dart';
import '../widgets/centered_progress.dart';
import '../widgets/chip_date.dart';
import '../widgets/rate.dart';
import '../widgets/chip_language.dart';
import '../widgets/chip_genres.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;

  MovieDetailPage(this.movieId);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final _controller = MovieDetailController();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fetchMovieById(widget.movieId);

    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildMovieDetail(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(_controller.movieDetail?.title ?? ''),
    );
  }

  _buildMovieDetail() {
    if (_controller.loading) {
      return CenteredProgress();
    }

    if (_controller.movieError != null) {
      return CenteredMessage(message: _controller.movieError.message);
    }

    return ListView(
      children: [
        _buildCover(),
        _buildStatus(),
        _buildGenres(),
        _buildOriginalLanguage(),
        _buildOverview(),
        _buildHomePage()
      ],
    );
  }

  _buildOverview() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Text(
        _controller.movieDetail.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }

  _buildHomePage() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Text(
        _controller.movieDetail.homepage,
        textAlign: TextAlign.justify,
        style: TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  _buildStatus() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Rate(_controller.movieDetail.voteAverage),
          ChipDate(date: _controller.movieDetail.releaseDate),
        ],
      ),
    );
  }

  _buildOriginalLanguage() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Row(children: [
        Text("Language: "),
        ChipLanguage(_controller.movieDetail.originalLanguage),
      ]),
    );
  }

  _buildCover() {
    return FancyShimmerImage(
      imageUrl:
          'https://image.tmdb.org/t/p/w500${_controller.movieDetail.backdropPath}',
      shimmerBaseColor: Colors.black,
      shimmerBackColor: Colors.blueGrey,
      shimmerHighlightColor: Colors.white,
      errorWidget: Image.network(
          'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
    );
  }

  _buildGenres() {
    return Wrap(alignment: WrapAlignment.center, children: <Widget>[
      for (var genre in _controller.movieDetail.genres)
        Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Row(children: [
            Text("Genre: "),
            ChipGenres(genre.name),
          ]),
        ),
    ]);
  }
}
