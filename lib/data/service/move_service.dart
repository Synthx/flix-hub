import 'package:live_coding/core/core.dart';
import 'package:live_coding/data/data.dart';

class MovieService {
  Future<List<MoviePreview>> findPopular() async {
    final page = await findAll();

    return page.results;
  }

  Future<List<MoviePreview>> findUpcoming() async {
    final now = DateTime.now();
    final page = await findAll(
      releaseTypes: [2, 3],
      releaseDate: Range(
        min: now,
        max: now.add(const Duration(days: 7)),
      ),
    );

    return page.results;
  }

  Future<List<MoviePreview>> findNowPlaying() async {
    final page = await findAll();

    return page.results;
  }

  Future<Page<MoviePreview>> findAll({
    String sortBy = 'popularity.desc',
    int page = 1,
    List<int>? releaseTypes,
    Range<DateTime>? releaseDate,
  }) async {
    final Map<String, dynamic> params = {
      'include_adult': false,
      'include_video': false,
      'sort_by': sortBy,
      'page': page,
    };
    if (releaseTypes != null) {
      params['with_release_type'] = releaseTypes.join('|');
    }
    if (releaseDate != null) {
      params['release_date.gte'] = releaseDate.min?.toIso8601String();
      params['release_date.lte'] = releaseDate.max?.toIso8601String();
    }

    final response = await http.get(
      'discover/movie',
      queryParameters: params,
    );

    return Page.fromJson(
      response.data,
      (e) => MoviePreview.fromJson(e as Map<String, dynamic>),
    );
  }

  Future<Movie> findById(int id) async {
    final response = await http.get(
      'movie/$id',
      queryParameters: {
        'append_to_response': 'videos,keywords',
      },
    );

    return Movie.fromJson(response.data);
  }
}
