import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class CertificateService {
  Future<File> generateCertificate(String name, String eventName) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text('Certificate of Participation',
                  style: pw.TextStyle(fontSize: 30, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),
              pw.Text('Awarded to: $name',
                  style: pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 10),
              pw.Text('For attending: $eventName',
                  style: pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 20),
              pw.Text('Date: ${DateTime.now()}',
                  style: pw.TextStyle(fontSize: 16)),
            ],
          ),
        );
      },
    ));

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/certificate_$name.pdf");
    await file.writeAsBytes(await pdf.save());
    return file;
  }
}