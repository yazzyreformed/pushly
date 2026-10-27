/// API adresi derleme sırasında verilir:
/// flutter run --dart-define=API_URL=http://192.168.1.20:5080
/// Verilmezse Android emülatörünün bilgisayara açılan adresi kullanılır.
const apiUrl = String.fromEnvironment('API_URL', defaultValue: 'http://10.0.2.2:5080');
