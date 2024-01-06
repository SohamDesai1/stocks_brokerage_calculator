import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final String stock;
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
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Stock Name : $stock"),
        Text("Brokerage : $brokerage"),
        Text("Settlement Charges : $stt"),
        Text("Stamp Duty : $sd"),
        Text("Exchange Charges : $etc"),
        Text("SEBI Charges : $sebi"),
        Text("GST Charges: $gst"),
        Text("Total Charges applied : $totalTax"),
        Text("Total Profit : $profit"),
      ],
    ));
  }
}
