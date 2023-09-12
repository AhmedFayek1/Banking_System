
import 'package:banking_system/Cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../models/customer_model.dart';
import '../models/transaction_model.dart';

class BankingAppCubit extends Cubit<BankingAppStates> {
  BankingAppCubit() : super(BankingAppInitialState());

  static BankingAppCubit get(context) => BlocProvider.of(context);
  Database? database;
  List<Map> databaseCustomers = [];
  Map? myAccount;

  Future<void> openDatabaseAndCreateTables() async {
    try {
      database = await
      openDatabase('customer.db', // Use a proper database file name
        version: 5,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE customer (
              id INTEGER PRIMARY KEY,
              name TEXT,
              email TEXT,
              address TEXT,
              balance INTEGER
            )
          ''');
          await db.execute('''
            CREATE TABLE trans (
              id INTEGER PRIMARY KEY,
              sender TEXT,
              receiver TEXT,
              amount INTEGER,
              date TEXT,
              time TEXT
            )
          ''');
        },
      );

      emit(BankingAppCreateDatabaseState());
      await insertDummyData();
      await getData(database!);
    } catch (error) {
      emit(BankingAppCreateDatabaseErrorState());
    }
  }

  Future<void> insertDummyData() async {

    for (int i = 0; i < customers.length ; i++) {
      await insertCustomerData(customer: customers[i]);
    }
  }

  Future<void> insertCustomerData({required Customer customer}) async {
    final db = database;
    if (db == null) {
      emit(BankingAppInsertDatabaseErrorState());
      return;
    }

    try {
      await db.transaction((txn) async {
        await txn.rawInsert(
          'INSERT INTO customer (id, name, email, address, balance) VALUES (?, ?, ?, ?, ?)',
          [
            customer.id,
            customer.name,
            customer.email,
            customer.address,
            customer.balance,
          ],
        );
        emit(BankingAppInsertDatabaseState());
      });
    } catch (error) {
      emit(BankingAppInsertDatabaseErrorState());
    }
  }

  Future<void> getData(Database database) async {
    try {
      final result = await database.rawQuery('SELECT * FROM customer');
      databaseCustomers = result.toList();
      myAccount = databaseCustomers[0];
      databaseCustomers.remove(databaseCustomers[0]);
      final result1 = await database.rawQuery('SELECT * FROM trans');
      databaseTransactions = result1.toList();
      emit(BankingAppGetDataState());
    } catch (error) {
      emit(BankingAppGetDataErrorState());
    }
  }

  // Transaction Database
  List<Map> databaseTransactions = [];

  Future<void> insertTransactionData({required CustomerTransaction transaction}) async {
    final db = database;
    if (db == null) {
      emit(BankingAppInsertDatabaseErrorState());
      return Future.value();
    }

    await db.transaction((txn) async {
      try {
        await txn.rawInsert(
            'INSERT INTO trans (id, sender, receiver, amount, date, time) VALUES (?, ?, ?, ?, ?, ?)',
            [
              transaction.id,
              transaction.sender,
              transaction.receiver,
              transaction.amount,
              transaction.date,
              transaction.time
            ]);
        emit(BankingAppInsertDatabaseState());
      } catch (error) {
        emit(BankingAppInsertDatabaseErrorState());
      }
    });
  }

  void transferMoney({required int amount, required Map receiver}) async {
    database?.rawUpdate('UPDATE customer SET balance = ? WHERE id = ?',
        [receiver['balance'] + amount, receiver['id']]); // Update receiver balance

    database?.rawUpdate('UPDATE customer SET balance = ? WHERE id = ?',
        [myAccount!['balance'] - amount, myAccount!['id']]); // Update receiver balance
    //insert into transaction table
    await insertTransactionData(
      transaction: CustomerTransaction(
        id: databaseTransactions.length + 1,
        sender: '${myAccount!['name']} You',
        receiver: receiver['name'],
        amount: amount,
        date: DateTime.now().toString().substring(0, 10),
        time: DateTime.now().toString().substring(11, 16),
      ),
    );

    emit(BankingAppTransferMoneyState());
    getData(database!);
  }
}
