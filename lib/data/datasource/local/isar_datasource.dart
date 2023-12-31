import 'package:isar/isar.dart';
import 'package:movie_clean_arch/domain/entities/movie.dart';
import 'package:movie_clean_arch/domain/usecase/local_storage_usecase.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageUseCase {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      var documentsDirectory = await getApplicationDocumentsDirectory();
      var dbPath = documentsDirectory.path;
      return await Isar.open([MovieSchema], directory: dbPath);
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isFavorite(int movieId) async {
    final isar = await db;
    final Movie? isFavoriteMovie =
        await isar.movies.filter().idEqualTo(movieId).findFirst();
    return isFavoriteMovie != null;
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    final isar = await db;
    return isar.movies.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;
    final favoriteMovie =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();

    if (favoriteMovie != null) {
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.isarId!));
      return;
    }
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }
}
