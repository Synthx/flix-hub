import 'package:live_coding/core/core.dart';
import 'package:live_coding/data/data.dart';

class ConfigurationService {
  Future<ConfigDetails> load() async {
    final response = await http.get('configuration');
    final data = response.data;

    return ConfigDetails.fromJson(data);
  }
}
