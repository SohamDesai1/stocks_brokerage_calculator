// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables
import '../widgets/results.dart';
import 'package:flutter/material.dart';

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
  var totalSell, totalBuy;
  var brokerage, sd, stt, etc, sebi, gst;
  var totalTax, profit;
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
                  getBreakdown();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Results(
                          stock: stock.text,
                          totalTax: totalTax,
                          profit: profit,
                          brokerage: brokerage,
                          stt: stt,
                          etc: etc,
                          sd: sd,
                          gst: gst,
                          sebi: sebi),
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

  void getBreakdown() {
    var quantityVal = double.parse(quantity.text);
    var buyVal = double.parse(buy.text);
    var sellVal = double.parse(sell.text);
    totalSell = quantityVal * sellVal;
    totalBuy = quantityVal * buyVal;
    var b1 = (0.05 / 100) * totalSell;
    var b2 = 20;
    if (b1 > b2) {
      brokerage = b2 * 2;
    } else {
      brokerage = b1 * 2;
    }
    stt = totalSell * (0.025 / 100);
    sd = totalBuy * (0.003 / 100);
    etc = (totalBuy * (0.00325 / 100)) + (totalSell * (0.00325 / 100));
    sebi = (totalBuy * (0.0001 / 100)) + (totalSell * (0.0001 / 100));
    gst = ((18 / 100) * brokerage) + ((18 / 100) * etc);
    totalTax = brokerage + stt + sd + etc + sebi + gst;
    profit = ((sellVal - buyVal) * quantityVal) - totalTax;
  }
}
