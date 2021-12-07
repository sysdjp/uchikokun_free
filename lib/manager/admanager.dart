import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;

  int maxFailedToAttempt = 3;
  int _numInterstitialLoadAttempt = 0;
  bool? ready;

  Future<void> initAdmob() {
    return MobileAds.instance.initialize();
  }

  void initBannerAd() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: bannerAdUnitId,
        listener: BannerAdListener(),
        request: AdRequest());
  }

  void initInterstitialAd() {
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback:
          InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
        interstitialAd = ad;
        _numInterstitialLoadAttempt = 0;
        _showInterstitialAd();
      }, onAdFailedToLoad: (LoadAdError error) {
        interstitialAd = null;
        _numInterstitialLoadAttempt++;
        if (_numInterstitialLoadAttempt < maxFailedToAttempt)
          initInterstitialAd();
      }),
    );
  }

  void loadInterstitialAd() {
    _showInterstitialAd();
  }

  // show interstitial ads to user
  Future<void> _showInterstitialAd() async {
    ready = false;
    if (interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        print("ad onAdshowedFullscreen");
      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print("ad Disposed");
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError aderror) {
        print('$ad OnAdFailed $aderror');
        ad.dispose();
        initInterstitialAd();
      },
    );

    // 広告の表示には.show()を使う
    await interstitialAd!.show();
    interstitialAd = null;
  }

  dispose() {
    bannerAd?.dispose();
    interstitialAd?.dispose();
  }

  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7767805284305443~4342365886";
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_ADMOB_APP_ID>";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7767805284305443/5463875861";
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_BANNER_AD_UNIT_ID>";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      // return "ca-app-pub-3940256099942544/1033173712"; //テスト用
      return "ca-app-pub-7767805284305443/6594599482";
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_INTERSTITIAL_AD_UNIT_ID>";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "<YOUR_ANDROID_REWARDED_AD_UNIT_ID>";
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_REWARDED_AD_UNIT_ID>";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
