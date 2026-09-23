<div align="center">
  <h1>🚗 G6 Studio — Advanced Car Smoke</h1>
  <p><strong>Yüksek Performanslı • Çok Oyunculu Senkronizasyon •Bağımsız Framework (Standalone)</strong></p>
  <p>
    <img src="https://img.shields.io/badge/Author-icietzsche%20Development-blue.svg" alt="Author">
    <img src="https://img.shields.io/badge/Version-1.0-brightgreen.svg" alt="Version">
    <img src="https://img.shields.io/badge/Framework-Standalone-orange.svg" alt="Framework">
    <img src="https://img.shields.io/badge/Resmon-0.00ms-success.svg" alt="Resmon">
  </p>
</div>

---

## TURKCE

## 📖 Genel Bakış

**Advanced Car Smoke**, FiveM sunucularında araç sürüş deneyimini geliştirmek için **G6 Studio** ve **icietzsche Development** tarafından hazırlanan gelişmiş bir araç dumanı scriptidir. Bu sistem, oyuncular drift yaparken veya lastik yakarken (burnout) gerçekçi tekerlek dumanı efektleri oluşturur. Son derece optimize edilmiş altyapısı sayesinde sunucunuzu veya istemciyi yormadan yüksek performanslı bir görsel deneyim sunar.

---

## ✨ Özellikler

- ⚡ **Ultra Performans (Resmon):**
  - Gelişmiş önbellekleme (caching) sistemi sayesinde etrafta araç yokken hesaplama yapmaz ve **0.00ms** boşta (idle) çalışma garantisi sunar.
  - Çevredeki araçlar yalnızca 2 saniyede bir taranarak oyun motorunun gereksiz yere yorulması önlenir.
- 🏎️ **Gelişmiş Duman Efektleri:**
  - Belirli bir hızın (`speed >= 3.0`) üzerinde araç ivmelenirken ve belli bir açıyla (drift) viraj alınırken otomatik duman efekti yaratır.
  - Araç dururken veya yavaşken yapılan burnout (lastik yakma) işlemlerinde özel duman çıkışı hesaplamaları (`IsVehicleInBurnout`) mevcuttur.
- 🌐 **Çoklu Oyuncu (Multiplayer) Desteği:**
  - `CONFIG.multiplayer` ayarı aktifleştirildiğinde, sadece kendi aracınızda değil çevrenizdeki diğer oyuncuların araçlarından çıkan dumanları da eşzamanlı olarak görebilirsiniz.
- ⚙️ **Kolay Yapılandırma:**
  - Duman boyutu (`size`), burnout dumanı boyutu (`burnout_size`), duman yoğunluğu (`dens`) ve sistemin diğer araçları algılayacağı mesafe (`distance`) konfigürasyon içerisinden kolayca ayarlanabilir.
- 🆓 **Framework Bağımsız (Standalone):**
  - Hiçbir altyapıya veya veritabanı eklentisine ihtiyaç duymaz.

---

## 📦 Bağımlılıklar (Dependencies)

Bu eklenti tamamen **Standalone** (bağımsız) olarak geliştirilmiştir. Herhangi bir framework (ESX, QBCore vs.) veya ek kütüphane gerektirmez.

---

## 🚀 Hızlı Başlangıç & Kurulum

1. İndirdiğiniz klasörün adını sunucunuzun `resources/` dizinine yerleştirin.
2. `server.cfg` dosyanızı açın ve scripti başlatın:
   ```cfg
   ensure g6-advanced-smoke
   ```
3. İsteğe bağlı olarak, `client.lua` dosyasının en üstünde yer alan `CONFIG` tablosundan duman yoğunluğu ve büyüklüğü ayarlarını sunucunuzun zevkine göre özelleştirebilirsiniz.
4. Sunucunuzu başlatın veya konsoldan `refresh` ardından `start g6-advanced-smoke` komutunu çalıştırın.

---

## 📂 Dosya Yapısı

```
g6-advanced-smoke/
├── fxmanifest.lua
└── client.lua
```
*(Dosyalar fxmanifest içerisinde istemci (client) scripti olarak tanımlanmıştır ve sunucu (server) tarafında yük oluşturmaz.)*

---

<br>






















## ENGLISH

## 📖 Overview

**Advanced Car Smoke** is an advanced vehicle smoke script created by **G6 Studio** and **icietzsche Development** to enhance the driving experience on FiveM servers. This system generates realistic tire smoke effects when players drift or perform burnouts. Thanks to its highly optimized infrastructure, it provides a high-performance visual experience without lagging your server or clients.

---

## ✨ Features

- ⚡ **Ultra Performance (Resmon):**
  - Thanks to the advanced caching system, math calculations stop when there are no vehicles around, guaranteeing **0.00ms** idle performance.
  - Nearby vehicles are scanned only once every 2 seconds, preventing system fatigue.
- 🏎️ **Advanced Smoke Effects:**
  - Automatic smoke effect generation when cornering (drifting) above a certain speed (`speed >= 3.0`) and angle.
  - Custom smoke calculations when performing burnouts (`IsVehicleInBurnout`) while the vehicle is stationary or moving slowly.
- 🌐 **Multiplayer Sync Support:**
  - When the `CONFIG.multiplayer` setting is enabled, you can see not only the smoke from your own vehicle but also synchronized smoke from other players' vehicles around you.
- ⚙️ **Easy Configuration:**
  - Normal smoke size (`size`), burnout smoke size (`burnout_size`), smoke density (`dens`), and the rendering distance (`distance`) can be easily adjusted from the internal configuration.
- 🆓 **Framework Independent (Standalone):**
  - It does not require any base frameworks or database plugins to run.

---

## 📦 Dependencies

This resource is completely **Standalone**. It does not require any frameworks (ESX, QBCore, etc.) or additional libraries to function.

---

## 🚀 Quick Start & Setup

1. Place the downloaded folder into your server's `resources/` directory.
2. Open your `server.cfg` file and ensure the script:
   ```cfg
   ensure g6-advanced-smoke
   ```
3. Optionally, you can customize the smoke density and size settings to your liking from the `CONFIG` table located at the top of the `client.lua` file.
4. Start your server or run the `refresh` command followed by `start g6-advanced-smoke` from the server console.

---

## 📂 File Structure

```
g6-advanced-smoke/
├── fxmanifest.lua
└── client.lua
```
*(The files are defined as client-side scripts in the fxmanifest and do not create any load on the server-side.)*

---

<div align="center">
  <p>© 2026 <strong>G6 Studio & icietzsche Development</strong>. Tüm hakları saklıdır.</p>
</div>