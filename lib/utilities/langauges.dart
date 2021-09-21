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
