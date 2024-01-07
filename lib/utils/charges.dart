class IntradayTrade {
  static List<double> breakdown(String quantity, String buy, String sell) {
    double quantityVal = double.parse(quantity);
    double buyVal = double.parse(buy);
    double sellVal = double.parse(sell);

    double totalSell = quantityVal * sellVal;
    double totalBuy = quantityVal * buyVal;

    double b1 = (0.05 / 100) * totalSell;
    double b2 = 20;
    double brokerage = b1 > b2 ? b2 * 2 : b1 * 2;
    double stt = double.parse((totalSell * (0.025 / 100)).toStringAsFixed(2));
    double sd = double.parse((totalBuy * (0.003 / 100)).toStringAsFixed(2));
    double etc = double.parse(
        ((totalBuy * (0.00325 / 100)) + (totalSell * (0.00325 / 100)))
            .toStringAsFixed(2));
    double sebi = double.parse(
        ((totalBuy * (0.0001 / 100)) + (totalSell * (0.0001 / 100)))
            .toStringAsFixed(2));
    double gst = double.parse(
        (((18 / 100) * brokerage) + ((18 / 100) * etc) + ((18 / 100) * sebi))
            .toStringAsFixed(2));

    double totalTax = double.parse(
        (brokerage + stt + sd + etc + sebi + gst).toStringAsFixed(2));
    double profit = double.parse(
        (((sellVal - buyVal) * quantityVal) - totalTax).toStringAsFixed(2));

    return [
      brokerage,
      gst,
      sebi,
      etc,
      stt,
      sd,
      totalTax,
      profit,
      (totalBuy + totalSell),
    ];
  }
}

class OptionsTrade {
  static List<double> breakdown(String quantity, String buy, String sell) {
    double quantityVal = double.parse(quantity);
    double buyVal = double.parse(buy);
    double sellVal = double.parse(sell);

    double totalSell = quantityVal * sellVal;
    double totalBuy = quantityVal * buyVal;

    double brokerage = 20 + 20;

    double stt = double.parse((totalSell * (0.0625 / 100)).toStringAsFixed(2));
    double sd = double.parse((totalBuy * (0.003 / 100)).toStringAsFixed(2));
    double etc = double.parse(
        ((totalBuy * (0.05 / 100)) + (totalSell * (0.05 / 100)))
            .toStringAsFixed(2));
    double sebi = double.parse(
        ((totalBuy * (0.0001 / 100)) + (totalSell * (0.0001 / 100)))
            .toStringAsFixed(2));
    double gst = double.parse(
        ((((18 / 100) * brokerage) + ((18 / 100) * etc) + ((18 / 100) * sebi)))
            .toStringAsFixed(2));

    double totalTax = double.parse(
        (brokerage + stt + sd + etc + sebi + gst).toStringAsFixed(2));
    double profit = double.parse(
        (((sellVal - buyVal) * quantityVal) - totalTax).toStringAsFixed(2));
    return [
      brokerage,
      gst,
      sebi,
      etc,
      stt,
      sd,
      totalTax,
      profit,
      (totalBuy + totalSell),
    ];
  }
}

class DeliveryTrade {
  static List<double> breakdown(String quantity, String buy, String sell) {
    double quantityVal = double.parse(quantity);
    double buyVal = double.parse(buy);
    double sellVal = double.parse(sell);

    double totalSell = quantityVal * sellVal;
    double totalBuy = quantityVal * buyVal;

    double b1 = (0.05 / 100) * totalSell;
    double b2 = 20;
    double brokerage = b1 > b2 ? b2 * 2 : b1 * 2;

    double stt = double.parse(
        ((totalBuy * (0.1 / 100)) + (totalSell * (0.1 / 100)))
            .toStringAsFixed(2));
    double sd = double.parse((totalBuy * (0.015 / 100)).toStringAsFixed(2));
    double etc = double.parse(
        ((totalBuy * (0.00325 / 100)) + (totalSell * (0.00325 / 100)))
            .toStringAsFixed(2));
    double sebi = double.parse(
        ((totalBuy * (0.0001 / 100)) + (totalSell * (0.0001 / 100)))
            .toStringAsFixed(2));
    double gst = double.parse(((((18 / 100) * brokerage) +
            ((18 / 100) * etc) +
            ((18 / 100) * sebi) +
            ((18 / 100) * 13.5)))
        .toStringAsFixed(2));

    double totalTax = brokerage + stt + sd + etc + sebi + gst + 13.5;
    double profit = (((sellVal - buyVal) * quantityVal) - totalTax);

    return [
      brokerage,
      gst,
      sebi,
      etc,
      stt,
      sd,
      totalTax,
      profit,
      (totalBuy + totalSell),
    ];
  }
}
