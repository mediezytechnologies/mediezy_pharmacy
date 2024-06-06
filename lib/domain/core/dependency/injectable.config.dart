// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/auth_bloc/auth_bloc.dart' as _i8;
import '../../../application/new_order/new_bloc_bloc.dart' as _i7;
import '../../../infrastructure/auth/auth_impl.dart' as _i4;
import '../../../infrastructure/get_new_orders/get_new_orders_impl.dart' as _i6;
import '../../auth/auth_service.dart' as _i3;
import '../../get_new_orders/get_new_orders_service.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AuthService>(() => _i4.AuthServiceImpl());
  gh.lazySingleton<_i5.GetNewOrdersService>(() => _i6.GetNewOrdersImpl());
  gh.factory<_i7.NewBlocBloc>(
      () => _i7.NewBlocBloc(get<_i5.GetNewOrdersService>()));
  gh.factory<_i8.AuthBloc>(() => _i8.AuthBloc(get<_i3.AuthService>()));
  return get;
}
