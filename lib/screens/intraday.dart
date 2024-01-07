// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import '../utils/charges.dart';
import '../widgets/results.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: Intraday()),
  );
}

class Intraday extends StatefulWidget {
  const Intraday({super.key});

  @override
  State<Intraday> createState() => IntradayState();
}

class IntradayState extends State<Intraday> {
  var stock = TextEditingController();
  var quantity = TextEditingController();
  var buy = TextEditingController();
  var sell = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text("Groww Brokerage \nCalculator"),
      ),
      body: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Intraday",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: stock,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter Name of Stock",
                  labelText: "Stock",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: quantity,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter the quantity",
                  labelText: "Quantity",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: buy,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Buy Price",
                  labelText: "BUY",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: sell,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Sell Price",
                  labelText: "SELL",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  var charges = IntradayTrade.breakdown(
                      quantity.text, buy.text, sell.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Results(
                        stock: stock.text,
                        brokerage: charges[0],
                        gst: charges[1],
                        sebi: charges[2],
                        etc: charges[3],
                        stt: charges[4],
                        sd: charges[5],
                        totalTax: charges[6],
                        profit: charges[7],
                        turnover: charges[8],
                      ),
                    ),
                  );
                },
                child: Text("Calculate"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
