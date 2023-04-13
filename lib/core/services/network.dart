abstract class NetworkServiceProtocol {}

class NetworkService implements NetworkServiceProtocol {
  // @override
  // Future<NetworkResultProtocol> signIn({
  //   String email,
  //   String password,
  // }) async {
  //   if (!await _hasInternetConnection()) {
  //     return NoInternetConnectionResult();
  //   }

  //   AuthResult authResult;
  //   String errorMessage;
  //   try {
  //     authResult = await firebaseAuth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //   } on PlatformException catch (error) {
  //     errorMessage = error.message;
  //   }

  //   if (authResult != null) {
  //     return SuccessNetworkResult('');
  //   } else {
  //     return ErrorNetworkResult(errorMessage);
  //   }
  // }

  Future<bool> _hasInternetConnection() async {
    // final  result = await Connectivity().checkConnectivity();
    // return result != ConnectivityResult.none;
    return true;
  }
}
