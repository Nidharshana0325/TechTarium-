// lib/utils/currency_converter.dart

double convertDollarToRupees(double dollar) {
  const double exchangeRate = 84.075; // Example rate, you can fetch this dynamically
  return dollar * exchangeRate;
}
