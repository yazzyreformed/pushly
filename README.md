# Pushly

Telefon kamerasıyla şınav sayan ve günlük şınav hedefini takip eden mobil uygulama.
BLM4587 IOS İle Mobil Uygulama Geliştirme I (Flutter) dönem projesi, 2026–2027 Güz.

**Selman Yasin Zemheri** · 23291092 · [@yazzyreformed](https://github.com/yazzyreformed)

| Klasör | İçerik |
|---|---|
| `api/` | ASP.NET Core Web API (.NET 10), Entity Framework Core, PostgreSQL |
| `mobile/` | Flutter uygulaması (Android, iOS); RTMPose poz modeli ONNX Runtime ile telefonda çalışır |
| `docs/` | Veritabanı tasarımı ve notlar |

Şınav sayımı tamamen telefonda yapılır: kamera görüntüsü sunucuya gönderilmez, API'ye sadece setin sonucu
(tekrar sayısı, süre, tarih) kaydedilir.

## Web API

Gerekenler: .NET 10 SDK, PostgreSQL 16.

```bash
cd api
dotnet restore
dotnet run --launch-profile http
```

Swagger: <http://localhost:5080/swagger>

Veritabanı bağlantısı ve migration adımları 2. haftada eklenecek.

## Mobil uygulama

Gerekenler: Flutter (stable), Android SDK; iOS için Xcode.

```bash
cd mobile
flutter pub get
flutter run --dart-define=API_URL=http://<bilgisayarın-yerel-ip-adresi>:5080
```

Android emülatöründen bilgisayardaki API'ye `http://10.0.2.2:5080` ile ulaşılır. Gerçek cihazda bilgisayarın
yerel ağ IP adresi kullanılır (telefon ve bilgisayar aynı Wi-Fi'da olmalı).

## Poz modeli

`mobile/assets/models/rtmpose_s_body7.onnx`: [RTMPose-s](https://github.com/open-mmlab/mmpose/tree/main/projects/rtmpose)
(COCO 17 nokta, 256×192 giriş, SimCC çıkışı), Apache-2.0 lisanslı.
