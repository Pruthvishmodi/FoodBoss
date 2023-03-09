// import 'dart:io';

// import 'package:flutter/material.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:pdf/pdf.dart';
// // import 'package:pdf/widgets.dart' as pw;
// import 'package:shared_widgets/Config/theme_config.dart';
// import 'package:seller_app/screens/pdf_preview.dart';
// import 'package:seller_app/widgets/food_boss_button.dart';


// class Pdf extends StatelessWidget {
//   final pdf = pw.Document();
//   writeOnPdf() {
//     pdf.addPage(pw.MultiPage(
//       pageFormat: PdfPageFormat.a4,
//       margin: const pw.EdgeInsets.all(32),
//       build: (pw.Context context) {
//         return <pw.Widget>[
//           pw.Header(level: 0, child: pw.Text('Order Summary')),
//           pw.Paragraph(text: 'asdna aidnasind fiknsfs ksn asjdnak kfenfw'),
//           pw.Paragraph(text: 'asdna aidnasind fiknsfs ksn asjdnak kfenfw'),
//           pw.Paragraph(text: 'asdna aidnasind fiknsfs ksn asjdnak kfenfw'),
//           pw.Header(level: 1, child: pw.Text('second heading')),
//           pw.Paragraph(text: 'asdna aidnasind fiknsfs ksn asjdnak kfenfw'),
//           pw.Paragraph(text: 'asdna aidnasind fiknsfs ksn asjdnak kfenfw'),
//           pw.Paragraph(text: 'asdna aidnasind fiknsfs ksn asjdnak kfenfw'),
//         ];
//       },
//     ));
//   }

//   Future savePdf() async {
//      Directory documentDirectory = await getApplicationDocumentsDirectory();
//      String documentPath = documentDirectory.path;
//      File file = File("$documentPath/example.pdf");
//     file.writeAsBytesSync(List.from(await pdf.save()));
//   }

//   Pdf({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ThemeConfig.PRIMARY_COLOR,
//         elevation: 0,
//         title: const Text("Order Summary"),
//       ),

      
//       body: Column(
//         children: [
//           FoodBossButtons(
//               text: 'pdf',
//               color: ThemeConfig.PRIMARY_COLOR,
//               bradius: 20,
//               textcolor: ThemeConfig.WHITE_COLOR,
//               fsize: ThemeConfig.TITLE_SIZE,
//               op: () async {
//                 writeOnPdf();
//                 await savePdf();
//                 Directory documentDirectory =
//                     await getApplicationDocumentsDirectory();
//                 String documentPath = documentDirectory.path;
//                 String fullPath = "$documentPath/example.pdf";
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=> PdfPreview(path: fullPath)));
//               },
//               type: 'filled',
//               bwidth: 30),
//         ],
//       ),
//     );
//   }
// }
