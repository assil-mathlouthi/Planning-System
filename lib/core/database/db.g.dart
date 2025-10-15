// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $GradesTableTable extends GradesTable
    with TableInfo<$GradesTableTable, Grade> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GradesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeGradeMeta = const VerificationMeta(
    'codeGrade',
  );
  @override
  late final GeneratedColumn<String> codeGrade = GeneratedColumn<String>(
    'code_grade',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nbHeureMeta = const VerificationMeta(
    'nbHeure',
  );
  @override
  late final GeneratedColumn<int> nbHeure = GeneratedColumn<int>(
    'nb_heure',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [codeGrade, label, nbHeure];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'grades_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Grade> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code_grade')) {
      context.handle(
        _codeGradeMeta,
        codeGrade.isAcceptableOrUnknown(data['code_grade']!, _codeGradeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeGradeMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('nb_heure')) {
      context.handle(
        _nbHeureMeta,
        nbHeure.isAcceptableOrUnknown(data['nb_heure']!, _nbHeureMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codeGrade};
  @override
  Grade map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Grade(
      codeGrade: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code_grade'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      nbHeure: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}nb_heure'],
      )!,
    );
  }

  @override
  $GradesTableTable createAlias(String alias) {
    return $GradesTableTable(attachedDatabase, alias);
  }
}

class Grade extends DataClass implements Insertable<Grade> {
  final String codeGrade;
  final String label;
  final int nbHeure;
  const Grade({
    required this.codeGrade,
    required this.label,
    required this.nbHeure,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code_grade'] = Variable<String>(codeGrade);
    map['label'] = Variable<String>(label);
    map['nb_heure'] = Variable<int>(nbHeure);
    return map;
  }

  GradesTableCompanion toCompanion(bool nullToAbsent) {
    return GradesTableCompanion(
      codeGrade: Value(codeGrade),
      label: Value(label),
      nbHeure: Value(nbHeure),
    );
  }

  factory Grade.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Grade(
      codeGrade: serializer.fromJson<String>(json['codeGrade']),
      label: serializer.fromJson<String>(json['label']),
      nbHeure: serializer.fromJson<int>(json['nbHeure']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codeGrade': serializer.toJson<String>(codeGrade),
      'label': serializer.toJson<String>(label),
      'nbHeure': serializer.toJson<int>(nbHeure),
    };
  }

  Grade copyWith({String? codeGrade, String? label, int? nbHeure}) => Grade(
    codeGrade: codeGrade ?? this.codeGrade,
    label: label ?? this.label,
    nbHeure: nbHeure ?? this.nbHeure,
  );
  Grade copyWithCompanion(GradesTableCompanion data) {
    return Grade(
      codeGrade: data.codeGrade.present ? data.codeGrade.value : this.codeGrade,
      label: data.label.present ? data.label.value : this.label,
      nbHeure: data.nbHeure.present ? data.nbHeure.value : this.nbHeure,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Grade(')
          ..write('codeGrade: $codeGrade, ')
          ..write('label: $label, ')
          ..write('nbHeure: $nbHeure')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codeGrade, label, nbHeure);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Grade &&
          other.codeGrade == this.codeGrade &&
          other.label == this.label &&
          other.nbHeure == this.nbHeure);
}

class GradesTableCompanion extends UpdateCompanion<Grade> {
  final Value<String> codeGrade;
  final Value<String> label;
  final Value<int> nbHeure;
  final Value<int> rowid;
  const GradesTableCompanion({
    this.codeGrade = const Value.absent(),
    this.label = const Value.absent(),
    this.nbHeure = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GradesTableCompanion.insert({
    required String codeGrade,
    required String label,
    this.nbHeure = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : codeGrade = Value(codeGrade),
       label = Value(label);
  static Insertable<Grade> custom({
    Expression<String>? codeGrade,
    Expression<String>? label,
    Expression<int>? nbHeure,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (codeGrade != null) 'code_grade': codeGrade,
      if (label != null) 'label': label,
      if (nbHeure != null) 'nb_heure': nbHeure,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GradesTableCompanion copyWith({
    Value<String>? codeGrade,
    Value<String>? label,
    Value<int>? nbHeure,
    Value<int>? rowid,
  }) {
    return GradesTableCompanion(
      codeGrade: codeGrade ?? this.codeGrade,
      label: label ?? this.label,
      nbHeure: nbHeure ?? this.nbHeure,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codeGrade.present) {
      map['code_grade'] = Variable<String>(codeGrade.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (nbHeure.present) {
      map['nb_heure'] = Variable<int>(nbHeure.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GradesTableCompanion(')
          ..write('codeGrade: $codeGrade, ')
          ..write('label: $label, ')
          ..write('nbHeure: $nbHeure, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EnseignantsTableTable extends EnseignantsTable
    with TableInfo<$EnseignantsTableTable, Enseignant> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EnseignantsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeSmartexEnsMeta = const VerificationMeta(
    'codeSmartexEns',
  );
  @override
  late final GeneratedColumn<String> codeSmartexEns = GeneratedColumn<String>(
    'code_smartex_ens',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nomEnsMeta = const VerificationMeta('nomEns');
  @override
  late final GeneratedColumn<String> nomEns = GeneratedColumn<String>(
    'nom_ens',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _prenomEnsMeta = const VerificationMeta(
    'prenomEns',
  );
  @override
  late final GeneratedColumn<String> prenomEns = GeneratedColumn<String>(
    'prenom_ens',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailEnsMeta = const VerificationMeta(
    'emailEns',
  );
  @override
  late final GeneratedColumn<String> emailEns = GeneratedColumn<String>(
    'email_ens',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _gradeCodeEnsMeta = const VerificationMeta(
    'gradeCodeEns',
  );
  @override
  late final GeneratedColumn<String> gradeCodeEns = GeneratedColumn<String>(
    'grade_code_ens',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES grades_table (code_grade)',
    ),
    defaultValue: const Constant('ex'),
  );
  static const VerificationMeta _participeSurveillanceMeta =
      const VerificationMeta('participeSurveillance');
  @override
  late final GeneratedColumn<bool> participeSurveillance =
      GeneratedColumn<bool>(
        'participe_surveillance',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("participe_surveillance" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  @override
  List<GeneratedColumn> get $columns => [
    codeSmartexEns,
    nomEns,
    prenomEns,
    emailEns,
    gradeCodeEns,
    participeSurveillance,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'enseignants_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Enseignant> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code_smartex_ens')) {
      context.handle(
        _codeSmartexEnsMeta,
        codeSmartexEns.isAcceptableOrUnknown(
          data['code_smartex_ens']!,
          _codeSmartexEnsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_codeSmartexEnsMeta);
    }
    if (data.containsKey('nom_ens')) {
      context.handle(
        _nomEnsMeta,
        nomEns.isAcceptableOrUnknown(data['nom_ens']!, _nomEnsMeta),
      );
    } else if (isInserting) {
      context.missing(_nomEnsMeta);
    }
    if (data.containsKey('prenom_ens')) {
      context.handle(
        _prenomEnsMeta,
        prenomEns.isAcceptableOrUnknown(data['prenom_ens']!, _prenomEnsMeta),
      );
    } else if (isInserting) {
      context.missing(_prenomEnsMeta);
    }
    if (data.containsKey('email_ens')) {
      context.handle(
        _emailEnsMeta,
        emailEns.isAcceptableOrUnknown(data['email_ens']!, _emailEnsMeta),
      );
    } else if (isInserting) {
      context.missing(_emailEnsMeta);
    }
    if (data.containsKey('grade_code_ens')) {
      context.handle(
        _gradeCodeEnsMeta,
        gradeCodeEns.isAcceptableOrUnknown(
          data['grade_code_ens']!,
          _gradeCodeEnsMeta,
        ),
      );
    }
    if (data.containsKey('participe_surveillance')) {
      context.handle(
        _participeSurveillanceMeta,
        participeSurveillance.isAcceptableOrUnknown(
          data['participe_surveillance']!,
          _participeSurveillanceMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codeSmartexEns};
  @override
  Enseignant map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Enseignant(
      codeSmartexEns: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code_smartex_ens'],
      )!,
      nomEns: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nom_ens'],
      )!,
      prenomEns: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prenom_ens'],
      )!,
      emailEns: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email_ens'],
      )!,
      gradeCodeEns: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}grade_code_ens'],
      )!,
      participeSurveillance: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}participe_surveillance'],
      )!,
    );
  }

  @override
  $EnseignantsTableTable createAlias(String alias) {
    return $EnseignantsTableTable(attachedDatabase, alias);
  }
}

class Enseignant extends DataClass implements Insertable<Enseignant> {
  final String codeSmartexEns;
  final String nomEns;
  final String prenomEns;
  final String emailEns;
  final String gradeCodeEns;
  final bool participeSurveillance;
  const Enseignant({
    required this.codeSmartexEns,
    required this.nomEns,
    required this.prenomEns,
    required this.emailEns,
    required this.gradeCodeEns,
    required this.participeSurveillance,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code_smartex_ens'] = Variable<String>(codeSmartexEns);
    map['nom_ens'] = Variable<String>(nomEns);
    map['prenom_ens'] = Variable<String>(prenomEns);
    map['email_ens'] = Variable<String>(emailEns);
    map['grade_code_ens'] = Variable<String>(gradeCodeEns);
    map['participe_surveillance'] = Variable<bool>(participeSurveillance);
    return map;
  }

  EnseignantsTableCompanion toCompanion(bool nullToAbsent) {
    return EnseignantsTableCompanion(
      codeSmartexEns: Value(codeSmartexEns),
      nomEns: Value(nomEns),
      prenomEns: Value(prenomEns),
      emailEns: Value(emailEns),
      gradeCodeEns: Value(gradeCodeEns),
      participeSurveillance: Value(participeSurveillance),
    );
  }

  factory Enseignant.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Enseignant(
      codeSmartexEns: serializer.fromJson<String>(json['codeSmartexEns']),
      nomEns: serializer.fromJson<String>(json['nomEns']),
      prenomEns: serializer.fromJson<String>(json['prenomEns']),
      emailEns: serializer.fromJson<String>(json['emailEns']),
      gradeCodeEns: serializer.fromJson<String>(json['gradeCodeEns']),
      participeSurveillance: serializer.fromJson<bool>(
        json['participeSurveillance'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codeSmartexEns': serializer.toJson<String>(codeSmartexEns),
      'nomEns': serializer.toJson<String>(nomEns),
      'prenomEns': serializer.toJson<String>(prenomEns),
      'emailEns': serializer.toJson<String>(emailEns),
      'gradeCodeEns': serializer.toJson<String>(gradeCodeEns),
      'participeSurveillance': serializer.toJson<bool>(participeSurveillance),
    };
  }

  Enseignant copyWith({
    String? codeSmartexEns,
    String? nomEns,
    String? prenomEns,
    String? emailEns,
    String? gradeCodeEns,
    bool? participeSurveillance,
  }) => Enseignant(
    codeSmartexEns: codeSmartexEns ?? this.codeSmartexEns,
    nomEns: nomEns ?? this.nomEns,
    prenomEns: prenomEns ?? this.prenomEns,
    emailEns: emailEns ?? this.emailEns,
    gradeCodeEns: gradeCodeEns ?? this.gradeCodeEns,
    participeSurveillance: participeSurveillance ?? this.participeSurveillance,
  );
  Enseignant copyWithCompanion(EnseignantsTableCompanion data) {
    return Enseignant(
      codeSmartexEns: data.codeSmartexEns.present
          ? data.codeSmartexEns.value
          : this.codeSmartexEns,
      nomEns: data.nomEns.present ? data.nomEns.value : this.nomEns,
      prenomEns: data.prenomEns.present ? data.prenomEns.value : this.prenomEns,
      emailEns: data.emailEns.present ? data.emailEns.value : this.emailEns,
      gradeCodeEns: data.gradeCodeEns.present
          ? data.gradeCodeEns.value
          : this.gradeCodeEns,
      participeSurveillance: data.participeSurveillance.present
          ? data.participeSurveillance.value
          : this.participeSurveillance,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Enseignant(')
          ..write('codeSmartexEns: $codeSmartexEns, ')
          ..write('nomEns: $nomEns, ')
          ..write('prenomEns: $prenomEns, ')
          ..write('emailEns: $emailEns, ')
          ..write('gradeCodeEns: $gradeCodeEns, ')
          ..write('participeSurveillance: $participeSurveillance')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    codeSmartexEns,
    nomEns,
    prenomEns,
    emailEns,
    gradeCodeEns,
    participeSurveillance,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Enseignant &&
          other.codeSmartexEns == this.codeSmartexEns &&
          other.nomEns == this.nomEns &&
          other.prenomEns == this.prenomEns &&
          other.emailEns == this.emailEns &&
          other.gradeCodeEns == this.gradeCodeEns &&
          other.participeSurveillance == this.participeSurveillance);
}

class EnseignantsTableCompanion extends UpdateCompanion<Enseignant> {
  final Value<String> codeSmartexEns;
  final Value<String> nomEns;
  final Value<String> prenomEns;
  final Value<String> emailEns;
  final Value<String> gradeCodeEns;
  final Value<bool> participeSurveillance;
  final Value<int> rowid;
  const EnseignantsTableCompanion({
    this.codeSmartexEns = const Value.absent(),
    this.nomEns = const Value.absent(),
    this.prenomEns = const Value.absent(),
    this.emailEns = const Value.absent(),
    this.gradeCodeEns = const Value.absent(),
    this.participeSurveillance = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EnseignantsTableCompanion.insert({
    required String codeSmartexEns,
    required String nomEns,
    required String prenomEns,
    required String emailEns,
    this.gradeCodeEns = const Value.absent(),
    this.participeSurveillance = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : codeSmartexEns = Value(codeSmartexEns),
       nomEns = Value(nomEns),
       prenomEns = Value(prenomEns),
       emailEns = Value(emailEns);
  static Insertable<Enseignant> custom({
    Expression<String>? codeSmartexEns,
    Expression<String>? nomEns,
    Expression<String>? prenomEns,
    Expression<String>? emailEns,
    Expression<String>? gradeCodeEns,
    Expression<bool>? participeSurveillance,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (codeSmartexEns != null) 'code_smartex_ens': codeSmartexEns,
      if (nomEns != null) 'nom_ens': nomEns,
      if (prenomEns != null) 'prenom_ens': prenomEns,
      if (emailEns != null) 'email_ens': emailEns,
      if (gradeCodeEns != null) 'grade_code_ens': gradeCodeEns,
      if (participeSurveillance != null)
        'participe_surveillance': participeSurveillance,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EnseignantsTableCompanion copyWith({
    Value<String>? codeSmartexEns,
    Value<String>? nomEns,
    Value<String>? prenomEns,
    Value<String>? emailEns,
    Value<String>? gradeCodeEns,
    Value<bool>? participeSurveillance,
    Value<int>? rowid,
  }) {
    return EnseignantsTableCompanion(
      codeSmartexEns: codeSmartexEns ?? this.codeSmartexEns,
      nomEns: nomEns ?? this.nomEns,
      prenomEns: prenomEns ?? this.prenomEns,
      emailEns: emailEns ?? this.emailEns,
      gradeCodeEns: gradeCodeEns ?? this.gradeCodeEns,
      participeSurveillance:
          participeSurveillance ?? this.participeSurveillance,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codeSmartexEns.present) {
      map['code_smartex_ens'] = Variable<String>(codeSmartexEns.value);
    }
    if (nomEns.present) {
      map['nom_ens'] = Variable<String>(nomEns.value);
    }
    if (prenomEns.present) {
      map['prenom_ens'] = Variable<String>(prenomEns.value);
    }
    if (emailEns.present) {
      map['email_ens'] = Variable<String>(emailEns.value);
    }
    if (gradeCodeEns.present) {
      map['grade_code_ens'] = Variable<String>(gradeCodeEns.value);
    }
    if (participeSurveillance.present) {
      map['participe_surveillance'] = Variable<bool>(
        participeSurveillance.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnseignantsTableCompanion(')
          ..write('codeSmartexEns: $codeSmartexEns, ')
          ..write('nomEns: $nomEns, ')
          ..write('prenomEns: $prenomEns, ')
          ..write('emailEns: $emailEns, ')
          ..write('gradeCodeEns: $gradeCodeEns, ')
          ..write('participeSurveillance: $participeSurveillance, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MatiereTableTable extends MatiereTable
    with TableInfo<$MatiereTableTable, Matiere> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MatiereTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMatiereMeta = const VerificationMeta(
    'codeMatiere',
  );
  @override
  late final GeneratedColumn<String> codeMatiere = GeneratedColumn<String>(
    'code_matiere',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [codeMatiere, label];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'matiere_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Matiere> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code_matiere')) {
      context.handle(
        _codeMatiereMeta,
        codeMatiere.isAcceptableOrUnknown(
          data['code_matiere']!,
          _codeMatiereMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_codeMatiereMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codeMatiere};
  @override
  Matiere map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Matiere(
      codeMatiere: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code_matiere'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
    );
  }

  @override
  $MatiereTableTable createAlias(String alias) {
    return $MatiereTableTable(attachedDatabase, alias);
  }
}

class Matiere extends DataClass implements Insertable<Matiere> {
  final String codeMatiere;
  final String label;
  const Matiere({required this.codeMatiere, required this.label});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code_matiere'] = Variable<String>(codeMatiere);
    map['label'] = Variable<String>(label);
    return map;
  }

  MatiereTableCompanion toCompanion(bool nullToAbsent) {
    return MatiereTableCompanion(
      codeMatiere: Value(codeMatiere),
      label: Value(label),
    );
  }

  factory Matiere.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Matiere(
      codeMatiere: serializer.fromJson<String>(json['codeMatiere']),
      label: serializer.fromJson<String>(json['label']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codeMatiere': serializer.toJson<String>(codeMatiere),
      'label': serializer.toJson<String>(label),
    };
  }

  Matiere copyWith({String? codeMatiere, String? label}) => Matiere(
    codeMatiere: codeMatiere ?? this.codeMatiere,
    label: label ?? this.label,
  );
  Matiere copyWithCompanion(MatiereTableCompanion data) {
    return Matiere(
      codeMatiere: data.codeMatiere.present
          ? data.codeMatiere.value
          : this.codeMatiere,
      label: data.label.present ? data.label.value : this.label,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Matiere(')
          ..write('codeMatiere: $codeMatiere, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codeMatiere, label);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Matiere &&
          other.codeMatiere == this.codeMatiere &&
          other.label == this.label);
}

class MatiereTableCompanion extends UpdateCompanion<Matiere> {
  final Value<String> codeMatiere;
  final Value<String> label;
  final Value<int> rowid;
  const MatiereTableCompanion({
    this.codeMatiere = const Value.absent(),
    this.label = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MatiereTableCompanion.insert({
    required String codeMatiere,
    required String label,
    this.rowid = const Value.absent(),
  }) : codeMatiere = Value(codeMatiere),
       label = Value(label);
  static Insertable<Matiere> custom({
    Expression<String>? codeMatiere,
    Expression<String>? label,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (codeMatiere != null) 'code_matiere': codeMatiere,
      if (label != null) 'label': label,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MatiereTableCompanion copyWith({
    Value<String>? codeMatiere,
    Value<String>? label,
    Value<int>? rowid,
  }) {
    return MatiereTableCompanion(
      codeMatiere: codeMatiere ?? this.codeMatiere,
      label: label ?? this.label,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codeMatiere.present) {
      map['code_matiere'] = Variable<String>(codeMatiere.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MatiereTableCompanion(')
          ..write('codeMatiere: $codeMatiere, ')
          ..write('label: $label, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $GradesTableTable gradesTable = $GradesTableTable(this);
  late final $EnseignantsTableTable enseignantsTable = $EnseignantsTableTable(
    this,
  );
  late final $MatiereTableTable matiereTable = $MatiereTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    gradesTable,
    enseignantsTable,
    matiereTable,
  ];
}

typedef $$GradesTableTableCreateCompanionBuilder =
    GradesTableCompanion Function({
      required String codeGrade,
      required String label,
      Value<int> nbHeure,
      Value<int> rowid,
    });
typedef $$GradesTableTableUpdateCompanionBuilder =
    GradesTableCompanion Function({
      Value<String> codeGrade,
      Value<String> label,
      Value<int> nbHeure,
      Value<int> rowid,
    });

final class $$GradesTableTableReferences
    extends BaseReferences<_$AppDb, $GradesTableTable, Grade> {
  $$GradesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EnseignantsTableTable, List<Enseignant>>
  _enseignantsTableRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.enseignantsTable,
    aliasName: $_aliasNameGenerator(
      db.gradesTable.codeGrade,
      db.enseignantsTable.gradeCodeEns,
    ),
  );

  $$EnseignantsTableTableProcessedTableManager get enseignantsTableRefs {
    final manager =
        $$EnseignantsTableTableTableManager($_db, $_db.enseignantsTable).filter(
          (f) => f.gradeCodeEns.codeGrade.sqlEquals(
            $_itemColumn<String>('code_grade')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _enseignantsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GradesTableTableFilterComposer
    extends Composer<_$AppDb, $GradesTableTable> {
  $$GradesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get codeGrade => $composableBuilder(
    column: $table.codeGrade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nbHeure => $composableBuilder(
    column: $table.nbHeure,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> enseignantsTableRefs(
    Expression<bool> Function($$EnseignantsTableTableFilterComposer f) f,
  ) {
    final $$EnseignantsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codeGrade,
      referencedTable: $db.enseignantsTable,
      getReferencedColumn: (t) => t.gradeCodeEns,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnseignantsTableTableFilterComposer(
            $db: $db,
            $table: $db.enseignantsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GradesTableTableOrderingComposer
    extends Composer<_$AppDb, $GradesTableTable> {
  $$GradesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get codeGrade => $composableBuilder(
    column: $table.codeGrade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nbHeure => $composableBuilder(
    column: $table.nbHeure,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GradesTableTableAnnotationComposer
    extends Composer<_$AppDb, $GradesTableTable> {
  $$GradesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get codeGrade =>
      $composableBuilder(column: $table.codeGrade, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<int> get nbHeure =>
      $composableBuilder(column: $table.nbHeure, builder: (column) => column);

  Expression<T> enseignantsTableRefs<T extends Object>(
    Expression<T> Function($$EnseignantsTableTableAnnotationComposer a) f,
  ) {
    final $$EnseignantsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codeGrade,
      referencedTable: $db.enseignantsTable,
      getReferencedColumn: (t) => t.gradeCodeEns,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnseignantsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.enseignantsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GradesTableTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $GradesTableTable,
          Grade,
          $$GradesTableTableFilterComposer,
          $$GradesTableTableOrderingComposer,
          $$GradesTableTableAnnotationComposer,
          $$GradesTableTableCreateCompanionBuilder,
          $$GradesTableTableUpdateCompanionBuilder,
          (Grade, $$GradesTableTableReferences),
          Grade,
          PrefetchHooks Function({bool enseignantsTableRefs})
        > {
  $$GradesTableTableTableManager(_$AppDb db, $GradesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GradesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GradesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GradesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> codeGrade = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<int> nbHeure = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GradesTableCompanion(
                codeGrade: codeGrade,
                label: label,
                nbHeure: nbHeure,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String codeGrade,
                required String label,
                Value<int> nbHeure = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GradesTableCompanion.insert(
                codeGrade: codeGrade,
                label: label,
                nbHeure: nbHeure,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GradesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({enseignantsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (enseignantsTableRefs) db.enseignantsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (enseignantsTableRefs)
                    await $_getPrefetchedData<
                      Grade,
                      $GradesTableTable,
                      Enseignant
                    >(
                      currentTable: table,
                      referencedTable: $$GradesTableTableReferences
                          ._enseignantsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$GradesTableTableReferences(
                            db,
                            table,
                            p0,
                          ).enseignantsTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.gradeCodeEns == item.codeGrade,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$GradesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $GradesTableTable,
      Grade,
      $$GradesTableTableFilterComposer,
      $$GradesTableTableOrderingComposer,
      $$GradesTableTableAnnotationComposer,
      $$GradesTableTableCreateCompanionBuilder,
      $$GradesTableTableUpdateCompanionBuilder,
      (Grade, $$GradesTableTableReferences),
      Grade,
      PrefetchHooks Function({bool enseignantsTableRefs})
    >;
typedef $$EnseignantsTableTableCreateCompanionBuilder =
    EnseignantsTableCompanion Function({
      required String codeSmartexEns,
      required String nomEns,
      required String prenomEns,
      required String emailEns,
      Value<String> gradeCodeEns,
      Value<bool> participeSurveillance,
      Value<int> rowid,
    });
typedef $$EnseignantsTableTableUpdateCompanionBuilder =
    EnseignantsTableCompanion Function({
      Value<String> codeSmartexEns,
      Value<String> nomEns,
      Value<String> prenomEns,
      Value<String> emailEns,
      Value<String> gradeCodeEns,
      Value<bool> participeSurveillance,
      Value<int> rowid,
    });

final class $$EnseignantsTableTableReferences
    extends BaseReferences<_$AppDb, $EnseignantsTableTable, Enseignant> {
  $$EnseignantsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $GradesTableTable _gradeCodeEnsTable(_$AppDb db) =>
      db.gradesTable.createAlias(
        $_aliasNameGenerator(
          db.enseignantsTable.gradeCodeEns,
          db.gradesTable.codeGrade,
        ),
      );

  $$GradesTableTableProcessedTableManager get gradeCodeEns {
    final $_column = $_itemColumn<String>('grade_code_ens')!;

    final manager = $$GradesTableTableTableManager(
      $_db,
      $_db.gradesTable,
    ).filter((f) => f.codeGrade.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_gradeCodeEnsTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EnseignantsTableTableFilterComposer
    extends Composer<_$AppDb, $EnseignantsTableTable> {
  $$EnseignantsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get codeSmartexEns => $composableBuilder(
    column: $table.codeSmartexEns,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nomEns => $composableBuilder(
    column: $table.nomEns,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prenomEns => $composableBuilder(
    column: $table.prenomEns,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emailEns => $composableBuilder(
    column: $table.emailEns,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get participeSurveillance => $composableBuilder(
    column: $table.participeSurveillance,
    builder: (column) => ColumnFilters(column),
  );

  $$GradesTableTableFilterComposer get gradeCodeEns {
    final $$GradesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gradeCodeEns,
      referencedTable: $db.gradesTable,
      getReferencedColumn: (t) => t.codeGrade,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GradesTableTableFilterComposer(
            $db: $db,
            $table: $db.gradesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EnseignantsTableTableOrderingComposer
    extends Composer<_$AppDb, $EnseignantsTableTable> {
  $$EnseignantsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get codeSmartexEns => $composableBuilder(
    column: $table.codeSmartexEns,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nomEns => $composableBuilder(
    column: $table.nomEns,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prenomEns => $composableBuilder(
    column: $table.prenomEns,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emailEns => $composableBuilder(
    column: $table.emailEns,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get participeSurveillance => $composableBuilder(
    column: $table.participeSurveillance,
    builder: (column) => ColumnOrderings(column),
  );

  $$GradesTableTableOrderingComposer get gradeCodeEns {
    final $$GradesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gradeCodeEns,
      referencedTable: $db.gradesTable,
      getReferencedColumn: (t) => t.codeGrade,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GradesTableTableOrderingComposer(
            $db: $db,
            $table: $db.gradesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EnseignantsTableTableAnnotationComposer
    extends Composer<_$AppDb, $EnseignantsTableTable> {
  $$EnseignantsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get codeSmartexEns => $composableBuilder(
    column: $table.codeSmartexEns,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nomEns =>
      $composableBuilder(column: $table.nomEns, builder: (column) => column);

  GeneratedColumn<String> get prenomEns =>
      $composableBuilder(column: $table.prenomEns, builder: (column) => column);

  GeneratedColumn<String> get emailEns =>
      $composableBuilder(column: $table.emailEns, builder: (column) => column);

  GeneratedColumn<bool> get participeSurveillance => $composableBuilder(
    column: $table.participeSurveillance,
    builder: (column) => column,
  );

  $$GradesTableTableAnnotationComposer get gradeCodeEns {
    final $$GradesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gradeCodeEns,
      referencedTable: $db.gradesTable,
      getReferencedColumn: (t) => t.codeGrade,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GradesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.gradesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EnseignantsTableTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $EnseignantsTableTable,
          Enseignant,
          $$EnseignantsTableTableFilterComposer,
          $$EnseignantsTableTableOrderingComposer,
          $$EnseignantsTableTableAnnotationComposer,
          $$EnseignantsTableTableCreateCompanionBuilder,
          $$EnseignantsTableTableUpdateCompanionBuilder,
          (Enseignant, $$EnseignantsTableTableReferences),
          Enseignant,
          PrefetchHooks Function({bool gradeCodeEns})
        > {
  $$EnseignantsTableTableTableManager(_$AppDb db, $EnseignantsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EnseignantsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EnseignantsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EnseignantsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> codeSmartexEns = const Value.absent(),
                Value<String> nomEns = const Value.absent(),
                Value<String> prenomEns = const Value.absent(),
                Value<String> emailEns = const Value.absent(),
                Value<String> gradeCodeEns = const Value.absent(),
                Value<bool> participeSurveillance = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EnseignantsTableCompanion(
                codeSmartexEns: codeSmartexEns,
                nomEns: nomEns,
                prenomEns: prenomEns,
                emailEns: emailEns,
                gradeCodeEns: gradeCodeEns,
                participeSurveillance: participeSurveillance,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String codeSmartexEns,
                required String nomEns,
                required String prenomEns,
                required String emailEns,
                Value<String> gradeCodeEns = const Value.absent(),
                Value<bool> participeSurveillance = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EnseignantsTableCompanion.insert(
                codeSmartexEns: codeSmartexEns,
                nomEns: nomEns,
                prenomEns: prenomEns,
                emailEns: emailEns,
                gradeCodeEns: gradeCodeEns,
                participeSurveillance: participeSurveillance,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EnseignantsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({gradeCodeEns = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (gradeCodeEns) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.gradeCodeEns,
                                referencedTable:
                                    $$EnseignantsTableTableReferences
                                        ._gradeCodeEnsTable(db),
                                referencedColumn:
                                    $$EnseignantsTableTableReferences
                                        ._gradeCodeEnsTable(db)
                                        .codeGrade,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EnseignantsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $EnseignantsTableTable,
      Enseignant,
      $$EnseignantsTableTableFilterComposer,
      $$EnseignantsTableTableOrderingComposer,
      $$EnseignantsTableTableAnnotationComposer,
      $$EnseignantsTableTableCreateCompanionBuilder,
      $$EnseignantsTableTableUpdateCompanionBuilder,
      (Enseignant, $$EnseignantsTableTableReferences),
      Enseignant,
      PrefetchHooks Function({bool gradeCodeEns})
    >;
typedef $$MatiereTableTableCreateCompanionBuilder =
    MatiereTableCompanion Function({
      required String codeMatiere,
      required String label,
      Value<int> rowid,
    });
typedef $$MatiereTableTableUpdateCompanionBuilder =
    MatiereTableCompanion Function({
      Value<String> codeMatiere,
      Value<String> label,
      Value<int> rowid,
    });

class $$MatiereTableTableFilterComposer
    extends Composer<_$AppDb, $MatiereTableTable> {
  $$MatiereTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get codeMatiere => $composableBuilder(
    column: $table.codeMatiere,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MatiereTableTableOrderingComposer
    extends Composer<_$AppDb, $MatiereTableTable> {
  $$MatiereTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get codeMatiere => $composableBuilder(
    column: $table.codeMatiere,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MatiereTableTableAnnotationComposer
    extends Composer<_$AppDb, $MatiereTableTable> {
  $$MatiereTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get codeMatiere => $composableBuilder(
    column: $table.codeMatiere,
    builder: (column) => column,
  );

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);
}

class $$MatiereTableTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $MatiereTableTable,
          Matiere,
          $$MatiereTableTableFilterComposer,
          $$MatiereTableTableOrderingComposer,
          $$MatiereTableTableAnnotationComposer,
          $$MatiereTableTableCreateCompanionBuilder,
          $$MatiereTableTableUpdateCompanionBuilder,
          (Matiere, BaseReferences<_$AppDb, $MatiereTableTable, Matiere>),
          Matiere,
          PrefetchHooks Function()
        > {
  $$MatiereTableTableTableManager(_$AppDb db, $MatiereTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MatiereTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MatiereTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MatiereTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> codeMatiere = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MatiereTableCompanion(
                codeMatiere: codeMatiere,
                label: label,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String codeMatiere,
                required String label,
                Value<int> rowid = const Value.absent(),
              }) => MatiereTableCompanion.insert(
                codeMatiere: codeMatiere,
                label: label,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MatiereTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $MatiereTableTable,
      Matiere,
      $$MatiereTableTableFilterComposer,
      $$MatiereTableTableOrderingComposer,
      $$MatiereTableTableAnnotationComposer,
      $$MatiereTableTableCreateCompanionBuilder,
      $$MatiereTableTableUpdateCompanionBuilder,
      (Matiere, BaseReferences<_$AppDb, $MatiereTableTable, Matiere>),
      Matiere,
      PrefetchHooks Function()
    >;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$GradesTableTableTableManager get gradesTable =>
      $$GradesTableTableTableManager(_db, _db.gradesTable);
  $$EnseignantsTableTableTableManager get enseignantsTable =>
      $$EnseignantsTableTableTableManager(_db, _db.enseignantsTable);
  $$MatiereTableTableTableManager get matiereTable =>
      $$MatiereTableTableTableManager(_db, _db.matiereTable);
}
