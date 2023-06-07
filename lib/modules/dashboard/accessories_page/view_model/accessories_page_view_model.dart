import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sidgs_it_app/modules/services/firebase_service.dart';
part 'accessories_page_view_model.g.dart';

class AccessoriesPageViewModel = _AccessoriesPageViewModel with _$AccessoriesPageViewModel;

abstract class _AccessoriesPageViewModel with Store {


  @observable
  String serialNo = "";

  @action
  Future<bool> checkSerialNo(String val) async {
     return await FireBaseService().checkSerialNumberExistence(val);
  }

  @action
  Future scanBarCode() async {
    try {
      String barcode = await FlutterBarcodeScanner.scanBarcode("#ff6666", 'Cancel', true, ScanMode.BARCODE);

      if (barcode != "-1") {
        serialNo = barcode;

      } else {
        serialNo="null";
      }

      print("QRCode_Result:--");
      print(serialNo);

    } on PlatformException {
      serialNo = 'Failed to scan QR Code.';
    }
  }
}
