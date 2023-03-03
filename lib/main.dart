import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/presentation/screens/home_screens/pdf_view_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    const MyApp(
      key: Key('myApp'),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({required Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const PdfViewPage(
        key: Key(''),
      ),
    );
  }
}
