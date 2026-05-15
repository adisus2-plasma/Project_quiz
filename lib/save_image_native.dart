import 'dart:typed_data';
import 'package:gal/gal.dart';

Future<void> saveImageBytes(Uint8List bytes, String name) async {
  final hasAccess = await Gal.hasAccess();
  if (!hasAccess) {
    final granted = await Gal.requestAccess();
    if (!granted) {
      throw Exception('ไม่ได้รับอนุญาตเข้าถึงคลังรูป');
    }
  }
  await Gal.putImageBytes(bytes, name: name);
}
