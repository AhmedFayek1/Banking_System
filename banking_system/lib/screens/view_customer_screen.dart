import 'package:banking_system/screens/transfer_money_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/cubit.dart';
import '../Cubit/states.dart';
import '../Shared/colors.dart';

class SelectedCustomer extends StatelessWidget {
  final Map customer;
  const SelectedCustomer({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankingAppCubit,BankingAppStates>(
      listener: (context,state) {},
      builder: (context,state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(customer['name']),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: mainColor,
                  radius: 80.0,
                  child: Text('${customer['name'][0]}',style: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Card(
                  color: mainColor,
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                            children: [
                              const Text("Name: ",style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),),
                              Text(
                                '${customer['name']}',
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                    color: Colors.white

                                ),
                              ),]
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            const Text("Email: ",style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                                color: Colors.white

                            ),),
                            Text(
                              '${customer['email']}',
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                  color: Colors.white

                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            const Text("Address: ",style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                                color: Colors.white

                            ),),
                            Text(
                              '${customer['address']}',
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                  color: Colors.white

                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            const Text("Balance: ",style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                                color: Colors.white

                            ),),
                            Text(
                              '${customer['balance']} LE',
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                  color: Colors.white

                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransferMoneyScreen(receiver: customer,),
                        ),
                      );
                    },
                    child: const Text('Transfer Money',style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
