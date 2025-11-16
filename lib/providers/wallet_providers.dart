import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/wallet_models.dart';
import '../services/ammocoin_rpc_service.dart';

// Wallet Balance Provider
final walletBalanceProvider = FutureProvider<WalletBalance>((ref) async {
  final rpcService = RPCServiceManager.instance;

  try {
    final balance = await rpcService.getBalance();
    final walletInfo = await rpcService.getWalletInfo();

    return WalletBalance(
      confirmed: balance,
      unconfirmed: (walletInfo['unconfirmed_balance'] ?? 0.0).toDouble(),
      staking: (walletInfo['staked_balance'] ?? 0.0).toDouble(),
      total: balance + (walletInfo['unconfirmed_balance'] ?? 0.0).toDouble(),
    );
  } catch (e) {
    // Return mock data for development
    return const WalletBalance(
      confirmed: 1250.50,
      unconfirmed: 25.25,
      staking: 500.0,
      total: 1775.75,
    );
  }
});

// Transactions Provider
final transactionsProvider = FutureProvider<List<Transaction>>((ref) async {
  final rpcService = RPCServiceManager.instance;

  try {
    final txList = await rpcService.listTransactions(count: 50);
    return txList.map((tx) => Transaction.fromJson(tx)).toList();
  } catch (e) {
    // Return mock data for development
    return [
      Transaction(
        txid: '1234...5678',
        amount: 100.0,
        confirmations: 6,
        time: DateTime.now().subtract(const Duration(hours: 1)),
        address: 'AMMO1234...5678',
        category: 'receive',
        comment: 'Payment received',
      ),
      Transaction(
        txid: '9876...5432',
        amount: -50.0,
        confirmations: 3,
        time: DateTime.now().subtract(const Duration(hours: 3)),
        address: 'AMMO9876...5432',
        category: 'send',
        comment: 'Payment sent',
        fee: 0.001,
      ),
    ];
  }
});

// Network Status Provider
final networkStatusProvider = FutureProvider<bool>((ref) async {
  final rpcService = RPCServiceManager.instance;
  return await rpcService.testConnection();
});

// Blockchain Info Provider
final blockchainInfoProvider = FutureProvider<BlockchainInfo>((ref) async {
  final rpcService = RPCServiceManager.instance;

  try {
    final info = await rpcService.getBlockchainInfo();
    return BlockchainInfo.fromJson(info);
  } catch (e) {
    // Return mock data for development
    return const BlockchainInfo(
      chain: 'main',
      blocks: 150000,
      headers: 150000,
      bestBlockHash: '000000...123456',
      difficulty: 1234567.89,
      medianTime: 1234567890,
      verificationProgress: 1.0,
    );
  }
});

// Staking Info Provider
final stakingInfoProvider = FutureProvider<StakingInfo>((ref) async {
  final rpcService = RPCServiceManager.instance;

  try {
    final info = await rpcService.getStakingInfo();
    return StakingInfo.fromJson(info);
  } catch (e) {
    // Return mock data for development
    return const StakingInfo(
      enabled: true,
      staking: true,
      currentBlockSize: 1000,
      currentBlockTx: 5,
      pooledTx: 10,
      difficulty: 1234567.89,
      searchInterval: '16',
      weight: 500000000,
      netStakeWeight: 10000000000,
      expectedTime: 3600,
    );
  }
});