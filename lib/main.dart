import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'app/modules/routes/theme1_app_pages.dart';
import 'package:get/get.dart';

import 'app/providers/firebase_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void initServices() async {


  await GetStorage.init();
  await Firebase.initializeApp();
  await Get.putAsync(() => FirebaseProvider().init());

  Get.log("inicial servicos iniciados");

}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(
    GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

      ],
      supportedLocales: const [Locale('pt', 'BR')],
      getPages: Theme1AppPages.routes,
      debugShowCheckedModeBanner: false,
      initialRoute: Theme1AppPages.INITIAL,
    ),
  );
}
