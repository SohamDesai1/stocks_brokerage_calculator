// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class FNO extends StatefulWidget {
  const FNO({super.key});

  @override
  State<FNO> createState() => _FNOState();
}

class _FNOState extends State<FNO> {
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
        title: const Text("Groww Brokerage \nCalculator"),
      ),
      body: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Options",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
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
              const SizedBox(
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
              const SizedBox(
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
              const SizedBox(
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
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  getBreakdown();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Display(
                              stock: stock.text,
                              totalTax: totalTax,
                              profit: profit,
                              brokerage: brokerage,
                              stt: stt,
                              etc: etc,
                              sd: sd,
                              gst: gst,
                              sebi: sebi)));
                },
                child: const Text("Calculate"),
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
    stt = totalSell * (0.0625 / 100);
    sd = totalBuy * (0.003 / 100);
    etc = (totalBuy * (0.05 / 100)) + (totalSell * (0.05 / 100));
    sebi = (totalBuy * (0.0001 / 100)) + (totalSell * (0.0001 / 100));
    gst = ((18 / 100) * brokerage) + ((18 / 100) * etc);
    totalTax = brokerage + stt + sd + etc + sebi + gst;
    profit = ((sellVal - buyVal) * quantityVal) - totalTax;
  }
}

class Display extends StatefulWidget {
  const Display({
    super.key,
    required this.stock,
    required this.totalTax,
    required this.profit,
    required this.brokerage,
    required this.stt,
    required this.etc,
    required this.sd,
    required this.gst,
    required this.sebi,
  });

  final stock, totalTax, profit, brokerage, stt, sd, etc, sebi, gst;

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Stock Name : ${widget.stock}"),
            Text("Total Charges applied : ${widget.totalTax}"),
            Text("Total Profit : ${widget.profit}"),
            Text("Brokerage : ${widget.brokerage}"),
            Text("Settlement Charges : ${widget.stt}"),
            Text("Stamp Duty : ${widget.sd}"),
            Text("Exchange Charges : ${widget.etc}"),
            Text("SEBI Charges : ${widget.sebi}"),
            Text("GST Charges: ${widget.gst}"),
          ],
        ),
      ),
    );
  }
}
