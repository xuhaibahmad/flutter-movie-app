import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

mixin AutoResetLazySingleton<E, S> on Bloc<E, S> {
  @override
  Future<void> close() {
    final locator = GetIt.instance;
    if (locator.isRegistered<Bloc<E, S>>(instance: this)) {
      locator.resetLazySingleton<Bloc<E, S>>(instance: this);
    }
    return super.close();
  }
}
