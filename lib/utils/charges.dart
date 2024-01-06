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
    double stt = totalSell * (0.025 / 100);
    double sd = totalBuy * (0.003 / 100);
    double etc = (totalBuy * (0.00325 / 100)) + (totalSell * (0.00325 / 100));
    double sebi = (totalBuy * (0.0001 / 100)) + (totalSell * (0.0001 / 100));
    double gst = ((18 / 100) * brokerage) + ((18 / 100) * etc);

    double totalTax = brokerage + stt + sd + etc + sebi + gst;
    double profit = ((sellVal - buyVal) * quantityVal) - totalTax;

    return [
      brokerage,
      gst,
      sebi,
      etc,
      stt,
      sd,
      totalTax,
      profit,
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

    double b1 = (0.05 / 100) * totalSell;
    double b2 = 20;
    double brokerage = b1 > b2 ? b2 * 2 : b1 * 2;

    double stt = totalSell * (0.0625 / 100);
    double sd = totalBuy * (0.003 / 100);
    double etc = (totalBuy * (0.05 / 100)) + (totalSell * (0.05 / 100));
    double sebi = (totalBuy * (0.0001 / 100)) + (totalSell * (0.0001 / 100));
    double gst = ((18 / 100) * brokerage) + ((18 / 100) * etc);

    double totalTax = brokerage + stt + sd + etc + sebi + gst;
    double profit = ((sellVal - buyVal) * quantityVal) - totalTax;
    return [
      brokerage,
      gst,
      sebi,
      etc,
      stt,
      sd,
      totalTax,
      profit,
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
    
    double stt = (totalBuy * (0.1 / 100)) + (totalSell * (0.1 / 100));
    double sd = totalBuy * (0.015 / 100);
    double etc = (totalBuy * (0.00325 / 100)) + (totalSell * (0.00325 / 100));
    double sebi = (totalBuy * (0.0001 / 100)) + (totalSell * (0.0001 / 100));
    double gst = ((18 / 100) * brokerage) + ((18 / 100) * etc);

    double totalTax = brokerage + stt + sd + etc + sebi + gst + 13.5;
    double profit = ((sellVal - buyVal) * quantityVal) - totalTax;

    return [
      brokerage,
      gst,
      sebi,
      etc,
      stt,
      sd,
      totalTax,
      profit,
    ];
  }
}
