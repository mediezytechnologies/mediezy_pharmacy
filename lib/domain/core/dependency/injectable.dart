import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_medical/domain/core/dependency/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection() async {
  await $initGetIt(getIt, environment: Environment.prod);
}
