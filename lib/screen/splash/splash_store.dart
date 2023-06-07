import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/store/store.dart';

class SplashStore extends Cubit<bool> {
  final AttributeStore attributeStore;
  final ConfigStore configStore;

  SplashStore({
    required this.attributeStore,
    required this.configStore,
  }) : super(false);

  Future init() async {
    emit(true);
    await Future.wait([
      attributeStore.init(),
      configStore.init(),
    ]);
    emit(false);
  }
}
