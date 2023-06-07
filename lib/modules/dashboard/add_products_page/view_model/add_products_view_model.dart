import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:mobx/mobx.dart';
import 'package:sidgs_it_app/generated/locale_keys.g.dart';
import 'package:sidgs_it_app/modules/services/firebase_service.dart';

part 'add_products_view_model.g.dart';

class AddProductsPageViewModel = _AddProductsPageViewModel with _$AddProductsPageViewModel;

abstract class _AddProductsPageViewModel with Store {
  _AddProductsPageViewModel(){
    fetchRam();
    fetchHdd();
    fetchProcessor();
  }
  @observable
  String model = '';

  @observable
  String serialNo = '';

  @observable
  List<String> serialNoList = [];

  @observable
  List<String> deletedList = [];

  @observable
  String barcode = "";

  @observable
  bool isSubmitting = false;

  @observable
  String clickedCardString = '';

  @observable
  List<String> ramItems = ["Add Ram@"];

  @observable
  List<String> hddItems = ["Add Hdd"];

  @observable
  List<String> processorItems = ["Add Processor"];

  @computed
  String? get modelError {
    if (model.trim().isEmpty) {
      return LocaleKeys.requiredError.tr();
    }
    return null;
  }

  @action
  void setClickedCardString(String val) => clickedCardString = val;

  @action
  void setModel(String val) => model = val;

  @action
  void setSerialNo(String srVal) => serialNo = srVal;

  @action
  Future scanBarCode() async {
    try {
      barcode = await FlutterBarcodeScanner.scanBarcode("#ff6666", 'Cancel', true, ScanMode.BARCODE);

      if (barcode != "-1") {
        if (!serialNoList.contains(barcode)) {
          serialNo = barcode;
          serialNoList.add(barcode);
        } else {
          serialNo = "same";
        }
      } else {
        serialNo = "canceled";
      }

      print("QRCode_Result:--");
      print(barcode);
      print(serialNoList);
    } on PlatformException {
      serialNo = 'Failed to scan QR Code.';
    }
  }

  // @action
  // void addSameQrCode(){
  //   if(serialNoList.contains(barcode)){
  //     serialNoList.add(barcode);
  //   }
  // }

  @action
  void chipDeletion(int i) {
    serialNoList.removeAt(i);
    print(serialNoList);
  }

  @action
  void fetchRam(){
    FireBaseService().fetchItems("ram","ramSize").then((value) => ramItems.addAll(value));
    print(ramItems);
  }
  @action
  void fetchHdd(){
    FireBaseService().fetchItems("hdd","hddSize").then((value) => hddItems.addAll(value));
    print(ramItems);
  }
  @action
  void fetchProcessor(){
    FireBaseService().fetchItems("processor","processorSize").then((value) => processorItems.addAll(value));
    print(ramItems);
  }

  @computed
  bool get canSubmit => modelError == null;
}
