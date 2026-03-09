import 'package:hiddify/core/model/directories.dart';
import 'package:hiddify/hiddifycore/generated/v2/hcore/hcore_service.pbgrpc.dart';
import 'package:hiddify/singbox/model/core_status.dart';

class CoreInterface {
  late CoreClient foregroundClient;
  late CoreClient backgroundClient;

  Future<String> setup(Directories directories, bool debug, int mode) async {
    return "";
  }

  Future<CoreStatus> setupBackground(String path, String name) async {
    return const CoreStarted();
  }

  Future<bool> restart(String path, String name) async {
    return false;
  }

  Future<bool> stop() async {
    return false;
  }

  Future<bool> isBackgroundClientAvailable() async {
    return true;
  }

  bool isUsingSharedChannel() {
    // return true;
    return foregroundClient == backgroundClient;
  }

  Future<bool> resetTunnel() async {
    return false;
  }

  Future<bool> isForegroundServiceActive() async {
    return true;
  }

  Future<bool> isBackgroundServiceActive() async {
    return true;
  }

  bool isInitialized() {
    try {
      backgroundClient; // touch it
      return true;
    } catch (_) {
      return false;
    }
  }
}
