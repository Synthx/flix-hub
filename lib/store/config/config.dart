import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/data/data.dart';

import 'config_state.dart';

export 'config_state.dart';

class ConfigStore extends Cubit<ConfigState> {
  final ConfigurationService configurationService;

  ConfigStore({
    required this.configurationService,
  }) : super(initialConfigState);

  Future init() async {
    final config = await configurationService.load();
    emit(state.copyWith(
      baseImageUrl: config.images.secureBaseUrl,
    ));
  }
}
