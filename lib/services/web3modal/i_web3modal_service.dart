import 'package:flutter/material.dart';
import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';
import 'package:web3modal_flutter/services/explorer/i_explorer_service.dart';

// enum Web3ModalConnectionState {
//   idle,
//   connecting,
//   connected,
// }

enum Web3ModalState {
  account,
  qrCode,
  walletListShort,
  walletListLong,
  qrCodeAndWalletList,
  chainList,
  help,
  getAWallet,
}

abstract class IWeb3ModalService implements ChangeNotifier {
  /// Whether or not this object has been initialized.
  bool get isInitialized;

  /// The project ID used to initialize the [web3App].
  String get projectId;

  /// The object that manages sessions, authentication, events, and requests
  /// for WalletConnect.
  IWeb3App? get web3App;

  /// Variable that can be used to check if the modal is visible on screen.
  bool get isOpen;

  /// Variable that can be used to check if the web3App is connected
  bool get isConnected;

  /// The current session's data.
  SessionData? get session;

  /// The address of the currently connected account.
  String? get address;

  /// The service used to fetch wallet listings from the explorer API.
  abstract final IExplorerService explorerService;

  /// The current connection state of the modal.
  /// Used by the connect button to render the correct UI.
  // Web3ModalConnectionState get connectionState;

  /// The current state of the modal.
  // Web3ModalState get state;

  /// The list of wallets from the explorer API.
  // List<Listing> get listings;

  /// Opens the modal with the provided [startState].
  /// If none is provided, the default state will be used based on platform.
  void open({
    required BuildContext context,
    Web3ModalState? startState,
  });

  /// Closes the modal.
  void close();

  /// Disconnects the session and pairing, if any.
  /// If there is no session, this does nothing.
  Future<void> disconnect();

  /// Sets the default chain to use for the session.
  void setDefaultChain(String chainId);

  /// The required namespaces that will be used when connecting to the wallet
  Map<String, RequiredNamespace> get requiredNamespaces;

  /// Sets the required namespaces that will be used when connecting to the wallet
  /// The default is set to the [NamespaceConstants.ethereum] namespace.
  void setRequiredNamespaces(Map<String, RequiredNamespace> requiredNamespaces);

  /// Sets the recommended wallets to display in the modal.
  void setRecommendedWallets(List<String> walletIds);

  /// Sets the list of wallets to exclude from the modal.
  void setExcludedWallets(List<String> walletIds);
}