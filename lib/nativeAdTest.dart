import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAdTest extends StatefulWidget {
  const NativeAdTest({super.key});

  @override
  State<NativeAdTest> createState() => _NativeAdTestState();
}

class _NativeAdTestState extends State<NativeAdTest> {
  NativeAd? _ad;

  loadNativeAd() {
    try {
      _ad = NativeAd(
        adUnitId: "ca-app-pub-3940256099942544/3986624511",
        factoryId: 'listTile',
        request: const AdRequest(),
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            setState(() {
              _ad = ad as NativeAd;
            });
          },
          onAdFailedToLoad: (ad, error) {
            // Releases an ad resource when it fails to load
            ad.dispose();
            log('Ad load failed (code=${error.code} message=${error.message})');
          },
        ),
      );

      _ad!.load();
    } catch (e) {
      log("error $e");
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () => loadNativeAd());
    // loadNativeAd();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: Dispose a NativeAd object
    _ad?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // height: 320,
          color: Colors.blue,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              // TODO: Render a banner ad
              if (_ad != null && index == 5) {
                return Container(
                  height: 300.0,
                  alignment: Alignment.center,
                  child: AdWidget(ad: _ad!),
                );
              } else {
                return ListTile(
                  title: Text("$index"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
