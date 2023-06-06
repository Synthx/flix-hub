import 'package:live_coding/core/core.dart';
import 'package:live_coding/data/data.dart';

class AttributeService {
  Future<List<Genre>> loadGenres() async {
    final response = await http.get('genre/movie/list');
    final data = GenreListResponse.fromJson(response.data);

    return data.genres;
  }
}
