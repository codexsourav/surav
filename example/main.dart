import 'package:surav/apirequest.dart';
import 'package:surav/surav.dart';

void main() async {
  ApiRequest request = ApiRequest(
    'https://example.com/api/endpoint',
    method: ApiMethod.POST,
    body: {'key': 'value'},
    showLogs: true,
  );
  Response response = await request.send();

  await SuravLocal.setString('key', 'value');
  await SuravLocal.setBool('key', true);
  await SuravLocal.setInt('key', 123);
  await SuravLocal.setDouble('key', 123.45);
  await SuravLocal.setStringList('key', ['value1', 'value2']);
}
