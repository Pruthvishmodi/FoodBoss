import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';

class ScanProductBarcode extends StatefulWidget {
  const ScanProductBarcode({Key? key}) : super(key: key);

  @override
  _ScanProductBarcodeState createState() => _ScanProductBarcodeState();
}

class _ScanProductBarcodeState extends State<ScanProductBarcode> {
  String _scanBarcode = 'Unknown';
  bool _isProduct = true;

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
      if (_scanBarcode != '-1') {
        _isProduct = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PageLayout(
      bottombar: false,
      appbarFunc: () {},
      title: 'Scan Barcode',
      child: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.all(size.width * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (_scanBarcode == 'Unknown' || _scanBarcode == '-1')
                ? Container(
                  height: size.height * 0.2,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ThemeConfig.FORM_COLOR,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: MainLabelText(titleString: "Scan Barcode",),
                )
                : _productTIle(size),
            SizedBox(
              height: size.height * 0.1,
            ),
            (_scanBarcode == 'Unknown' || _scanBarcode == '-1')
                ? Container(
                    width: double.infinity,
                    child: PrimaryButton(
                      width: double.infinity,
                      text: 'Scan',
                      op: scanBarcodeNormal,
                      type: 'filled',
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Container _productTIle(Size size) {
    return Container(
      height: size.height * 0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: ThemeConfig.FORM_COLOR),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/bakery.jpg',
            ),
            radius: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              MainLabelText(titleString: 'Product Name'),
              Desc(descString: 'Product Catgory'),
            ],
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                _scanBarcode = 'Unknown';
              });
            },
            color: ThemeConfig.PRIMARY_COLOR,
            textColor: ThemeConfig.WHITE_COLOR,
            child: const Icon(
              Icons.done_rounded,
              size: 30,
            ),
            padding: const EdgeInsets.all(16),
            shape: const CircleBorder(),
          )
        ],
      ),
    );
  }
}
