
import 'package:flutter/material.dart';

import 'locale_provider.dart';
class Languages {
  static Map<String, String> _arabicLanguage = {
    //welcome screen
    "language": "اللغة",
    "skip": "تخطي",
    "here": "هنا",
    "welcomeUser": "اهلا بيك بتطبيق مول العراق",
    "shoppingWelcome":
        " التطبيق الي من خلاله تكدر تشتري افضل المنتجات من ارقى الماركات وبارخص الاسعار",
    "userAgreementDesc":
        "سياسة خصوصية مراعية وشروط استخدام بسيطة تكدر تشوفها من ",
    "agree": "اوافق",
    "toYourLocation":
        "اطلب منتجاتك من اي مكان بالعراق وراح توصلك لحد باب البيت",
    "messagingAvailable":
        "ويا نظام المراسلة بداخل التطبيق خلينا التواصل ويانا اسهل. تكدر تراسلنا شوكت ما تحب",
    "letsStart": "نتمنى لك تجربة استخدام رائعة",
    "read": "اقرأ التالي",
    "userAgreementFullText":
        "ان تطبيق مول العراق هو تطبيق متجر الكتروني يسمح للمستخدم بشراء المنتجات وتتبعها ثم الدفع عند الاستلام. "
            "يحق للمستخدم استخدام التطبيق بما لا يسبب ضررا مقصودا في التطبيق او عمليات البيع داخله كما يحق له رفض استلام المنتج في حال كان غير مطابقا لما طلبه. "
            "يحتفظ صاحب التطبيق بالحق الكامل في حظر المستخدم من استخدام التطبيق اذا تسبب المستخدم عمدا في ضرر مادي او تقني. كما يمتلك الحق في اقامة الدعاوى القضائية. "
            "نحن نحترم خصوصية المستخدم, لذلك فان  جميع البيانات التابعة للمستخدم من سجل لعمليات الشراء او مراسلات او عناوين او بيانات الحساب او غير ذلك هي بيانات محفوظة ولا يتم مشاركتها مع اي جهة اخرى ولا يتم استخدامها من قبل التطبيق الا للاغراض المتعلقة بعمليات العرض والشراء. ",

    "userAgreement": "اتفاقية المستخدم",

    //login screen - login fragment
    "logo": "IraqMall",
    "enterPassword": "ادخل رمز الدخول",
    "forgotPassword": "هل نسيت رمز الدخول؟",
    "login": "تسجيل الدخول",
    "newAccount": "انشاء حساب؟",
    "enterPhone": "ادخل رقم الهاتف",
    "errorGettingUserInfo": "حصل خطا في تحميل البيانات",
    "errorAddingUser": "خطا في اضافة المستخدم",
    "wrongPassword": "رمز الدخول غير صحيح",
    "notValidNumber": "رقم الهاتف غير صالح",

    //*//login screen - signup fragment
    "enterName": "ادخل اسم المستخدم",
    "createAccount": "تسجيل الحساب",
    "alreadyExist": "لديك حساب؟",
    "verify": "تاكيد",
    "enterVerificationCode": "ادخل رمز التحقق",
    "enterVerificationCodeMessage": "قم بادخال الرمز الذي استلمته عن طريق الرسالة النصية",
    // exist "errorAddingUser": "خطا في اضافة المستخدم",

    //login screen - forgot fragment
    "forgotEnterPhoneMessage": "قم بادخال رقم الهاتف واضغط التالي, سوف تصلك رسالة نصية خلال دقائق",
    "next": "التالي",
    "cancel": "الغاء",
    "enterResetCodeMessage": "قم بادخال الرمز الذي استلمته عن طريق الرسالة النصية",
    "resetCodeHint": "رمز الاسترجاع",
    "forgotEnterPasswordMessage": "ادخل رمز الدخول الجديد الذي تريد استخدامه",
    "back": "رجوع",
    "passwordAlreadyResetMessage": "لقد تم تغيير رمز الدخول بنجاح, قم باستخدام الرمز الجديد لتسجيل الدخول",
    "errorSendingVerification": "حصل خطا في ارسال رمز التحقق",
    "wrongCode": "الرمز المدخل غير صحيح",
    "errorUpdating": "خطا في تحديث البيانات",
    //central app bar
    "categories": "الاقسام",
    //central drawer
    "account": "الحساب",
    "cart": "سلة المشتريات",
    "myRequests": "طلباتي",
    "aboutUs": "من نحن",
    "exit": "خروج",
    "followUs": "تابعنا",
    //customer service screen
    "support": "الدعم",
    "welcomingText":
    "اهلا بك عزيزي المستخدم في خدمة العملاء. نسعد باستقبال استفساراتك وطلباتك باي وقت. سيتم الرد عليك خلال دقائق في اوقات العمل الاعتيادية",
    "seen": "تم قرائة الرسالة",
    "sendMessageHint": "اكتب رسالتك هنا",
    //product screen
    "sizes": "الاحجام",
    "goToCart": "الذهاب لسلة الشراء",
    "addToCart": "اضافة لسلة الشراء",
    "youHaveQuestion": "هل لديك سؤال؟",
    "talkToUs": "راسلنا",
    //cart screen
    // already exist "cart": "cart",
    "emptyCart": "سلة الشراء فارغة",
    "buySelected": "شراء المحدد",
    "IQD": "دينار عراقي",
    "color": "اللون",
    "colorChosen": "تم اختيار اللون",
    "size":"الحجم",
    "otherDetails": "تفاصيل اخرى",
    "select": "تحديد",
    "ok": "حسنا",
    //exist "cancel": "cancel",
    "choosePhoto": "اختر اللون من الصور التالية",
    "chooseSize": "اختر الاحجام المطلوبة",
    //buying screen
    "deliveryInfo": "معلومات التوصيل",
    "receiverName": "اسم المستلم",
    "receiverPhone": "هاتف المستلم",
    "province": "المحافظة",
    "location" : "موقع الاستلام",
    "deliveryPrice": "سعر التوصيل",
    "productsPrice": "سعر المنتجات",
    "totalPrice": "السعر الكلي",
    "confirmBuying": "تاكيد الشراء",
    "requestedSuccessfully": "تم الطلب بنجاح",

  };
  static Map<String, String> _englishLanguage = {
    //welcome screen
    "language": "language",
    "skip": "skip",
    "here": "Here",

    "welcomeUser": "Welcome to IraqMall Application",
    "shoppingWelcome":
        "The application that provides you with best products from finest producers and at cheapest prices",
    "userAgreementDesc":
        "Considerate privacy policy and simple terms of use that you can see from",
    "agree": "Agree",
    "toYourLocation":
        "Order your products from anywhere at Iraq, and your order will be delivered to your home",
    "messagingAvailable":
        "With our in-app messaging system we made it easier to contact with us, you can contact us at anytime",
    "letsStart": "We wish you best experience",
    "read": "Read the following",
    "userAgreementFullText":
        "IraqMall application is e-commerce application that allows the user to buy products, tracking it, and pay on receive. "
            "The user has the right to use this application in the way that doesn't cause intentional harm or damage in the application or in the selling operations, and "
            "he has the right to refuse receiving the bought product if it was not identical to what he request. "
            "the application owners have the right to block the user from using this application if he broke the terms of use or cause an economical or technical harm, also the "
            "owners have the right to bring lawsuits. "
            "We highly respect user privacy, all user information in this application is saved privately and is not benn shared to any third parties, also these information is only used "
            "for the purposes of selling and showing products.",
    "userAgreement": "User Agreement",
    //login screen - login fragment
    "logo": "IraqMall",
    "enterPassword": "enter password",
    "forgotPassword": "forgot password?",
    "login": "login",
    "newAccount": "new account?",
    "enterPhone": "enter phone number",
    "errorGettingUserInfo": "error in downloading",
    "errorAddingUser": "error in adding user",
    "wrongPassword": "wrong password",
    "notValidNumber": "not valid number",
    //*//login screen - signup fragment
    "enterName": "enter user name",
    "createAccount": "create account",
    "alreadyExist": "exist account?",
    "verify": "verify",
    "enterVerificationCode": "enter verification code",
    "enterVerificationCodeMessage": "enter the code you received by sms and press verify",
    // exist "errorAddingUser": "خطا في اضافة المستخدم",
    //login screen - forgot fragment
    "forgotEnterPhoneMessage": "enter your phone number and press -next-, you will get an sms in a minute",
    "next": "next",
    "cancel": "cancel",
    "enterResetCodeMessage": "enter the code you received by sms and press next",
    "resetCodeHint": "reset code",
    "forgotEnterPasswordMessage": "enter the new password you want to use",
    "back": "back",
    "passwordAlreadyResetMessage": "password reset successfully, use the new password to login",
    "errorSendingVerification": "error in sending verification",
    "wrongCode": "the code is not correct",
    "errorUpdating": "error in updating",
    //central app bar
    "categories": "categories",
    //central drawer
    "account": "account",
    "cart": "cart",
    "myRequests": "my request",
    "aboutUs": "about us",
    "exit": "exit",
    "followUs": "follow us",
    //customer service screen
    "support": "support",
    "welcomingText": "Welcome to customer services, we glad to receive your questions and requests at any time, we will reply to you at minutes in the ordinary work times",
    "seen": "seen",
    "sendMessageHint": "write your message",
    //product screen
    "sizes": "sizes",
    "goToCart": "open cart",
    "addToCart": "added to cart",
    "youHaveQuestion": "do you have a question?",
    "talkToUs": "talk to us",
    //cart screen
    // already exist "cart": "cart",
    "emptyCart": "empty cart",
    "buySelected": "buy selected",
    "IQD": "IQD",
    "color": "color",
    "colorChosen": "color chosen",
    "size":"size",
    "otherDetails": "other details",
    "select": "select",
    "ok": "ok",
    //exist "cancel": "cancel",
    "choosePhoto": "choose the color from the following images",
    "chooseSize": "choose the size",
    //buying screen
    "deliveryInfo": "delivery info",
    "receiverName": "receiver name",
    "receiverPhone": "receiver phone",
    "province": "province",
    "location" : "receiving location",
    "deliveryPrice": "delivery price",
    "productsPrice": "products price",
    "totalPrice": "total price",
    "confirmBuying": "confirm buying",
    "requestedSuccessfully": "requested successfully",

  };

  late Map<String, String> _currentLanguage;
  Map<Locale, Map<String, String>> _languages = {
    LocaleProvider.englishLocale: _englishLanguage,
    LocaleProvider.arabicLocale: _arabicLanguage,
  };

  Languages(Locale locale) {
    _currentLanguage = _languages[locale] ?? _englishLanguage;
  }

  String getText(String key) {
    return _currentLanguage[key] ?? "404- " + key;
  }
}
