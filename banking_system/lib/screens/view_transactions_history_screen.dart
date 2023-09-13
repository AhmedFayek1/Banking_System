import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit/cubit.dart';
import '../Cubit/states.dart';
import '../Shared/colors.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankingAppCubit, BankingAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BankingAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text('Transactions'),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemBuilder: (context, index) => buildTransactionItem(cubit.databaseTransactions[index]),
            itemCount: cubit.databaseTransactions.length,
          ),
        );
      },
    );

  }

  Widget buildTransactionItem(Map transaction) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
    child: Card(
      elevation: 20.0,
      color: mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sender: ${transaction['sender']}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Receiver: ${transaction['receiver']}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Amount: ${transaction['amount']} LE',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Date: ${transaction['date']}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Time: ${transaction['time']}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
