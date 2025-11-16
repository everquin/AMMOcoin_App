import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/wallet_providers.dart';
import '../utils/formatters.dart';

class StakingCard extends ConsumerWidget {
  const StakingCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stakingInfo = ref.watch(stakingInfoProvider);
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.trending_up, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  'Staking',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                stakingInfo.when(
                  data: (info) => Switch(
                    value: info.staking,
                    onChanged: (value) {
                      // Toggle staking
                    },
                  ),
                  loading: () => const CircularProgressIndicator(),
                  error: (_, __) => const Icon(Icons.error),
                ),
              ],
            ),
            const SizedBox(height: 16),
            stakingInfo.when(
              data: (info) => Column(
                children: [
                  _buildStakingItem('Status', info.staking ? 'Active' : 'Inactive'),
                  _buildStakingItem('Expected Time', info.expectedTimeText),
                  _buildStakingItem('Weight', formatCompact(info.weight)),
                  _buildStakingItem('Net Weight', formatCompact(info.netStakeWeight)),
                ],
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Text('Error: $error'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStakingItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value),
        ],
      ),
    );
  }
}