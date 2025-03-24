import 'package:get_it/get_it.dart';
import '../repositories/user_repository.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => UserRepository());
}
