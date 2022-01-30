import 'package:flutter/cupertino.dart';
import 'package:project/res/resources.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}

