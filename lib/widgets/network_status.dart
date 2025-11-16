import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/wallet_providers.dart';

class NetworkStatus extends ConsumerWidget {
  const NetworkStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final networkStatus = ref.watch(networkStatusProvider);

    return networkStatus.when(
      data: (isConnected) => Container(
        margin: const EdgeInsets.only(right: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isConnected ? Icons.wifi : Icons.wifi_off,
              color: isConnected ? Colors.green : Colors.red,
              size: 20,
            ),
            const SizedBox(width: 4),
            Text(
              isConnected ? 'Online' : 'Offline',
              style: TextStyle(
                fontSize: 12,
                color: isConnected ? Colors.green : Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      loading: () => const SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
      error: (_, __) => const Icon(Icons.error, color: Colors.red, size: 20),
    );
  }
}