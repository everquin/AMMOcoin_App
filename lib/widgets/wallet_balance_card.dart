import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/wallet_providers.dart';
import '../utils/formatters.dart';

class WalletBalanceCard extends ConsumerWidget {
  const WalletBalanceCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletBalance = ref.watch(walletBalanceProvider);
    final theme = Theme.of(context);

    return Card(
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.colorScheme.primary,
              theme.colorScheme.primary.withOpacity(0.8),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Balance',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onPrimary.withOpacity(0.9),
                    ),
                  ),
                  Icon(
                    Icons.account_balance_wallet,
                    color: theme.colorScheme.onPrimary.withOpacity(0.9),
                    size: 24,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Main Balance
              walletBalance.when(
                data: (balance) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${formatAmount(balance.total)} AMMO',
                      style: GoogleFonts.inter(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimary,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Balance Breakdown
                    Row(
                      children: [
                        Expanded(
                          child: _buildBalanceItem(
                            context,
                            'Available',
                            balance.confirmed,
                            Icons.check_circle_outline,
                          ),
                        ),
                        Expanded(
                          child: _buildBalanceItem(
                            context,
                            'Pending',
                            balance.unconfirmed,
                            Icons.schedule,
                          ),
                        ),
                        Expanded(
                          child: _buildBalanceItem(
                            context,
                            'Staking',
                            balance.staking,
                            Icons.trending_up,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                loading: () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onPrimary.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        for (int i = 0; i < 3; i++)
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: i < 2 ? 8 : 0),
                              height: 60,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.onPrimary.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                error: (error, stack) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Error loading balance',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tap to retry',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: theme.colorScheme.onPrimary.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceItem(
    BuildContext context,
    String label,
    double amount,
    IconData icon,
  ) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.onPrimary.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 16,
                color: theme.colorScheme.onPrimary.withOpacity(0.9),
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.onPrimary.withOpacity(0.9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            formatAmount(amount),
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}