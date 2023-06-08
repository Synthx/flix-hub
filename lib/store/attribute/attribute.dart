import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/data/data.dart';

import 'attribute_state.dart';

export 'attribute_state.dart';

class AttributeStore extends Cubit<AttributeState> {
  final AttributeService attributeService;

  AttributeStore({
    required this.attributeService,
  }) : super(initialAttributeState);

  Future init() async {
    final [genres] = await Future.wait([
      attributeService.findAllGenres(),
    ]);
    emit(state.copyWith(
      genres: genres,
      languages: [],
    ));
  }
}
