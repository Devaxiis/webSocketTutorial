import 'package:flutter/material.dart';
import 'package:web_socket/model/order_model.dart';
import 'package:web_socket/servcie/socket_servcie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  OrderBook? orderBook;

  @override
  void initState() async {
        super.initState();
       SocketService.read().listen((event) {
         orderBook = event;
         setState(() {});
       });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text("Web Socket Learning",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),),
         centerTitle: true,
       ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("Symbol", style: Theme.of(context).textTheme.titleMedium,),
                const SizedBox(width: 20,),
                Expanded(child: Text( orderBook?.symbol.toString()?? "No data", style: Theme.of(context).textTheme.bodyMedium,)),
              ],
            ),

            Row(
              children: [
                Text("Data", style: Theme.of(context).textTheme.titleMedium,),
                const SizedBox(width: 20,),
                Expanded(child: Text("${orderBook?.symbol}" ?? "No data", style: Theme.of(context).textTheme.bodyMedium,)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    SocketService.close();
  }
}
