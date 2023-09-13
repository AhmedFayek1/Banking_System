import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/cubit.dart';
import '../Cubit/states.dart';
import '../Shared/colors.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankingAppCubit,BankingAppStates>(
      listener: (context,state) =>  {},
      builder: (context,state) => Drawer(

        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: mainColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: Text(BankingAppCubit.get(context).myAccount!['name'][0],style: const TextStyle(fontSize: 40),),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      BankingAppCubit.get(context).myAccount!['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text("Your Account"),
            ),
            const ListTile(
              leading: Icon(Icons.group),
              title: Text("Customers"),
            ),
            const ListTile(
              leading: Icon(Icons.history),
              title: Text("Transaction History"),
            ),
            const ListTile(
              leading: Icon(Icons.money),
              title: Text("Add Balance"),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text("Contact Us"),
            ),
            const ListTile(
              leading: Icon(Icons.support),
              title: Text("Support"),
            ),
            const ListTile(
              leading: Icon(Icons.store),
              title: Text("Our Branches"),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
