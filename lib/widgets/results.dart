import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final String stock;
  final double turnover;
  final double totalTax;
  final double profit;
  final double brokerage;
  final double stt;
  final double etc;
  final double sd;
  final double gst;
  final double sebi;
  const Results({
    super.key,
    required this.stock,
    required this.turnover,
    required this.totalTax,
    required this.profit,
    required this.brokerage,
    required this.stt,
    required this.etc,
    required this.sd,
    required this.gst,
    required this.sebi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Stock Name "),
                  Text('Turnover'),
                  Text("Brokerage "),
                  Text("Settlement Charges "),
                  Text("Stamp Duty "),
                  Text("Exchange Charges "),
                  Text("SEBI Charges "),
                  Text("GST Charges"),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(stock),
                  Text("$turnover"),
                  Text("$brokerage"),
                  Text("$stt"),
                  Text("$sd"),
                  Text("$etc"),
                  Text("$sebi"),
                  Text("$gst"),
                ],
              ),
            ],
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: const Divider(
                thickness: 1,
                // endIndent: 300,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total Charges applied "),
                  Text("Total Profit "),
                ],
              ),
              const SizedBox(
                width: 35,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$totalTax"),
                  Text("$profit"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
