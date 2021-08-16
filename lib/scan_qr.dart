import 'dart:developer';
import 'dart:io';
import 'package:bloc_patter_example_app/components/size_config.dart';
import 'package:bloc_patter_example_app/ui/panel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'components/colors.dart';

class ScanQR extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var value = "off";

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        color: Colors.transparent,
        collapsed: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Icon(
                Icons.expand_less,
                color: COLORS.whiteDark,
              ),
              Text(
                "Know More",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: COLORS.whiteDark,
                    fontSize: SizeConfig.blockWidth * 5),
              ),
            ],
          ),
        ),
        panel: returnPanel(),
        body: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  constraints:
                      BoxConstraints(maxHeight: SizeConfig.screenHeight),
                  child: Container(
                    child: _buildQrView(context),
                  ),
                ),
                Positioned(
                  top: SizeConfig.blockHeight * 25.5,
                  left: SizeConfig.screenWidth / 4.6,
                  child: Container(
                    child: Text(
                      "Make sure the QR code fits in the frame",
                      style: TextStyle(color: COLORS.whiteDark),
                    ),
                  ),
                ),
                Positioned(
                  bottom: SizeConfig.blockHeight * 35,
                  left: SizeConfig.screenWidth / 2.35,
                  child: Container(
                    child: FloatingActionButton(
                      backgroundColor: COLORS.whiteDark,
                      child: Icon(
                        Icons.bolt,
                        size: SizeConfig.blockWidth * 10,
                        color: COLORS.blackDark,
                      ),
                      onPressed: () async {
                        await controller?.toggleFlash();
                        setState(() {});
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: SizeConfig.blockHeight * 32,
                  child: Container(
                    width: SizeConfig.screenWidth,
                    child: FutureBuilder(
                      future: controller?.getFlashStatus(),
                      builder: (context, snapshot) {
                        return Text(
                          '${(snapshot.data) ? "ON" : "OFF"}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: COLORS.whiteDark),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: SizeConfig.blockHeight * 4,
                  right: SizeConfig.blockWidth * 2,
                  child: Container(
                    child: IconButton(
                      color: COLORS.whiteDark,
                      icon: Icon(
                        Icons.cancel,
                        size: SizeConfig.blockWidth * 10,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : SizeConfig.blockWidth * 30;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          cutOutBottomOffset: SizeConfig.blockHeight * 8,
          borderColor: COLORS.whiteDark,
          borderRadius: 10,
          borderLength: SizeConfig.blockHeight * 12,
          borderWidth: SizeConfig.blockWidth * 2,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
