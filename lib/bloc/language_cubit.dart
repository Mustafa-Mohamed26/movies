import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en')) {
    _loadSavedLanguage();
  }

  void changeLanguage(Locale locale) async {
    emit(locale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('appLanguage', locale.languageCode);
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLang = prefs.getString('appLanguage') ?? 'en';
    emit(Locale(savedLang));
  }
}