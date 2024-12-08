import 'package:sleek_properties_flutter/common/enums/env_enums.dart';

class Config {
  final Env _env;
  final String _devBaseUrl = '';
  final String _productionBaseUrl = '';
  late String _baseUrl;
  Env get env => _env;
  String get baseUrl => _baseUrl;
  Config(this._env) {
    _setupBaseUrl();
  }

  _setupBaseUrl() {
    if (_env == Env.prod) {
      _baseUrl = _productionBaseUrl;
    } else if (_env == Env.dev) {
      _baseUrl = _devBaseUrl;
    }
  }
}
