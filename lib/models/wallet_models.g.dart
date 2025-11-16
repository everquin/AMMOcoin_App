// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletBalance _$WalletBalanceFromJson(Map<String, dynamic> json) =>
    WalletBalance(
      confirmed: (json['confirmed'] as num).toDouble(),
      unconfirmed: (json['unconfirmed'] as num).toDouble(),
      staking: (json['staking'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$WalletBalanceToJson(WalletBalance instance) =>
    <String, dynamic>{
      'confirmed': instance.confirmed,
      'unconfirmed': instance.unconfirmed,
      'staking': instance.staking,
      'total': instance.total,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      txid: json['txid'] as String,
      amount: (json['amount'] as num).toDouble(),
      confirmations: (json['confirmations'] as num).toInt(),
      time: DateTime.parse(json['time'] as String),
      address: json['address'] as String?,
      category: json['category'] as String,
      comment: json['comment'] as String?,
      fee: (json['fee'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'txid': instance.txid,
      'amount': instance.amount,
      'confirmations': instance.confirmations,
      'time': instance.time.toIso8601String(),
      'address': instance.address,
      'category': instance.category,
      'comment': instance.comment,
      'fee': instance.fee,
    };

AddressInfo _$AddressInfoFromJson(Map<String, dynamic> json) => AddressInfo(
      address: json['address'] as String,
      label: json['label'] as String?,
      isValid: json['isValid'] as bool,
      isMine: json['isMine'] as bool,
      isWatchOnly: json['isWatchOnly'] as bool,
      account: json['account'] as String?,
    );

Map<String, dynamic> _$AddressInfoToJson(AddressInfo instance) =>
    <String, dynamic>{
      'address': instance.address,
      'label': instance.label,
      'isValid': instance.isValid,
      'isMine': instance.isMine,
      'isWatchOnly': instance.isWatchOnly,
      'account': instance.account,
    };

BlockchainInfo _$BlockchainInfoFromJson(Map<String, dynamic> json) =>
    BlockchainInfo(
      chain: json['chain'] as String,
      blocks: (json['blocks'] as num).toInt(),
      headers: (json['headers'] as num).toInt(),
      bestBlockHash: json['bestBlockHash'] as String,
      difficulty: (json['difficulty'] as num).toDouble(),
      medianTime: (json['medianTime'] as num).toInt(),
      verificationProgress: (json['verificationProgress'] as num).toDouble(),
      warnings: json['warnings'] as String?,
    );

Map<String, dynamic> _$BlockchainInfoToJson(BlockchainInfo instance) =>
    <String, dynamic>{
      'chain': instance.chain,
      'blocks': instance.blocks,
      'headers': instance.headers,
      'bestBlockHash': instance.bestBlockHash,
      'difficulty': instance.difficulty,
      'medianTime': instance.medianTime,
      'verificationProgress': instance.verificationProgress,
      'warnings': instance.warnings,
    };

NetworkInfo _$NetworkInfoFromJson(Map<String, dynamic> json) => NetworkInfo(
      version: json['version'] as String,
      subVersion: json['subVersion'] as String,
      protocolVersion: (json['protocolVersion'] as num).toInt(),
      connections: (json['connections'] as num).toInt(),
      localAddresses: (json['localAddresses'] as List<dynamic>)
          .map((e) => NetworkAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      relayFee: (json['relayFee'] as num).toDouble(),
    );

Map<String, dynamic> _$NetworkInfoToJson(NetworkInfo instance) =>
    <String, dynamic>{
      'version': instance.version,
      'subVersion': instance.subVersion,
      'protocolVersion': instance.protocolVersion,
      'connections': instance.connections,
      'localAddresses': instance.localAddresses,
      'relayFee': instance.relayFee,
    };

NetworkAddress _$NetworkAddressFromJson(Map<String, dynamic> json) =>
    NetworkAddress(
      address: json['address'] as String,
      port: (json['port'] as num).toInt(),
      score: (json['score'] as num).toInt(),
    );

Map<String, dynamic> _$NetworkAddressToJson(NetworkAddress instance) =>
    <String, dynamic>{
      'address': instance.address,
      'port': instance.port,
      'score': instance.score,
    };

PeerInfo _$PeerInfoFromJson(Map<String, dynamic> json) => PeerInfo(
      id: (json['id'] as num).toInt(),
      addr: json['addr'] as String,
      addrLocal: json['addrLocal'] as String?,
      services: (json['services'] as num).toInt(),
      lastSend: (json['lastSend'] as num).toInt(),
      lastRecv: (json['lastRecv'] as num).toInt(),
      bytesRecv: (json['bytesRecv'] as num).toInt(),
      bytesSent: (json['bytesSent'] as num).toInt(),
      connTime: (json['connTime'] as num).toInt(),
      subVer: json['subVer'] as String,
      inbound: json['inbound'] as bool,
      startingHeight: (json['startingHeight'] as num).toInt(),
      banScore: (json['banScore'] as num).toInt(),
    );

Map<String, dynamic> _$PeerInfoToJson(PeerInfo instance) => <String, dynamic>{
      'id': instance.id,
      'addr': instance.addr,
      'addrLocal': instance.addrLocal,
      'services': instance.services,
      'lastSend': instance.lastSend,
      'lastRecv': instance.lastRecv,
      'bytesRecv': instance.bytesRecv,
      'bytesSent': instance.bytesSent,
      'connTime': instance.connTime,
      'subVer': instance.subVer,
      'inbound': instance.inbound,
      'startingHeight': instance.startingHeight,
      'banScore': instance.banScore,
    };

StakingInfo _$StakingInfoFromJson(Map<String, dynamic> json) => StakingInfo(
      enabled: json['enabled'] as bool,
      staking: json['staking'] as bool,
      errors: json['errors'] as String?,
      currentBlockSize: (json['currentBlockSize'] as num).toDouble(),
      currentBlockTx: (json['currentBlockTx'] as num).toDouble(),
      pooledTx: (json['pooledTx'] as num).toDouble(),
      difficulty: (json['difficulty'] as num).toDouble(),
      searchInterval: json['searchInterval'] as String,
      weight: (json['weight'] as num).toDouble(),
      netStakeWeight: (json['netStakeWeight'] as num).toDouble(),
      expectedTime: (json['expectedTime'] as num).toInt(),
    );

Map<String, dynamic> _$StakingInfoToJson(StakingInfo instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'staking': instance.staking,
      'errors': instance.errors,
      'currentBlockSize': instance.currentBlockSize,
      'currentBlockTx': instance.currentBlockTx,
      'pooledTx': instance.pooledTx,
      'difficulty': instance.difficulty,
      'searchInterval': instance.searchInterval,
      'weight': instance.weight,
      'netStakeWeight': instance.netStakeWeight,
      'expectedTime': instance.expectedTime,
    };

MasternodeStatus _$MasternodeStatusFromJson(Map<String, dynamic> json) =>
    MasternodeStatus(
      address: json['address'] as String?,
      status: json['status'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$MasternodeStatusToJson(MasternodeStatus instance) =>
    <String, dynamic>{
      'address': instance.address,
      'status': instance.status,
      'message': instance.message,
    };

UTXO _$UTXOFromJson(Map<String, dynamic> json) => UTXO(
      txid: json['txid'] as String,
      vout: (json['vout'] as num).toInt(),
      address: json['address'] as String,
      label: json['label'] as String?,
      scriptPubKey: json['scriptPubKey'] as String,
      amount: (json['amount'] as num).toDouble(),
      confirmations: (json['confirmations'] as num).toInt(),
      spendable: json['spendable'] as bool,
      solvable: json['solvable'] as bool,
    );

Map<String, dynamic> _$UTXOToJson(UTXO instance) => <String, dynamic>{
      'txid': instance.txid,
      'vout': instance.vout,
      'address': instance.address,
      'label': instance.label,
      'scriptPubKey': instance.scriptPubKey,
      'amount': instance.amount,
      'confirmations': instance.confirmations,
      'spendable': instance.spendable,
      'solvable': instance.solvable,
    };
