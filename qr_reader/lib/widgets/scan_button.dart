import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#3D8BEF', 'Cancelar', false, ScanMode.QR);
          //final barcodeScanRes = 'geo:19.475351,-99.048921';
          if (barcodeScanRes == '-1') {
            return;
          }

          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          final nuevoscan = await scanListProvider.nuevoScan(barcodeScanRes);
          launchURL(context, nuevoscan);
          // scanListProvider.nuevoScan('geo: 15.39,28.69');
        },
        child: Icon(Icons.filter_center_focus));
  }
}
