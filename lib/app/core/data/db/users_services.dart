import 'package:app_hiseg_test/app/core/data/model/users.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UsersService extends ChangeNotifier {
  //o banco de dados declarado como late sera inicializado na primeira leitura
  late Database db;

  Future<UsersService> init() async {
    db = await getDatabase();
    print("dbiniciou");
    //criar users de teste
    final users = Users(
        name: 'João',
        age: '25',
        cpf: "222.222.222-22",
        localization: "Fortaleza - CE",
        password: "123456",
        tipeUser: "L");
    await save(users);
    await getAll(users);

    return this;
  }

  Future<Database> getDatabase() async {
    // Recupera pasta da aplicacao
    var databasesPath = await getDatabasesPath();
    // Recupera caminho da database e excluir database
    // String path = join(databasesPath, 'notes.db');
    // descomente o await abaixo para excluir a base de dados do caminho
    // recuperado pelo path na inicializacao
    // await deleteDatabase(path);
    // Retorna o banco de dados aberto
    return db = await openDatabase(
      join(databasesPath, 'users.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT,localization TEXT,age TEXT,cpf TEXT,password TEXT,typeuser TEXT)');
      },
      version: 1,
    );
  }

  // recuperar todas as notas
  Future<List<Users>> getAll(Users users) async {
    final result = await db.rawQuery('SELECT * FROM users ORDER BY id');
    print(result);
    return result.map((json) => Users.fromJson(json)).toList();
  }

  //criar nova nota
  Future<Users> save(Users users) async {
    final id = await db.rawInsert(
        'INSERT INTO users (name, localization, age,cpf,password,typeuser) VALUES (?,?,?,?,?,?)',
        [
          users.name,
          users.localization,
          users.age,
          users.cpf,
          users.password,
          users.tipeUser
        ]);

    print(id);
    return users.copy(id: id);
  }

  //atualizar nota
  Future<Users> update(Users users) async {
    final id = await db.rawUpdate(
        'UPDATE notes SET name = ?, localization = ?, age = ?, WHERE id = ?',
        [users.name, users.localization, users.age, users.id]);

    print(id);
    return users.copy(id: id);
  }

  //excluir nota
  Future<int> delete(int usersId) async {
    final id = await db.rawDelete('DELETE FROM notes WHERE id = ?', [usersId]);

    print(id);
    return id;
  }

  deleteAll() async {
    try {
      await db.delete('users');
    } catch (ex) {
      print(ex);
    }
  }

  //fechar conexao com o banco de dados, funcao nao usada nesse app
  Future close() async {
    db.close();
  }

  Future<void> login(Users users) async {
    try {
      print(users.password.toString());
      print(users.cpf.toString());

      final login = await db.rawQuery(
          'SELECT * FROM users WHERE cpf=? AND password =? ',
          [users.cpf, users.password]);
      print("passei aqui");

      if (login.isEmpty) {
        throw (['MENSAGEM']);
      }

      print(login);
    } catch (e) {
      rethrow;
    }
  }
}
