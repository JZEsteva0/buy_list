import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class GeneratePrinting {
  Future<void> PrintingPdf(String name, String cpf, String email) async {
    final pdf = pw.Document();
    final netImage = await networkImage('https://down-br.img.susercontent.com/file/br-11134207-7r98o-m0j15spmh38g3d_tn.webp');

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text('O nome completo é: $name'),
                pw.Text('O CPF completo é: $cpf'),
                pw.Text('O email completo é: $email'),
                pw.Image(
                  netImage,
                  height: 250,
                  width: 250,
                ),
              ],
            ),
          ); // Center
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}