// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class SqlDb1 {
//   static Database? _db;
//
//   Future<Database?> get db async {
//     if (_db == null) {
//       _db = await intialDb();
//       return _db;
//     } else {
//       return _db;
//     }
//   }
//
//   intialDb() async {
//     String databasepath = await getDatabasesPath();
//     String path = join(databasepath, 'expensees.db');
//     Database mydb = await openDatabase(path,
//         onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
//     return mydb;
//   }
//
//   _onUpgrade(Database db, int oldversion, int newversion) async {
//     print("onUpgrade =====================================");
//     //await db.execute("ALTER TABLE expensees ADD COULMN color Text");
//   }
//
//   _onCreate(Database db, int version) async {
//     await db.execute('''
//   CREATE TABLE "databalance"(
//     "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
//     "nameUser" TEXT ,
//     "balance" REAL NOT NULL ,
//     "save" REAL
//   )
// ''');
//
//     print(" onCreate =====================================");
//   }
//
//   readData1(String sql) async {
//     Database? mydb = await db;
//     List<Map> response = await mydb!.rawQuery(sql);
//     return response;
//   }
//
//   insertData1(String sql) async {
//     Database? mydb = await db;
//     int response = await mydb!.rawInsert(sql);
//     return response;
//   }
//
//   updateData(String sql) async {
//     Database? mydb = await db;
//     int response = await mydb!.rawUpdate(sql);
//     return response;
//   }
//
//   deleteData(String sql) async {
//     Database? mydb = await db;
//     int response = await mydb!.rawDelete(sql);
//     return response;
//   }
//
// // SELECT
// // DELETE
// // UPDATE
// // INSERT
//
// }
