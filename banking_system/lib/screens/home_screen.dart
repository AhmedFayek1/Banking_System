import 'package:banking_system/screens/view_transactions_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit/cubit.dart';
import '../Cubit/states.dart';
import '../Shared/colors.dart';
import 'customers_screen.dart';
import 'my_profile_screen.dart';
import 'nav_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankingAppCubit,BankingAppStates>(
      listener: (context,state) {},
      builder: (context,state) {
        return SafeArea(
          child: Scaffold(
            drawer:  const NavDrawer(),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu,color: Colors.black,size: 30,),
                  onPressed: () => Scaffold.of(context).openDrawer()
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications,color: Colors.black,size: 30,),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.person,color: Colors.black,size: 30,),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyProfile(),
                      ),
                    );
                  },
                ),
              ],
              title: const Text('Customers'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50,),
                  const Text("Welcome to",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  const Text("Spark Foundation Bank", style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.red),),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Image.asset("assets/images/bank_logo1.png",height: 300,width: 300,)),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyProfile(),
                          ),
                        );
                      },
                      child: const Text('Profile',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
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
                      child: const Text('View all customers',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TransactionsScreen(),
                          ),
                        );
                      },
                      child: const Text('Transaction history',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ),
                ],
              ),
            )
          ),
        );
      },
    );
  }
}
