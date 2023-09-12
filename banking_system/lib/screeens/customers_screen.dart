
import 'package:banking_system/screeens/view_customer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/cubit.dart';
import '../Cubit/states.dart';
import '../Shared/colors.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankingAppCubit,BankingAppStates>(
        listener: (context,state) {},
        builder: (context,state) {
          final scrollController = ScrollController();
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
              title: const Text('Customers'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Scrollbar(
                    interactive: true,
                    trackVisibility: true,
                    thumbVisibility: true ,
                    thickness: 50,
                    controller: scrollController,
                    child: ListView.builder(
                      controller: scrollController,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => buildCustomerItem(context: context, customer: cubit.databaseCustomers[index]),
                      itemCount: cubit.databaseCustomers.length,
                    ),
                  ),
                ],
              ),
            )
                // create button to navigate to transactions screen
          );
        }
    );
  }
  Widget buildCustomerItem({required BuildContext context,required Map customer})
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
      child: Card(
        color: Colors.grey[300],
        elevation: 15,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectedCustomer(customer: customer,),
                    ),
                  );
                },
                child: CircleAvatar(
                  backgroundColor: color,
                  radius: 25.0,
                  child: Text('${customer['name'][0]}',style: const TextStyle(color: Colors.white),),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${customer['name']}',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${customer['email']}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Text(
                '${customer['balance']} LE',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
