import 'package:live_coding/core/core.dart';
import 'package:live_coding/data/data.dart';

class AttributeService {
  Future<List<Genre>> findAllGenres() async {
    final response = await http.get('genre/movie/list');
    final data = GenreListResponse.fromJson(response.data);

    return data.genres;
  }

  Future<List<Language>> findAllLanguages() async {
    final response = await http.get('configuration/languages');
    final List data = response.data;

    return data.map((e) => Language.fromJson(e)).toList();
  }
}
