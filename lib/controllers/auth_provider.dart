import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:ride_app/services/local_storage_strings.dart';



class AuthProvider extends ChangeNotifier {

  var isLoading = false;
  bool isSelected = false;
  changeValue(value){
    isSelected = value;
    notifyListeners();
  }
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final LocalAuthentication authLocal = LocalAuthentication();

  Future<void> saveCredentials(String email, String password) async {
    await secureStorage.write(key:LocalStorageStrings.email, value: email);
    await secureStorage.write(key:LocalStorageStrings.password, value: password);
  }

  Future<Map<String, String>> getCredentials() async {
    String? email = await secureStorage.read(key:LocalStorageStrings.email);
    String? password = await secureStorage.read(key:LocalStorageStrings.password);
    print('Retrieved credentials: $email, $password'); // Debug statement
    if (email != null && password != null) {
      return {LocalStorageStrings.email: email,LocalStorageStrings.password: password};
    }
    return {};
  }

  Future<bool> authenticateWithBiometrics() async {
    try {
      bool authenticated = await authLocal.authenticate(
        localizedReason: 'Please authenticate to log in',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      return authenticated;
    } catch (e) {
      print(e);
      return false;
    }
  }



}