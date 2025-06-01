class AppTexts {
  // app pages id's here
  static const String authPageId = 'auth';
  static const String homePageId = 'home';
  static const String detailPageId = 'detail';
  static const String cartPageId = 'cart';
  static const String mainPageId = 'mainPage';

  // auth opeartions strings here
  static const String mockMail = "berkeatahan@mail.com";
  static const String mockPassword = "123456";
  static const String mailLabel = 'Mail';
  static const String passwordLabel = 'Şifre';
  static const String loginHere = 'Giriş Yap';
  static const String validateFormMessage = "Bu alan boş bırakılamaz.";
  static const String authError = "Giriş başarısız. Lütfen tekrar deneyin.";
  static const String validateEmailMessage = "Email adresi giriniz.";
  static const String validatePasswordMessage = "Şifre giriniz.";
  static const String authCompletedMessage = "Başarıyla giriş yapıldı";
  static String validatePasswordLengthMessage(int min) =>
      "Şifre en az $min karakter olmalı.";
  static const String validateRegexcontrollMessage = "Email formatı geçersiz.";
  static const String errorOccurred = "Bir hata oluştu";
  static const String userNotFound = "Kullanıcı bulunamadı";
  static const String userNotFoundMessage =
      "Kullanıcı bulunamadı veya şifre yanlış";
  static const String wrongPassword = "Hatalı şifre";
  static const String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const String loginPageGreet = "Hoş Geldiniz!";

  // auth cubit strings here
  static const String loginFailed =
      'Giriş başarısız oldu. Kullanıcı adı veya şifre hatalı.';
  static const String unexpectedError = 'Beklenmedik bir hata oluştu:';
  static const String tryAgainMessage =
      'Beklenmedik bir hata oluştu. Lütfen tekrar deneyin.';

  // products model strings here
  static const String id = "id";
  static const String name = "ad";
  static const String image = "resim";
  static const String brand = "marka";
  static const String category = "kategori";
  static const String price = "fiyat";
  static const String productsForHomePage = "urunler";
  static const String products = "urunler_sepeti";
  static const String success = "success";
  // cart product model strings here
  static const String message = "message";
  static const String quantity = "siparisAdeti";
  static const String userName = "kullaniciAdi";
  static const String sepetId = "sepetId";

  // New texts for Cart
  static const String addToCartError = "Ürün sepete eklenirken hata oluştu";
  static const String addToCartServerError = "Sepete ekleme sunucu hatası";
  static const String getCartError = "Sepet ürünleri getirilirken hata oluştu";
  static const String getCartServerError = "Sepet ürünleri sunucu hatası";
  static const String deleteFromCartError =
      "Ürün sepetten silinirken hata oluştu";
  static const String deleteFromCartServerError =
      "Sepetten silme sunucu hatası";
  static const String clearCartError = "Sepet temizlenirken hata oluştu";

  // cart service impl strings here
  static const String cartResponseStatusCode =
      'Add to Cart Response Status Code:';
  static const String cartResponseData = 'Add to Cart Response Data:';
  static const String cartDioErrorResponse = 'Dio Error Response Data:';
  static const String cartDioErrorResponseStatusCode =
      'Dio Error Response Status Code: ';
  static const String getCartResponseStatusCode =
      'Get Cart Products Response Status Code:';
  static const String getCartResponseData = 'Get Cart Products Response Data:';
  static const String cartResponseMessage =
      "Empty or invalid response from API";
  static const String jsonResponseFailed = 'Failed to parse JSON response:';
  static const String deleteCartResponseStatusCode =
      'Delete Cart Product Response Status Code:';
  static const String deleteCartResponseData =
      'Delete Cart Product Response Data:';

  // product service impl strings here
  static const String productServerError =
      'Sunucudan geçerli bir yanıt alınamadı.';
  static const String productFetchError = 'Ürünler alınırken hata oluştu.';
  static const String serverSuccessValueMessage =
      'Sunucu success değeri 0 döndü.';
  static const String errorInRepository = 'Repository içinde hata oluştu: ';
  static const String unexpectedData =
      '- Unexpected data format after JSON decode.';
  static const String unexpectedResponseType =
      '- Unexpected response data type: ';
  static const String dioErrorResponse = 'Dio Error Response Data:';
  static const String dioErrorResponseStatusCode =
      'Dio Error Response Status Code: ';
  static const String dioError = 'Dio Error:';
  static const String unknown = 'Unknown';
  static const String networkError = 'Network Error:';

  // home page strings here
  static const String homeAppBar = 'Ana Sayfa';
  static const String searchWidgetTitle = 'Ürün ara...';
  static const String productNotFound = 'Aradığınız ürün bulunamadı';
  static const String emptyHomePageMessage = 'Hiç ürün bulunamadı';

  // cart cubit string here
  static const String defaultUserName = "berke_atahan";

  // cart page strings here
  static const String cartAppBar = 'Sepet';
  static const String cartUpdated = 'Sepet güncellendi!';
  static const String error = 'Hata:';
  static const String cartEmpty = 'Sepetinizde ürün bulunmamaktadır';
  static const String turkishLira = '₺';
  static const String totalPrice = 'Toplam Fiyat: ';
  static const String checkOutPageNavigation = 'Ödeme sayfasına gidiliyor...';
  static const String completeOrder = 'Siparişi Tamamla';

  // add to cart button strings here
  static const String addToCart = 'Sepete Ekle';
  static const String addToCartSuccess = 'sepete eklendi!';
}
