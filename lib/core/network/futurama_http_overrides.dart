import 'dart:io';

class FuturamaHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final HttpClient client = super.createHttpClient(context);
    return client
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
