import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:planning_system/core/utils/assets.dart';

class PdfListDaffectation {
  static Future<p.Document> generateTemplate() async {
    final logo = p.MemoryImage(
      (await rootBundle.load(
        Assets.imagesInstitutSuperieurDinformatique,
      )).buffer.asUint8List(),
    );
    final pdf = p.Document();

    pdf.addPage(
      p.MultiPage(
        margin: const p.EdgeInsets.fromLTRB(
          21.26, // Left
          28.35, // Top
          21.26, // Right
          10, // Bottom
        ),
        build: (context) => buildPdfStructure(logo),
      ),
    );

    return pdf;
  }

  static List<p.Widget> buildPdfStructure(p.MemoryImage logo) {
    return [
      _buildHeader(logo),
      p.SizedBox(height: 20),
      _buildTitle(),
      p.SizedBox(height: 10),
      _buildRecipient(),
      p.SizedBox(height: 20),
      _buildMessage(),
      p.SizedBox(height: 20),
      _buildTable(),
    ];
  }

  static p.Widget _buildHeader(p.MemoryImage logo) {
    return p.Table(
      border: p.TableBorder.all(color: PdfColors.blue900, width: 1),
      columnWidths: {
        0: const p.FlexColumnWidth(2.5),
        1: const p.FlexColumnWidth(4),
        2: const p.FlexColumnWidth(2),
      },
      children: [
        p.TableRow(
          children: [
            p.Column(
              crossAxisAlignment: p.CrossAxisAlignment.center,
              mainAxisAlignment: p.MainAxisAlignment.center,
              children: [
                p.SizedBox(height: 25),
                p.Center(
                  child: p.Image(
                    logo,
                    width: 120,
                    alignment: p.Alignment.center,
                  ),
                ),
              ],
            ),
            p.Column(
              mainAxisAlignment: p.MainAxisAlignment.center,
              children: [
                p.SizedBox(height: 10),
                p.Text(
                  "GESTION DES EXAMENS ET\nDÉLIBÉRATIONS",
                  textAlign: p.TextAlign.center,
                  style: p.TextStyle(
                    fontWeight: p.FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                p.SizedBox(height: 10),
                p.Divider(color: PdfColors.blue900, height: 0),
                p.SizedBox(height: 10),
                p.Text(
                  "Procédure d'exécution des épreuves",
                  textAlign: p.TextAlign.center,
                  style: const p.TextStyle(fontSize: 12),
                ),
                p.SizedBox(height: 10),
                p.Divider(color: PdfColors.blue900, height: 0),

                p.SizedBox(height: 10),
                p.Text(
                  "Liste d'affectation des surveillants",
                  textAlign: p.TextAlign.center,
                  style: p.TextStyle(
                    fontWeight: p.FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                p.SizedBox(height: 10),
              ],
            ),
            p.Column(
              mainAxisAlignment: p.MainAxisAlignment.center,
              children: [
                p.SizedBox(height: 15),
                p.Text(
                  "EXD-FR-08-01",
                  textAlign: p.TextAlign.center,
                  style: p.TextStyle(
                    fontWeight: p.FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                p.SizedBox(height: 22),
                p.Divider(color: PdfColors.blue900, height: 0),
                p.SizedBox(height: 10),
                p.Text(
                  "Date d'approbation\n0504-24",
                  textAlign: p.TextAlign.center,
                  style: const p.TextStyle(fontSize: 10),
                ),
                p.SizedBox(height: 2),
                p.Divider(color: PdfColors.blue900, height: 0),

                p.SizedBox(height: 10),
                p.Text(
                  "Page 1/1",
                  textAlign: p.TextAlign.center,
                  style: p.TextStyle(
                    fontWeight: p.FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                p.SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ],
    );
  }

  static p.Widget _buildTitle() => p.Center(
    child: p.Text(
      "Notes à",
      style: p.TextStyle(fontSize: 14, color: PdfColors.blue900),
    ),
  );

  static p.Widget _buildRecipient() => p.Center(
    child: p.Text(
      "Mr Anis Kroumi",
      style: p.TextStyle(
        fontSize: 16,
        color: PdfColors.blue900,
        fontWeight: p.FontWeight.bold,
      ),
    ),
  );

  static p.Widget _buildMessage() => p.Padding(
    padding: const p.EdgeInsets.symmetric(horizontal: 10),
    child: p.Text(
      "Cher (e) Collègue,\n\n"
      "Vous êtes prié (e) d'assurer la surveillance et (ou) la responsabilité des examens selon le calendrier ci-joint.",
      style: const p.TextStyle(fontSize: 12),
    ),
  );

  // TODO : here pass your Data
  static p.Widget _buildTable() {
    final headers = ['Date', 'Heure', 'Durée'];
    final data = [
      ['2025-05-16', '08:30:00', '1.5 H'],
      ['2025-05-13', '08:30:00', '1.5 H'],
      ['2025-05-14', '10:30:00', '1.5 H'],
      ['2025-05-15', '10:30:00', '1.5 H'],
      ['2025-05-14', '08:30:00', '1.5 H'],
      ['2025-05-13', '10:30:00', '1.5 H'],
      ['2025-05-15', '10:30:00', '1.5 H'],
    ];

    // ignore: deprecated_member_use
    return p.Table.fromTextArray(
      headers: headers,
      data: data,
      headerStyle: p.TextStyle(
        color: PdfColors.white,
        fontWeight: p.FontWeight.bold,
      ),
      headerDecoration: const p.BoxDecoration(color: PdfColors.blue900),
      cellAlignment: p.Alignment.centerLeft,
      headerAlignment: p.Alignment.center,
      border: p.TableBorder.all(color: PdfColors.blue900, width: 0.5),
      cellStyle: const p.TextStyle(fontSize: 11),
    );
  }
}
