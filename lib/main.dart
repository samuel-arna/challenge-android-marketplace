import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'android/app.dart';

void main() => Platform.isIOS ? runApp(AndroidApp()) : runApp(AndroidApp());
// possibilidade de alteração de layout de acordo com a plataforma (no momento utilizando apenas o Layout para Android)
