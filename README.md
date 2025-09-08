# tc_bootcamp_final

Bu proje, Techcareer.net tarafından düzenlenen Techcareer/Flutter App Development Bootcamp kapsamında geliştirilmiş bir Flutter E-Ticaret Mobil Uygulaması bitirme projesidir.

## 🚀 Proje Hakkında
<img width="1080" height="2400" alt="Screenshot_1757335277" src="https://github.com/user-attachments/assets/0bdb689e-0fa3-465c-a6cf-aa3597a47cfa" />
<img width="1080" height="2400" alt="Screenshot_1757335280" src="https://github.com/user-attachments/assets/4ba95fb5-bd2f-4e92-ab8a-e40525da95d3" />
<img width="1080" height="2400" alt="Screenshot_1757335290" src="https://github.com/user-attachments/assets/a25884dc-10a4-4238-8e5b-52741dc8daec" />


Bu uygulama, kullanıcıların ürünleri keşfetmesini, sepetine eklemesini ve sipariş vermesini sağlayan temel bir mobil e-ticaret deneyimi sunar.



**Özellikler:**

* **Ürün Listeleme:** Ana sayfada API'den çekilen tüm ürünleri gösterir.
* **Ürün Detayı:** Her bir ürünün detaylarını (açıklama, fiyat vb.) görüntüler.
* **Sepete Ekleme:** Ürünleri sepete ekleme ve sepet içeriğini yönetme.
* **Sepet Görüntüleme:** Sepetteki ürünleri listeleme ve adetlerini güncelleme.
* **Sepetten Ürün Silme:** Sepetteki ürünleri kaldırma.

## 🛠️ Kullanılan Teknolojiler

* **Flutter:** Mobil uygulama geliştirme Framework'ü.
* **Dart:** Flutter'ın kullandığı programlama dili.
* **Dio:** HTTP istekleri için kullanılan popüler bir Dart paketi.
* **Flutter_Bloc:** Bloc yapısı ve state management için kullanıldı.
* **Animated_Text_Kit:** Animasyonlu mesaj için kullanılan bir paket.


## ⚙️ Kurulum ve Çalıştırma

Bu projeyi yerel ortamınızda kurmak ve çalıştırmak için aşağıdaki adımları izleyin.

### Ön Koşullar

* [Flutter SDK](https://flutter.dev/docs/get-started/install) kurulu olmalı.
* [Git](https://git-scm.com/downloads) kurulu olmalı.
* Tercihen VS Code veya Android Studio gibi bir IDE.

### Adımlar

1.  **Projeyi Klonlayın:**
    ```bash
    git clone [https://github.com/KULLANICI_ADINIZ/tc_bootcamp_final.git](https://github.com/KULLANICI_ADINIZ/tc_bootcamp_final.git)
    ```
    veya GitHub'daki deponuzun doğru URL'sini kullanın.
2.  **Proje Dizine Girin:**
    ```bash
    cd tc_bootcamp_final
    ```
3.  **Gerekli Paketleri Yükleyin:**
    ```bash
    flutter pub get
    ```
4.  **Uygulamayı Çalıştırın:**
    Tercih ettiğiniz bir emülatör veya fiziksel cihaz açıkken uygulamayı başlatın:
    ```bash
    flutter run
    ```
    Veya IDE'nizdeki (VS Code/Android Studio) 'Run' butonunu kullanın.

**Not:** Bu proje, ders kapsamında sağlanan demo bir API (`http://kasimadalan.pe.hu/urunler/`) kullanmaktadır. Gerçek bir üretim uygulamasında kendi API'nizi veya yetkilendirme gerektiren bir API'yi entegre etmeniz gerekecektir.
