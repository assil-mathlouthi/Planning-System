import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:planning_system/core/utils/assets.dart';
import 'package:planning_system/features/planning/model/enseignant_pdf_model.dart';
import 'package:planning_system/core/enums/seance.dart' as core_seance;

class PdfListDaffectation {
  static Future<p.Document> generateTemplate(
    List<EnseignantPdfModel> list,
  ) async {
    log(list.toString());
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
        build: (context) => buildPdfStructure(logo, list),
      ),
    );

    return pdf;
  }

  static List<p.Widget> buildPdfStructure(
    p.MemoryImage logo,
    List<EnseignantPdfModel> list,
  ) {
    return [
      _buildHeader(logo),
      p.SizedBox(height: 20),
      _buildTitle(),
      p.SizedBox(height: 10),
      _buildRecipient("${list[0].nom} ${list[0].prenom}"),
      p.SizedBox(height: 20),
      _buildMessage(),
      p.SizedBox(height: 20),
      _buildTable(list),
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

  static p.Widget _buildRecipient(String name) => p.Center(
    child: p.Text(
      name,
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

  // Build table rows from the provided list using the last three attributes (date, seanceEnum, duree)
  static p.Widget _buildTable(List<EnseignantPdfModel> list) {
    final headers = ['Date', 'Heure', 'Durée'];
    final data = list
        .map(
          (m) => [
            _formatDate(m.date),
            _seanceToTime(m.seanceEnum),
            '${m.duree} H',
          ],
        )
        .toList();

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

  static String _formatDate(DateTime d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${d.year}-${two(d.month)}-${two(d.day)}';
  }

  static String _seanceToTime(core_seance.SeanceEnum s) {
    switch (s) {
      case core_seance.SeanceEnum.s1:
        return '08:30:00';
      case core_seance.SeanceEnum.s2:
        return '10:30:00';
      case core_seance.SeanceEnum.s3:
        return '12:30:00';
      case core_seance.SeanceEnum.s4:
        return '14:30:00';
    }
  }
}
