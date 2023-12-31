import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_clean_arch/data/datasource/local/isar_datasource.dart';

import '../../../data/repository/local/local_storage_repository_impl.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});
