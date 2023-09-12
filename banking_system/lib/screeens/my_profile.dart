
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/cubit.dart';
import '../Cubit/states.dart';
import '../Shared/colors.dart';
import 'customers_screen.dart';

class MyProfile extends StatelessWidget {

  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankingAppCubit,BankingAppStates>(
      listener: (context,state) {},
      builder: (context,state) {
        var cubit = BankingAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: color,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(cubit.myAccount!['name'] + " (You)"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  radius: 80.0,
                  child: Text('${cubit.myAccount!['name'][0]}',style: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Card(
                  color: color,
                  elevation: 15,
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
                                '${cubit.myAccount!['name']}',
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
                              '${cubit.myAccount!['email']}',
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
                              '${cubit.myAccount!['address']}',
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
                              '${cubit.myAccount!['balance']} LE',
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
                    color: color,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CustomersScreen(),
                        ),
                      );
                    },
                    child: const Text('View all Customers',style: TextStyle(
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
