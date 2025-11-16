import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/wallet_providers.dart';
import '../utils/formatters.dart';

class TransactionList extends ConsumerWidget {
  final int? limit;

  const TransactionList({super.key, this.limit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionsProvider);

    return transactions.when(
      data: (txList) {
        final displayList = limit != null ? txList.take(limit!).toList() : txList;

        if (displayList.isEmpty) {
          return const Center(
            child: Text('No transactions found'),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: displayList.length,
          itemBuilder: (context, index) {
            final tx = displayList[index];
            return _buildTransactionItem(context, tx);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }

  Widget _buildTransactionItem(BuildContext context, tx) {
    final theme = Theme.of(context);
    final isPositive = tx.amount > 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isPositive
                ? Colors.green.withOpacity(0.1)
                : Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            isPositive ? Icons.call_received : Icons.send,
            color: isPositive ? Colors.green : Colors.red,
            size: 20,
          ),
        ),
        title: Text(
          tx.typeText,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (tx.address != null)
              Text(
                formatAddress(tx.address!),
                style: TextStyle(
                  fontSize: 12,
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            Text(
              formatRelativeTime(tx.time),
              style: TextStyle(
                fontSize: 12,
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${isPositive ? '+' : ''}${formatAmount(tx.amount)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isPositive ? Colors.green : Colors.red,
              ),
            ),
            Text(
              tx.statusText,
              style: TextStyle(
                fontSize: 12,
                color: tx.isConfirmed ? Colors.green : Colors.orange,
              ),
            ),
          ],
        ),
        onTap: () {
          // Show transaction details
        },
      ),
    );
  }
}