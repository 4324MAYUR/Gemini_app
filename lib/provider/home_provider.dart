import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gemini_app/helper/geminiHelper.dart';

class GeminiProvider with ChangeNotifier
{

  String? translateText;

  Future<void> translateData(String text) async {
    APIHELPER helper = APIHELPER();
    translateText = await helper.geminiAPI(text);
    log('$translateText');
    notifyListeners();
  }

}