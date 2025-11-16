import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Service for communicating with AMMOcoin daemon via JSON-RPC
class AmmocoinRPCService {
  static const String _defaultHost = '127.0.0.1';
  static const int _defaultPort = 8332;
  static const String _defaultUser = 'rpcuser';
  static const String _defaultPassword = 'rpcpass';

  final Dio _dio;
  final String _rpcUrl;
  final String _auth;

  AmmocoinRPCService({
    String? host,
    int? port,
    String? username,
    String? password,
  }) : _rpcUrl = 'http://${host ?? _defaultHost}:${port ?? _defaultPort}',
       _auth = base64Encode(utf8.encode('${username ?? _defaultUser}:${password ?? _defaultPassword}')),
       _dio = Dio() {

    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic $_auth',
    };

    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
  }

  /// Generic RPC call method
  Future<dynamic> call(String method, [List<dynamic>? params]) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch;

      final request = {
        'jsonrpc': '2.0',
        'method': method,
        'params': params ?? [],
        'id': id,
      };

      if (kDebugMode) {
        print('RPC Request: $method ${params != null ? 'with ${params.length} params' : ''}');
      }

      final response = await _dio.post(
        _rpcUrl,
        data: jsonEncode(request),
      );

      final Map<String, dynamic> responseData = response.data;

      if (responseData['error'] != null) {
        throw AmmocoinRPCException(
          responseData['error']['code'] ?? -1,
          responseData['error']['message'] ?? 'Unknown error',
        );
      }

      return responseData['result'];
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw AmmocoinRPCException(-401, 'Authentication failed');
      }
      throw AmmocoinRPCException(-1, 'Connection failed: ${e.message}');
    } catch (e) {
      throw AmmocoinRPCException(-1, 'Unexpected error: $e');
    }
  }

  // === WALLET INFORMATION ===

  /// Get wallet balance
  Future<double> getBalance([int confirmations = 0]) async {
    final result = await call('getbalance', [confirmations]);
    return (result as num).toDouble();
  }

  /// Get wallet info
  Future<Map<String, dynamic>> getWalletInfo() async {
    return await call('getwalletinfo');
  }

  /// Get new address for receiving coins
  Future<String> getNewAddress([String? account]) async {
    final params = account != null ? [account] : [];
    return await call('getnewaddress', params);
  }

  /// Validate an address
  Future<Map<String, dynamic>> validateAddress(String address) async {
    return await call('validateaddress', [address]);
  }

  // === BLOCKCHAIN INFORMATION ===

  /// Get blockchain info
  Future<Map<String, dynamic>> getBlockchainInfo() async {
    return await call('getblockchaininfo');
  }

  /// Get network info
  Future<Map<String, dynamic>> getNetworkInfo() async {
    return await call('getnetworkinfo');
  }

  /// Get peer info
  Future<List<dynamic>> getPeerInfo() async {
    return await call('getpeerinfo');
  }

  /// Get connection count
  Future<int> getConnectionCount() async {
    return await call('getconnectioncount');
  }

  // === TRANSACTIONS ===

  /// List transactions
  Future<List<dynamic>> listTransactions({
    String? account,
    int count = 10,
    int skip = 0,
  }) async {
    final params = [account ?? '*', count, skip];
    return await call('listtransactions', params);
  }

  /// Get transaction details
  Future<Map<String, dynamic>> getTransaction(String txid) async {
    return await call('gettransaction', [txid]);
  }

  /// Send to address
  Future<String> sendToAddress(
    String address,
    double amount, {
    String? comment,
    String? commentTo,
  }) async {
    final params = [address, amount];
    if (comment != null) params.add(comment);
    if (commentTo != null) params.add(commentTo);

    return await call('sendtoaddress', params);
  }

  /// List unspent transactions
  Future<List<dynamic>> listUnspent({
    int minConfirmations = 1,
    int maxConfirmations = 9999999,
    List<String>? addresses,
  }) async {
    final params = [minConfirmations, maxConfirmations];
    if (addresses != null && addresses.isNotEmpty) {
      params.add(addresses);
    }

    return await call('listunspent', params);
  }

  // === WALLET MANAGEMENT ===

  /// Unlock wallet
  Future<bool> walletPassphrase(String passphrase, int timeout) async {
    try {
      await call('walletpassphrase', [passphrase, timeout]);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Lock wallet
  Future<void> walletLock() async {
    await call('walletlock');
  }

  /// Check if wallet is encrypted
  Future<bool> isWalletEncrypted() async {
    try {
      final info = await getWalletInfo();
      return info['unlocked_until'] != null;
    } catch (e) {
      return false;
    }
  }

  // === DAEMON CONTROL ===

  /// Get daemon info
  Future<Map<String, dynamic>> getInfo() async {
    return await call('getinfo');
  }

  /// Stop the daemon
  Future<void> stop() async {
    await call('stop');
  }

  /// Test connection to daemon
  Future<bool> testConnection() async {
    try {
      await call('getinfo');
      return true;
    } catch (e) {
      return false;
    }
  }

  // === STAKING ===

  /// Get staking info
  Future<Map<String, dynamic>> getStakingInfo() async {
    return await call('getstakinginfo');
  }

  /// Get staking status
  Future<bool> getStakingStatus() async {
    try {
      final info = await getStakingInfo();
      return info['staking'] == true;
    } catch (e) {
      return false;
    }
  }

  // === MASTERNODE ===

  /// Get masternode status
  Future<Map<String, dynamic>> getMasternodeStatus() async {
    return await call('masternode', ['status']);
  }

  /// List masternodes
  Future<Map<String, dynamic>> listMasternodes([String? filter]) async {
    final params = filter != null ? [filter] : [];
    return await call('masternode', ['list', ...params]);
  }

  /// Dispose resources
  void dispose() {
    _dio.close();
  }
}

/// Exception thrown by RPC calls
class AmmocoinRPCException implements Exception {
  final int code;
  final String message;

  const AmmocoinRPCException(this.code, this.message);

  @override
  String toString() => 'AmmocoinRPCException($code): $message';
}

/// RPC service singleton
class RPCServiceManager {
  static AmmocoinRPCService? _instance;

  static AmmocoinRPCService get instance {
    _instance ??= AmmocoinRPCService();
    return _instance!;
  }

  static void initialize({
    String? host,
    int? port,
    String? username,
    String? password,
  }) {
    _instance = AmmocoinRPCService(
      host: host,
      port: port,
      username: username,
      password: password,
    );
  }

  static void dispose() {
    _instance?.dispose();
    _instance = null;
  }
}