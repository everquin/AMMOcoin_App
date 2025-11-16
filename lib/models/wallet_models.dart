import 'package:json_annotation/json_annotation.dart';

part 'wallet_models.g.dart';

/// Wallet balance information
@JsonSerializable()
class WalletBalance {
  final double confirmed;
  final double unconfirmed;
  final double staking;
  final double total;

  const WalletBalance({
    required this.confirmed,
    required this.unconfirmed,
    required this.staking,
    required this.total,
  });

  factory WalletBalance.fromJson(Map<String, dynamic> json) =>
      _$WalletBalanceFromJson(json);

  Map<String, dynamic> toJson() => _$WalletBalanceToJson(this);

  WalletBalance copyWith({
    double? confirmed,
    double? unconfirmed,
    double? staking,
    double? total,
  }) {
    return WalletBalance(
      confirmed: confirmed ?? this.confirmed,
      unconfirmed: unconfirmed ?? this.unconfirmed,
      staking: staking ?? this.staking,
      total: total ?? this.total,
    );
  }
}

/// Transaction information
@JsonSerializable()
class Transaction {
  final String txid;
  final double amount;
  final int confirmations;
  final DateTime time;
  final String? address;
  final String category; // 'send', 'receive', 'generate', 'stake'
  final String? comment;
  final double? fee;

  const Transaction({
    required this.txid,
    required this.amount,
    required this.confirmations,
    required this.time,
    this.address,
    required this.category,
    this.comment,
    this.fee,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  /// Check if transaction is confirmed
  bool get isConfirmed => confirmations > 0;

  /// Check if transaction is mature (for staking rewards)
  bool get isMature => confirmations >= 100;

  /// Get transaction status text
  String get statusText {
    if (confirmations == 0) return 'Unconfirmed';
    if (confirmations < 6) return '$confirmations/6 confirmations';
    if (category == 'stake' && !isMature) return 'Immature';
    return 'Confirmed';
  }

  /// Get transaction type display text
  String get typeText {
    switch (category.toLowerCase()) {
      case 'send':
        return 'Sent';
      case 'receive':
        return 'Received';
      case 'generate':
        return 'Mined';
      case 'stake':
        return 'Staked';
      default:
        return category;
    }
  }
}

/// Address information
@JsonSerializable()
class AddressInfo {
  final String address;
  final String? label;
  final bool isValid;
  final bool isMine;
  final bool isWatchOnly;
  final String? account;

  const AddressInfo({
    required this.address,
    this.label,
    required this.isValid,
    required this.isMine,
    required this.isWatchOnly,
    this.account,
  });

  factory AddressInfo.fromJson(Map<String, dynamic> json) =>
      _$AddressInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AddressInfoToJson(this);
}

/// Blockchain information
@JsonSerializable()
class BlockchainInfo {
  final String chain;
  final int blocks;
  final int headers;
  final String bestBlockHash;
  final double difficulty;
  final int medianTime;
  final double verificationProgress;
  final String? warnings;

  const BlockchainInfo({
    required this.chain,
    required this.blocks,
    required this.headers,
    required this.bestBlockHash,
    required this.difficulty,
    required this.medianTime,
    required this.verificationProgress,
    this.warnings,
  });

  factory BlockchainInfo.fromJson(Map<String, dynamic> json) =>
      _$BlockchainInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BlockchainInfoToJson(this);

  /// Check if blockchain is synced
  bool get isSynced => verificationProgress >= 0.99999;

  /// Get sync percentage
  double get syncPercentage => verificationProgress * 100;
}

/// Network information
@JsonSerializable()
class NetworkInfo {
  final String version;
  final String subVersion;
  final int protocolVersion;
  final int connections;
  final List<NetworkAddress> localAddresses;
  final double relayFee;

  const NetworkInfo({
    required this.version,
    required this.subVersion,
    required this.protocolVersion,
    required this.connections,
    required this.localAddresses,
    required this.relayFee,
  });

  factory NetworkInfo.fromJson(Map<String, dynamic> json) =>
      _$NetworkInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkInfoToJson(this);
}

/// Network address information
@JsonSerializable()
class NetworkAddress {
  final String address;
  final int port;
  final int score;

  const NetworkAddress({
    required this.address,
    required this.port,
    required this.score,
  });

  factory NetworkAddress.fromJson(Map<String, dynamic> json) =>
      _$NetworkAddressFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkAddressToJson(this);
}

/// Peer information
@JsonSerializable()
class PeerInfo {
  final int id;
  final String addr;
  final String? addrLocal;
  final int services;
  final int lastSend;
  final int lastRecv;
  final int bytesRecv;
  final int bytesSent;
  final int connTime;
  final String subVer;
  final bool inbound;
  final int startingHeight;
  final int banScore;

  const PeerInfo({
    required this.id,
    required this.addr,
    this.addrLocal,
    required this.services,
    required this.lastSend,
    required this.lastRecv,
    required this.bytesRecv,
    required this.bytesSent,
    required this.connTime,
    required this.subVer,
    required this.inbound,
    required this.startingHeight,
    required this.banScore,
  });

  factory PeerInfo.fromJson(Map<String, dynamic> json) =>
      _$PeerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PeerInfoToJson(this);
}

/// Staking information
@JsonSerializable()
class StakingInfo {
  final bool enabled;
  final bool staking;
  final String? errors;
  final double currentBlockSize;
  final double currentBlockTx;
  final double pooledTx;
  final double difficulty;
  final String searchInterval;
  final double weight;
  final double netStakeWeight;
  final int expectedTime;

  const StakingInfo({
    required this.enabled,
    required this.staking,
    this.errors,
    required this.currentBlockSize,
    required this.currentBlockTx,
    required this.pooledTx,
    required this.difficulty,
    required this.searchInterval,
    required this.weight,
    required this.netStakeWeight,
    required this.expectedTime,
  });

  factory StakingInfo.fromJson(Map<String, dynamic> json) =>
      _$StakingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StakingInfoToJson(this);

  /// Get expected stake time in a human readable format
  String get expectedTimeText {
    if (expectedTime <= 0) return 'Not staking';

    final duration = Duration(seconds: expectedTime);
    if (duration.inDays > 0) {
      return '${duration.inDays}d ${duration.inHours % 24}h';
    } else if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes % 60}m';
    } else {
      return '${duration.inMinutes}m';
    }
  }
}

/// Masternode status
@JsonSerializable()
class MasternodeStatus {
  final String? address;
  final String status;
  final String? message;

  const MasternodeStatus({
    this.address,
    required this.status,
    this.message,
  });

  factory MasternodeStatus.fromJson(Map<String, dynamic> json) =>
      _$MasternodeStatusFromJson(json);

  Map<String, dynamic> toJson() => _$MasternodeStatusToJson(this);

  bool get isActive => status.toLowerCase() == 'masternode successfully started';
}

/// UTXO (Unspent Transaction Output)
@JsonSerializable()
class UTXO {
  final String txid;
  final int vout;
  final String address;
  final String? label;
  final String scriptPubKey;
  final double amount;
  final int confirmations;
  final bool spendable;
  final bool solvable;

  const UTXO({
    required this.txid,
    required this.vout,
    required this.address,
    this.label,
    required this.scriptPubKey,
    required this.amount,
    required this.confirmations,
    required this.spendable,
    required this.solvable,
  });

  factory UTXO.fromJson(Map<String, dynamic> json) =>
      _$UTXOFromJson(json);

  Map<String, dynamic> toJson() => _$UTXOToJson(this);
}