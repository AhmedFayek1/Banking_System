import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Cubit/cubit.dart';
import '../Cubit/states.dart';
import '../Shared/colors.dart';

class TransferMoneyScreen extends StatelessWidget {
  final Map receiver;
  const TransferMoneyScreen({Key? key, required this.receiver}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankingAppCubit, BankingAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        TextEditingController money = TextEditingController();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: color,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text('Transfer Money'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(

              children: [
                const SizedBox(height: 20,),
                CircleAvatar(
                  backgroundColor: color,
                  radius: 80.0,
                  child: Text('${receiver['name'][0]}',style: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: money,
                    decoration: const InputDecoration(
                      labelText: 'Enter Amount',
                      prefixIcon: Icon(Icons.money),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 10,
                  color: color,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text("From: ",style: TextStyle(fontSize: 20,color: Colors.white),),
                            Text("${BankingAppCubit.get(context).myAccount!['name']!} (You)",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            const Text("To: ",style: TextStyle(fontSize: 20,color: Colors.white),),
                            Text("${receiver['name']}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                Container(
                  width: 200,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  child: MaterialButton(
                    onPressed: () async {
                      return showDialog(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog( // <-- SEE HERE
                            title: const Text('Confirmation'),

                            content: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Text("Are you sure you want to send ${money.text} LE to ${receiver['name']} ?"),
                                  const SizedBox(height: 20,),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextButton(
                                          child: const Text('Confirm',style: TextStyle(color: Colors.black),),
                                          onPressed: () {
                                            if(int.parse(money.text) <= BankingAppCubit.get(context).myAccount!['balance'])
                                              {
                                                BankingAppCubit.get(context).transferMoney(amount: int.parse(money.text), receiver: receiver);
                                                Fluttertoast.showToast(msg: "Success",gravity: ToastGravity.BOTTOM,backgroundColor: Colors.green);
                                              }
                                            else
                                              {
                                                Fluttertoast.showToast(msg: "Your Balance is not Sufficient",gravity: ToastGravity.BOTTOM,backgroundColor: Colors.red);
                                              }
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: TextButton(
                                          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          );
                        },
                      );

                    },
                    child: const Text('Transfer', style: TextStyle(color: Colors.white, fontSize: 20.0)),
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