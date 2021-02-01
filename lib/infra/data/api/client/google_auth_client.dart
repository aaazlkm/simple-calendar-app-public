import 'package:http/http.dart';
import 'package:http/io_client.dart';

class GoogleAuthClient extends IOClient {
  GoogleAuthClient(this._headers) : super();

  final Map<String, String> _headers;

  @override
  Future<IOStreamedResponse> send(BaseRequest request) => super.send(request..headers.addAll(_headers));

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) => super.head(url, headers: headers?..addAll(_headers));
}
