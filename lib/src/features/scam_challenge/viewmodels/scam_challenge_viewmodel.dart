import 'package:flutter/foundation.dart';
import '../models/user_info.dart';

enum ScamChallengeStep {
  socialPost,
  infoCollection,
  warning
}

class ScamChallengeViewModel extends ChangeNotifier {
  ScamChallengeStep _currentStep = ScamChallengeStep.socialPost;
  UserInfo? _userInfo;
  final String _ctfFlag = "CTF{S0c1al_Eng1n33r1ng_4w4r3n3ss}";
  
  ScamChallengeStep get currentStep => _currentStep;
  UserInfo? get userInfo => _userInfo;
  String get ctfFlag => _ctfFlag;

  void moveToInfoCollection() {
    _currentStep = ScamChallengeStep.infoCollection;
    notifyListeners();
  }

  void submitUserInfo(UserInfo info) {
    _userInfo = info;
    _currentStep = ScamChallengeStep.warning;
    notifyListeners();
  }

  void reset() {
    _currentStep = ScamChallengeStep.socialPost;
    _userInfo = null;
    notifyListeners();
  }
}