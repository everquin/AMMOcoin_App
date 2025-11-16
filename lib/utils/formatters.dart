import 'package:intl/intl.dart';

// Number formatters
final _numberFormat = NumberFormat('#,##0.########');
final _currencyFormat = NumberFormat.currency(symbol: '', decimalDigits: 8);
final _compactFormat = NumberFormat.compact();

/// Format amount for display
String formatAmount(double amount) {
  if (amount == 0) return '0';

  if (amount.abs() < 0.00000001) {
    return amount.toStringAsFixed(8);
  }

  if (amount.abs() < 0.001) {
    return amount.toStringAsFixed(8).replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '');
  }

  return _numberFormat.format(amount);
}

/// Format currency with symbol
String formatCurrency(double amount, {String symbol = 'AMMO'}) {
  return '${formatAmount(amount)} $symbol';
}

/// Format compact number (e.g., 1.2K, 3.4M)
String formatCompact(double amount) {
  return _compactFormat.format(amount);
}

/// Format percentage
String formatPercentage(double value) {
  return '${(value * 100).toStringAsFixed(2)}%';
}

/// Format date and time
String formatDateTime(DateTime dateTime) {
  return DateFormat('MMM dd, yyyy HH:mm').format(dateTime);
}

/// Format date only
String formatDate(DateTime dateTime) {
  return DateFormat('MMM dd, yyyy').format(dateTime);
}

/// Format time only
String formatTime(DateTime dateTime) {
  return DateFormat('HH:mm').format(dateTime);
}

/// Format relative time (e.g., "2 hours ago")
String formatRelativeTime(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inMinutes < 1) {
    return 'Just now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes}m ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours}h ago';
  } else if (difference.inDays < 7) {
    return '${difference.inDays}d ago';
  } else {
    return formatDate(dateTime);
  }
}

/// Format duration
String formatDuration(Duration duration) {
  if (duration.inDays > 0) {
    return '${duration.inDays}d ${duration.inHours % 24}h';
  } else if (duration.inHours > 0) {
    return '${duration.inHours}h ${duration.inMinutes % 60}m';
  } else if (duration.inMinutes > 0) {
    return '${duration.inMinutes}m';
  } else {
    return '${duration.inSeconds}s';
  }
}

/// Format hash (truncate with ellipsis)
String formatHash(String hash, {int startLength = 8, int endLength = 8}) {
  if (hash.length <= startLength + endLength) return hash;
  return '${hash.substring(0, startLength)}...${hash.substring(hash.length - endLength)}';
}

/// Format address (truncate with ellipsis)
String formatAddress(String address, {int startLength = 6, int endLength = 4}) {
  if (address.length <= startLength + endLength) return address;
  return '${address.substring(0, startLength)}...${address.substring(address.length - endLength)}';
}