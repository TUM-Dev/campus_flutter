import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';

part 'cache_entry.g.dart';

class CacheEntry extends Table {
  IntColumn get id => integer()();
  TextColumn get url => text()();
  DateTimeColumn get validUntil => dateTime()();
  DateTimeColumn get saved => dateTime()();
  TextColumn get body => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [CacheEntry])
class CacheDatabase extends _$CacheDatabase {
  CacheDatabase() : super(_openConnection());

  CacheDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      if (from < 3) {
        // Legacy entries contain bearer URLs or plaintext card data.
        await customStatement('PRAGMA secure_delete = ON');
        await m.deleteTable(cacheEntry.actualTableName);
        await m.createTable(cacheEntry);
      }
    },
  );
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // Disposable cache data belongs outside backed-up Documents storage.
    final legacyFolder = await getApplicationDocumentsDirectory();
    for (final suffix in ['', '-wal', '-shm', '-journal']) {
      final legacy = File(p.join(legacyFolder.path, 'db.sqlite$suffix'));
      if (await legacy.exists()) await legacy.delete();
    }
    final dbFolder = await getApplicationCacheDirectory();
    await dbFolder.create(recursive: true);
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
