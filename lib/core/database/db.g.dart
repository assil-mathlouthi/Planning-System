// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $GradesTableTable extends GradesTable
    with TableInfo<$GradesTableTable, Grade> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GradesTableTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumnWithTypeConverter<GradeEnum, String> codeGrade =
      GeneratedColumn<String>(
        'code_grade',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<GradeEnum>($GradesTableTable.$convertercodeGrade);
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
  late final GeneratedColumn<double> nbHeure = GeneratedColumn<double>(
    'nb_heure',
    aliasedName,
    false,
    type: DriftSqlType.double,
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
      codeGrade: $GradesTableTable.$convertercodeGrade.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}code_grade'],
        )!,
      ),
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      nbHeure: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}nb_heure'],
      )!,
    );
  }

  @override
  $GradesTableTable createAlias(String alias) {
    return $GradesTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<GradeEnum, String, String> $convertercodeGrade =
      const EnumNameConverter<GradeEnum>(GradeEnum.values);
}

class Grade extends DataClass implements Insertable<Grade> {
  final GradeEnum codeGrade;
  final String label;
  final double nbHeure;
  const Grade({
    required this.codeGrade,
    required this.label,
    required this.nbHeure,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    {
      map['code_grade'] = Variable<String>(
        $GradesTableTable.$convertercodeGrade.toSql(codeGrade),
      );
    }
    map['label'] = Variable<String>(label);
    map['nb_heure'] = Variable<double>(nbHeure);
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
      codeGrade: $GradesTableTable.$convertercodeGrade.fromJson(
        serializer.fromJson<String>(json['codeGrade']),
      ),
      label: serializer.fromJson<String>(json['label']),
      nbHeure: serializer.fromJson<double>(json['nbHeure']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codeGrade': serializer.toJson<String>(
        $GradesTableTable.$convertercodeGrade.toJson(codeGrade),
      ),
      'label': serializer.toJson<String>(label),
      'nbHeure': serializer.toJson<double>(nbHeure),
    };
  }

  Grade copyWith({GradeEnum? codeGrade, String? label, double? nbHeure}) =>
      Grade(
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
  final Value<GradeEnum> codeGrade;
  final Value<String> label;
  final Value<double> nbHeure;
  final Value<int> rowid;
  const GradesTableCompanion({
    this.codeGrade = const Value.absent(),
    this.label = const Value.absent(),
    this.nbHeure = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GradesTableCompanion.insert({
    required GradeEnum codeGrade,
    required String label,
    this.nbHeure = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : codeGrade = Value(codeGrade),
       label = Value(label);
  static Insertable<Grade> custom({
    Expression<String>? codeGrade,
    Expression<String>? label,
    Expression<double>? nbHeure,
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
    Value<GradeEnum>? codeGrade,
    Value<String>? label,
    Value<double>? nbHeure,
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
      map['code_grade'] = Variable<String>(
        $GradesTableTable.$convertercodeGrade.toSql(codeGrade.value),
      );
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (nbHeure.present) {
      map['nb_heure'] = Variable<double>(nbHeure.value);
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
  @override
  late final GeneratedColumnWithTypeConverter<GradeEnum, String> gradeCodeEns =
      GeneratedColumn<String>(
        'grade_code_ens',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES grades_table (code_grade)',
        ),
      ).withConverter<GradeEnum>($EnseignantsTableTable.$convertergradeCodeEns);
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
      gradeCodeEns: $EnseignantsTableTable.$convertergradeCodeEns.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}grade_code_ens'],
        )!,
      ),
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

  static JsonTypeConverter2<GradeEnum, String, String> $convertergradeCodeEns =
      const EnumNameConverter<GradeEnum>(GradeEnum.values);
}

class Enseignant extends DataClass implements Insertable<Enseignant> {
  final String codeSmartexEns;
  final String nomEns;
  final String prenomEns;
  final String emailEns;
  final GradeEnum gradeCodeEns;
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
    {
      map['grade_code_ens'] = Variable<String>(
        $EnseignantsTableTable.$convertergradeCodeEns.toSql(gradeCodeEns),
      );
    }
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
      gradeCodeEns: $EnseignantsTableTable.$convertergradeCodeEns.fromJson(
        serializer.fromJson<String>(json['gradeCodeEns']),
      ),
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
      'gradeCodeEns': serializer.toJson<String>(
        $EnseignantsTableTable.$convertergradeCodeEns.toJson(gradeCodeEns),
      ),
      'participeSurveillance': serializer.toJson<bool>(participeSurveillance),
    };
  }

  Enseignant copyWith({
    String? codeSmartexEns,
    String? nomEns,
    String? prenomEns,
    String? emailEns,
    GradeEnum? gradeCodeEns,
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
  final Value<GradeEnum> gradeCodeEns;
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
    required GradeEnum gradeCodeEns,
    this.participeSurveillance = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : codeSmartexEns = Value(codeSmartexEns),
       nomEns = Value(nomEns),
       prenomEns = Value(prenomEns),
       emailEns = Value(emailEns),
       gradeCodeEns = Value(gradeCodeEns);
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
    Value<GradeEnum>? gradeCodeEns,
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
      map['grade_code_ens'] = Variable<String>(
        $EnseignantsTableTable.$convertergradeCodeEns.toSql(gradeCodeEns.value),
      );
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

class $EnseignantMatiereTableTable extends EnseignantMatiereTable
    with TableInfo<$EnseignantMatiereTableTable, EnseignantMatiere> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EnseignantMatiereTableTable(this.attachedDatabase, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns => [codeMatiere, codeSmartexEns];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'enseignant_matiere_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<EnseignantMatiere> instance, {
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codeMatiere, codeSmartexEns};
  @override
  EnseignantMatiere map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EnseignantMatiere(
      codeMatiere: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code_matiere'],
      )!,
      codeSmartexEns: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code_smartex_ens'],
      )!,
    );
  }

  @override
  $EnseignantMatiereTableTable createAlias(String alias) {
    return $EnseignantMatiereTableTable(attachedDatabase, alias);
  }
}

class EnseignantMatiere extends DataClass
    implements Insertable<EnseignantMatiere> {
  final String codeMatiere;
  final String codeSmartexEns;
  const EnseignantMatiere({
    required this.codeMatiere,
    required this.codeSmartexEns,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code_matiere'] = Variable<String>(codeMatiere);
    map['code_smartex_ens'] = Variable<String>(codeSmartexEns);
    return map;
  }

  EnseignantMatiereTableCompanion toCompanion(bool nullToAbsent) {
    return EnseignantMatiereTableCompanion(
      codeMatiere: Value(codeMatiere),
      codeSmartexEns: Value(codeSmartexEns),
    );
  }

  factory EnseignantMatiere.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EnseignantMatiere(
      codeMatiere: serializer.fromJson<String>(json['codeMatiere']),
      codeSmartexEns: serializer.fromJson<String>(json['codeSmartexEns']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codeMatiere': serializer.toJson<String>(codeMatiere),
      'codeSmartexEns': serializer.toJson<String>(codeSmartexEns),
    };
  }

  EnseignantMatiere copyWith({String? codeMatiere, String? codeSmartexEns}) =>
      EnseignantMatiere(
        codeMatiere: codeMatiere ?? this.codeMatiere,
        codeSmartexEns: codeSmartexEns ?? this.codeSmartexEns,
      );
  EnseignantMatiere copyWithCompanion(EnseignantMatiereTableCompanion data) {
    return EnseignantMatiere(
      codeMatiere: data.codeMatiere.present
          ? data.codeMatiere.value
          : this.codeMatiere,
      codeSmartexEns: data.codeSmartexEns.present
          ? data.codeSmartexEns.value
          : this.codeSmartexEns,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EnseignantMatiere(')
          ..write('codeMatiere: $codeMatiere, ')
          ..write('codeSmartexEns: $codeSmartexEns')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codeMatiere, codeSmartexEns);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EnseignantMatiere &&
          other.codeMatiere == this.codeMatiere &&
          other.codeSmartexEns == this.codeSmartexEns);
}

class EnseignantMatiereTableCompanion
    extends UpdateCompanion<EnseignantMatiere> {
  final Value<String> codeMatiere;
  final Value<String> codeSmartexEns;
  final Value<int> rowid;
  const EnseignantMatiereTableCompanion({
    this.codeMatiere = const Value.absent(),
    this.codeSmartexEns = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EnseignantMatiereTableCompanion.insert({
    required String codeMatiere,
    required String codeSmartexEns,
    this.rowid = const Value.absent(),
  }) : codeMatiere = Value(codeMatiere),
       codeSmartexEns = Value(codeSmartexEns);
  static Insertable<EnseignantMatiere> custom({
    Expression<String>? codeMatiere,
    Expression<String>? codeSmartexEns,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (codeMatiere != null) 'code_matiere': codeMatiere,
      if (codeSmartexEns != null) 'code_smartex_ens': codeSmartexEns,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EnseignantMatiereTableCompanion copyWith({
    Value<String>? codeMatiere,
    Value<String>? codeSmartexEns,
    Value<int>? rowid,
  }) {
    return EnseignantMatiereTableCompanion(
      codeMatiere: codeMatiere ?? this.codeMatiere,
      codeSmartexEns: codeSmartexEns ?? this.codeSmartexEns,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codeMatiere.present) {
      map['code_matiere'] = Variable<String>(codeMatiere.value);
    }
    if (codeSmartexEns.present) {
      map['code_smartex_ens'] = Variable<String>(codeSmartexEns.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnseignantMatiereTableCompanion(')
          ..write('codeMatiere: $codeMatiere, ')
          ..write('codeSmartexEns: $codeSmartexEns, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VoeuxTableTable extends VoeuxTable
    with TableInfo<$VoeuxTableTable, Voeux> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VoeuxTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SemestreEnum, String> semestre =
      GeneratedColumn<String>(
        'semestre',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<SemestreEnum>($VoeuxTableTable.$convertersemestre);
  @override
  late final GeneratedColumnWithTypeConverter<SessionEnum, String> session =
      GeneratedColumn<String>(
        'session',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<SessionEnum>($VoeuxTableTable.$convertersession);
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES enseignants_table (code_smartex_ens)',
    ),
  );
  static const VerificationMeta _jourMeta = const VerificationMeta('jour');
  @override
  late final GeneratedColumn<int> jour = GeneratedColumn<int>(
    'jour',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SeanceEnum, String> seance =
      GeneratedColumn<String>(
        'seance',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<SeanceEnum>($VoeuxTableTable.$converterseance);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    semestre,
    session,
    codeSmartexEns,
    jour,
    seance,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'voeux_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Voeux> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
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
    if (data.containsKey('jour')) {
      context.handle(
        _jourMeta,
        jour.isAcceptableOrUnknown(data['jour']!, _jourMeta),
      );
    } else if (isInserting) {
      context.missing(_jourMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Voeux map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Voeux(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      semestre: $VoeuxTableTable.$convertersemestre.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}semestre'],
        )!,
      ),
      session: $VoeuxTableTable.$convertersession.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}session'],
        )!,
      ),
      codeSmartexEns: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code_smartex_ens'],
      )!,
      jour: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}jour'],
      )!,
      seance: $VoeuxTableTable.$converterseance.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}seance'],
        )!,
      ),
    );
  }

  @override
  $VoeuxTableTable createAlias(String alias) {
    return $VoeuxTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SemestreEnum, String, String> $convertersemestre =
      const EnumNameConverter<SemestreEnum>(SemestreEnum.values);
  static JsonTypeConverter2<SessionEnum, String, String> $convertersession =
      const EnumNameConverter<SessionEnum>(SessionEnum.values);
  static JsonTypeConverter2<SeanceEnum, String, String> $converterseance =
      const EnumNameConverter<SeanceEnum>(SeanceEnum.values);
}

class Voeux extends DataClass implements Insertable<Voeux> {
  final int id;
  final SemestreEnum semestre;
  final SessionEnum session;
  final String codeSmartexEns;
  final int jour;
  final SeanceEnum seance;
  const Voeux({
    required this.id,
    required this.semestre,
    required this.session,
    required this.codeSmartexEns,
    required this.jour,
    required this.seance,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['semestre'] = Variable<String>(
        $VoeuxTableTable.$convertersemestre.toSql(semestre),
      );
    }
    {
      map['session'] = Variable<String>(
        $VoeuxTableTable.$convertersession.toSql(session),
      );
    }
    map['code_smartex_ens'] = Variable<String>(codeSmartexEns);
    map['jour'] = Variable<int>(jour);
    {
      map['seance'] = Variable<String>(
        $VoeuxTableTable.$converterseance.toSql(seance),
      );
    }
    return map;
  }

  VoeuxTableCompanion toCompanion(bool nullToAbsent) {
    return VoeuxTableCompanion(
      id: Value(id),
      semestre: Value(semestre),
      session: Value(session),
      codeSmartexEns: Value(codeSmartexEns),
      jour: Value(jour),
      seance: Value(seance),
    );
  }

  factory Voeux.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Voeux(
      id: serializer.fromJson<int>(json['id']),
      semestre: $VoeuxTableTable.$convertersemestre.fromJson(
        serializer.fromJson<String>(json['semestre']),
      ),
      session: $VoeuxTableTable.$convertersession.fromJson(
        serializer.fromJson<String>(json['session']),
      ),
      codeSmartexEns: serializer.fromJson<String>(json['codeSmartexEns']),
      jour: serializer.fromJson<int>(json['jour']),
      seance: $VoeuxTableTable.$converterseance.fromJson(
        serializer.fromJson<String>(json['seance']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'semestre': serializer.toJson<String>(
        $VoeuxTableTable.$convertersemestre.toJson(semestre),
      ),
      'session': serializer.toJson<String>(
        $VoeuxTableTable.$convertersession.toJson(session),
      ),
      'codeSmartexEns': serializer.toJson<String>(codeSmartexEns),
      'jour': serializer.toJson<int>(jour),
      'seance': serializer.toJson<String>(
        $VoeuxTableTable.$converterseance.toJson(seance),
      ),
    };
  }

  Voeux copyWith({
    int? id,
    SemestreEnum? semestre,
    SessionEnum? session,
    String? codeSmartexEns,
    int? jour,
    SeanceEnum? seance,
  }) => Voeux(
    id: id ?? this.id,
    semestre: semestre ?? this.semestre,
    session: session ?? this.session,
    codeSmartexEns: codeSmartexEns ?? this.codeSmartexEns,
    jour: jour ?? this.jour,
    seance: seance ?? this.seance,
  );
  Voeux copyWithCompanion(VoeuxTableCompanion data) {
    return Voeux(
      id: data.id.present ? data.id.value : this.id,
      semestre: data.semestre.present ? data.semestre.value : this.semestre,
      session: data.session.present ? data.session.value : this.session,
      codeSmartexEns: data.codeSmartexEns.present
          ? data.codeSmartexEns.value
          : this.codeSmartexEns,
      jour: data.jour.present ? data.jour.value : this.jour,
      seance: data.seance.present ? data.seance.value : this.seance,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Voeux(')
          ..write('id: $id, ')
          ..write('semestre: $semestre, ')
          ..write('session: $session, ')
          ..write('codeSmartexEns: $codeSmartexEns, ')
          ..write('jour: $jour, ')
          ..write('seance: $seance')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, semestre, session, codeSmartexEns, jour, seance);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Voeux &&
          other.id == this.id &&
          other.semestre == this.semestre &&
          other.session == this.session &&
          other.codeSmartexEns == this.codeSmartexEns &&
          other.jour == this.jour &&
          other.seance == this.seance);
}

class VoeuxTableCompanion extends UpdateCompanion<Voeux> {
  final Value<int> id;
  final Value<SemestreEnum> semestre;
  final Value<SessionEnum> session;
  final Value<String> codeSmartexEns;
  final Value<int> jour;
  final Value<SeanceEnum> seance;
  const VoeuxTableCompanion({
    this.id = const Value.absent(),
    this.semestre = const Value.absent(),
    this.session = const Value.absent(),
    this.codeSmartexEns = const Value.absent(),
    this.jour = const Value.absent(),
    this.seance = const Value.absent(),
  });
  VoeuxTableCompanion.insert({
    this.id = const Value.absent(),
    required SemestreEnum semestre,
    required SessionEnum session,
    required String codeSmartexEns,
    required int jour,
    required SeanceEnum seance,
  }) : semestre = Value(semestre),
       session = Value(session),
       codeSmartexEns = Value(codeSmartexEns),
       jour = Value(jour),
       seance = Value(seance);
  static Insertable<Voeux> custom({
    Expression<int>? id,
    Expression<String>? semestre,
    Expression<String>? session,
    Expression<String>? codeSmartexEns,
    Expression<int>? jour,
    Expression<String>? seance,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (semestre != null) 'semestre': semestre,
      if (session != null) 'session': session,
      if (codeSmartexEns != null) 'code_smartex_ens': codeSmartexEns,
      if (jour != null) 'jour': jour,
      if (seance != null) 'seance': seance,
    });
  }

  VoeuxTableCompanion copyWith({
    Value<int>? id,
    Value<SemestreEnum>? semestre,
    Value<SessionEnum>? session,
    Value<String>? codeSmartexEns,
    Value<int>? jour,
    Value<SeanceEnum>? seance,
  }) {
    return VoeuxTableCompanion(
      id: id ?? this.id,
      semestre: semestre ?? this.semestre,
      session: session ?? this.session,
      codeSmartexEns: codeSmartexEns ?? this.codeSmartexEns,
      jour: jour ?? this.jour,
      seance: seance ?? this.seance,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (semestre.present) {
      map['semestre'] = Variable<String>(
        $VoeuxTableTable.$convertersemestre.toSql(semestre.value),
      );
    }
    if (session.present) {
      map['session'] = Variable<String>(
        $VoeuxTableTable.$convertersession.toSql(session.value),
      );
    }
    if (codeSmartexEns.present) {
      map['code_smartex_ens'] = Variable<String>(codeSmartexEns.value);
    }
    if (jour.present) {
      map['jour'] = Variable<int>(jour.value);
    }
    if (seance.present) {
      map['seance'] = Variable<String>(
        $VoeuxTableTable.$converterseance.toSql(seance.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VoeuxTableCompanion(')
          ..write('id: $id, ')
          ..write('semestre: $semestre, ')
          ..write('session: $session, ')
          ..write('codeSmartexEns: $codeSmartexEns, ')
          ..write('jour: $jour, ')
          ..write('seance: $seance')
          ..write(')'))
        .toString();
  }
}

class $CreneauTableTable extends CreneauTable
    with TableInfo<$CreneauTableTable, Creneau> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CreneauTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeCreneauMeta = const VerificationMeta(
    'codeCreneau',
  );
  @override
  late final GeneratedColumn<int> codeCreneau = GeneratedColumn<int>(
    'code_creneau',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nbSalleMeta = const VerificationMeta(
    'nbSalle',
  );
  @override
  late final GeneratedColumn<int> nbSalle = GeneratedColumn<int>(
    'nb_salle',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SeanceEnum, String> seance =
      GeneratedColumn<String>(
        'seance',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<SeanceEnum>($CreneauTableTable.$converterseance);
  static const VerificationMeta _dateCreneauMeta = const VerificationMeta(
    'dateCreneau',
  );
  @override
  late final GeneratedColumn<DateTime> dateCreneau = GeneratedColumn<DateTime>(
    'date_creneau',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    codeCreneau,
    nbSalle,
    seance,
    dateCreneau,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'creneau_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Creneau> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code_creneau')) {
      context.handle(
        _codeCreneauMeta,
        codeCreneau.isAcceptableOrUnknown(
          data['code_creneau']!,
          _codeCreneauMeta,
        ),
      );
    }
    if (data.containsKey('nb_salle')) {
      context.handle(
        _nbSalleMeta,
        nbSalle.isAcceptableOrUnknown(data['nb_salle']!, _nbSalleMeta),
      );
    } else if (isInserting) {
      context.missing(_nbSalleMeta);
    }
    if (data.containsKey('date_creneau')) {
      context.handle(
        _dateCreneauMeta,
        dateCreneau.isAcceptableOrUnknown(
          data['date_creneau']!,
          _dateCreneauMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dateCreneauMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codeCreneau};
  @override
  Creneau map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Creneau(
      codeCreneau: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}code_creneau'],
      )!,
      nbSalle: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}nb_salle'],
      )!,
      seance: $CreneauTableTable.$converterseance.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}seance'],
        )!,
      ),
      dateCreneau: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_creneau'],
      )!,
    );
  }

  @override
  $CreneauTableTable createAlias(String alias) {
    return $CreneauTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SeanceEnum, String, String> $converterseance =
      const EnumNameConverter<SeanceEnum>(SeanceEnum.values);
}

class Creneau extends DataClass implements Insertable<Creneau> {
  final int codeCreneau;
  final int nbSalle;
  final SeanceEnum seance;
  final DateTime dateCreneau;
  const Creneau({
    required this.codeCreneau,
    required this.nbSalle,
    required this.seance,
    required this.dateCreneau,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code_creneau'] = Variable<int>(codeCreneau);
    map['nb_salle'] = Variable<int>(nbSalle);
    {
      map['seance'] = Variable<String>(
        $CreneauTableTable.$converterseance.toSql(seance),
      );
    }
    map['date_creneau'] = Variable<DateTime>(dateCreneau);
    return map;
  }

  CreneauTableCompanion toCompanion(bool nullToAbsent) {
    return CreneauTableCompanion(
      codeCreneau: Value(codeCreneau),
      nbSalle: Value(nbSalle),
      seance: Value(seance),
      dateCreneau: Value(dateCreneau),
    );
  }

  factory Creneau.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Creneau(
      codeCreneau: serializer.fromJson<int>(json['codeCreneau']),
      nbSalle: serializer.fromJson<int>(json['nbSalle']),
      seance: $CreneauTableTable.$converterseance.fromJson(
        serializer.fromJson<String>(json['seance']),
      ),
      dateCreneau: serializer.fromJson<DateTime>(json['dateCreneau']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codeCreneau': serializer.toJson<int>(codeCreneau),
      'nbSalle': serializer.toJson<int>(nbSalle),
      'seance': serializer.toJson<String>(
        $CreneauTableTable.$converterseance.toJson(seance),
      ),
      'dateCreneau': serializer.toJson<DateTime>(dateCreneau),
    };
  }

  Creneau copyWith({
    int? codeCreneau,
    int? nbSalle,
    SeanceEnum? seance,
    DateTime? dateCreneau,
  }) => Creneau(
    codeCreneau: codeCreneau ?? this.codeCreneau,
    nbSalle: nbSalle ?? this.nbSalle,
    seance: seance ?? this.seance,
    dateCreneau: dateCreneau ?? this.dateCreneau,
  );
  Creneau copyWithCompanion(CreneauTableCompanion data) {
    return Creneau(
      codeCreneau: data.codeCreneau.present
          ? data.codeCreneau.value
          : this.codeCreneau,
      nbSalle: data.nbSalle.present ? data.nbSalle.value : this.nbSalle,
      seance: data.seance.present ? data.seance.value : this.seance,
      dateCreneau: data.dateCreneau.present
          ? data.dateCreneau.value
          : this.dateCreneau,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Creneau(')
          ..write('codeCreneau: $codeCreneau, ')
          ..write('nbSalle: $nbSalle, ')
          ..write('seance: $seance, ')
          ..write('dateCreneau: $dateCreneau')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codeCreneau, nbSalle, seance, dateCreneau);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Creneau &&
          other.codeCreneau == this.codeCreneau &&
          other.nbSalle == this.nbSalle &&
          other.seance == this.seance &&
          other.dateCreneau == this.dateCreneau);
}

class CreneauTableCompanion extends UpdateCompanion<Creneau> {
  final Value<int> codeCreneau;
  final Value<int> nbSalle;
  final Value<SeanceEnum> seance;
  final Value<DateTime> dateCreneau;
  const CreneauTableCompanion({
    this.codeCreneau = const Value.absent(),
    this.nbSalle = const Value.absent(),
    this.seance = const Value.absent(),
    this.dateCreneau = const Value.absent(),
  });
  CreneauTableCompanion.insert({
    this.codeCreneau = const Value.absent(),
    required int nbSalle,
    required SeanceEnum seance,
    required DateTime dateCreneau,
  }) : nbSalle = Value(nbSalle),
       seance = Value(seance),
       dateCreneau = Value(dateCreneau);
  static Insertable<Creneau> custom({
    Expression<int>? codeCreneau,
    Expression<int>? nbSalle,
    Expression<String>? seance,
    Expression<DateTime>? dateCreneau,
  }) {
    return RawValuesInsertable({
      if (codeCreneau != null) 'code_creneau': codeCreneau,
      if (nbSalle != null) 'nb_salle': nbSalle,
      if (seance != null) 'seance': seance,
      if (dateCreneau != null) 'date_creneau': dateCreneau,
    });
  }

  CreneauTableCompanion copyWith({
    Value<int>? codeCreneau,
    Value<int>? nbSalle,
    Value<SeanceEnum>? seance,
    Value<DateTime>? dateCreneau,
  }) {
    return CreneauTableCompanion(
      codeCreneau: codeCreneau ?? this.codeCreneau,
      nbSalle: nbSalle ?? this.nbSalle,
      seance: seance ?? this.seance,
      dateCreneau: dateCreneau ?? this.dateCreneau,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codeCreneau.present) {
      map['code_creneau'] = Variable<int>(codeCreneau.value);
    }
    if (nbSalle.present) {
      map['nb_salle'] = Variable<int>(nbSalle.value);
    }
    if (seance.present) {
      map['seance'] = Variable<String>(
        $CreneauTableTable.$converterseance.toSql(seance.value),
      );
    }
    if (dateCreneau.present) {
      map['date_creneau'] = Variable<DateTime>(dateCreneau.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CreneauTableCompanion(')
          ..write('codeCreneau: $codeCreneau, ')
          ..write('nbSalle: $nbSalle, ')
          ..write('seance: $seance, ')
          ..write('dateCreneau: $dateCreneau')
          ..write(')'))
        .toString();
  }
}

class $ExamenTableTable extends ExamenTable
    with TableInfo<$ExamenTableTable, Examen> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExamenTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeCreneauMeta = const VerificationMeta(
    'codeCreneau',
  );
  @override
  late final GeneratedColumn<int> codeCreneau = GeneratedColumn<int>(
    'code_creneau',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
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
  static const VerificationMeta _classeMeta = const VerificationMeta('classe');
  @override
  late final GeneratedColumn<String> classe = GeneratedColumn<String>(
    'classe',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, codeCreneau, codeMatiere, classe];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'examen_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Examen> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code_creneau')) {
      context.handle(
        _codeCreneauMeta,
        codeCreneau.isAcceptableOrUnknown(
          data['code_creneau']!,
          _codeCreneauMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_codeCreneauMeta);
    }
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
    if (data.containsKey('classe')) {
      context.handle(
        _classeMeta,
        classe.isAcceptableOrUnknown(data['classe']!, _classeMeta),
      );
    } else if (isInserting) {
      context.missing(_classeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Examen map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Examen(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      codeCreneau: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}code_creneau'],
      )!,
      codeMatiere: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code_matiere'],
      )!,
      classe: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}classe'],
      )!,
    );
  }

  @override
  $ExamenTableTable createAlias(String alias) {
    return $ExamenTableTable(attachedDatabase, alias);
  }
}

class Examen extends DataClass implements Insertable<Examen> {
  final int id;
  final int codeCreneau;
  final String codeMatiere;
  final String classe;
  const Examen({
    required this.id,
    required this.codeCreneau,
    required this.codeMatiere,
    required this.classe,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code_creneau'] = Variable<int>(codeCreneau);
    map['code_matiere'] = Variable<String>(codeMatiere);
    map['classe'] = Variable<String>(classe);
    return map;
  }

  ExamenTableCompanion toCompanion(bool nullToAbsent) {
    return ExamenTableCompanion(
      id: Value(id),
      codeCreneau: Value(codeCreneau),
      codeMatiere: Value(codeMatiere),
      classe: Value(classe),
    );
  }

  factory Examen.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Examen(
      id: serializer.fromJson<int>(json['id']),
      codeCreneau: serializer.fromJson<int>(json['codeCreneau']),
      codeMatiere: serializer.fromJson<String>(json['codeMatiere']),
      classe: serializer.fromJson<String>(json['classe']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'codeCreneau': serializer.toJson<int>(codeCreneau),
      'codeMatiere': serializer.toJson<String>(codeMatiere),
      'classe': serializer.toJson<String>(classe),
    };
  }

  Examen copyWith({
    int? id,
    int? codeCreneau,
    String? codeMatiere,
    String? classe,
  }) => Examen(
    id: id ?? this.id,
    codeCreneau: codeCreneau ?? this.codeCreneau,
    codeMatiere: codeMatiere ?? this.codeMatiere,
    classe: classe ?? this.classe,
  );
  Examen copyWithCompanion(ExamenTableCompanion data) {
    return Examen(
      id: data.id.present ? data.id.value : this.id,
      codeCreneau: data.codeCreneau.present
          ? data.codeCreneau.value
          : this.codeCreneau,
      codeMatiere: data.codeMatiere.present
          ? data.codeMatiere.value
          : this.codeMatiere,
      classe: data.classe.present ? data.classe.value : this.classe,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Examen(')
          ..write('id: $id, ')
          ..write('codeCreneau: $codeCreneau, ')
          ..write('codeMatiere: $codeMatiere, ')
          ..write('classe: $classe')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, codeCreneau, codeMatiere, classe);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Examen &&
          other.id == this.id &&
          other.codeCreneau == this.codeCreneau &&
          other.codeMatiere == this.codeMatiere &&
          other.classe == this.classe);
}

class ExamenTableCompanion extends UpdateCompanion<Examen> {
  final Value<int> id;
  final Value<int> codeCreneau;
  final Value<String> codeMatiere;
  final Value<String> classe;
  const ExamenTableCompanion({
    this.id = const Value.absent(),
    this.codeCreneau = const Value.absent(),
    this.codeMatiere = const Value.absent(),
    this.classe = const Value.absent(),
  });
  ExamenTableCompanion.insert({
    this.id = const Value.absent(),
    required int codeCreneau,
    required String codeMatiere,
    required String classe,
  }) : codeCreneau = Value(codeCreneau),
       codeMatiere = Value(codeMatiere),
       classe = Value(classe);
  static Insertable<Examen> custom({
    Expression<int>? id,
    Expression<int>? codeCreneau,
    Expression<String>? codeMatiere,
    Expression<String>? classe,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (codeCreneau != null) 'code_creneau': codeCreneau,
      if (codeMatiere != null) 'code_matiere': codeMatiere,
      if (classe != null) 'classe': classe,
    });
  }

  ExamenTableCompanion copyWith({
    Value<int>? id,
    Value<int>? codeCreneau,
    Value<String>? codeMatiere,
    Value<String>? classe,
  }) {
    return ExamenTableCompanion(
      id: id ?? this.id,
      codeCreneau: codeCreneau ?? this.codeCreneau,
      codeMatiere: codeMatiere ?? this.codeMatiere,
      classe: classe ?? this.classe,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (codeCreneau.present) {
      map['code_creneau'] = Variable<int>(codeCreneau.value);
    }
    if (codeMatiere.present) {
      map['code_matiere'] = Variable<String>(codeMatiere.value);
    }
    if (classe.present) {
      map['classe'] = Variable<String>(classe.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExamenTableCompanion(')
          ..write('id: $id, ')
          ..write('codeCreneau: $codeCreneau, ')
          ..write('codeMatiere: $codeMatiere, ')
          ..write('classe: $classe')
          ..write(')'))
        .toString();
  }
}

class $AffectionTableTable extends AffectionTable
    with TableInfo<$AffectionTableTable, Affectation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AffectionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeCreneauMeta = const VerificationMeta(
    'codeCreneau',
  );
  @override
  late final GeneratedColumn<int> codeCreneau = GeneratedColumn<int>(
    'code_creneau',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
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
  @override
  late final GeneratedColumnWithTypeConverter<SemestreEnum, String> semestre =
      GeneratedColumn<String>(
        'semestre',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<SemestreEnum>($AffectionTableTable.$convertersemestre);
  @override
  late final GeneratedColumnWithTypeConverter<SessionEnum, String> session =
      GeneratedColumn<String>(
        'session',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<SessionEnum>($AffectionTableTable.$convertersession);
  @override
  List<GeneratedColumn> get $columns => [
    codeCreneau,
    codeSmartexEns,
    semestre,
    session,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'affection_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Affectation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code_creneau')) {
      context.handle(
        _codeCreneauMeta,
        codeCreneau.isAcceptableOrUnknown(
          data['code_creneau']!,
          _codeCreneauMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_codeCreneauMeta);
    }
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codeCreneau, codeSmartexEns};
  @override
  Affectation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Affectation(
      codeCreneau: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}code_creneau'],
      )!,
      codeSmartexEns: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code_smartex_ens'],
      )!,
      semestre: $AffectionTableTable.$convertersemestre.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}semestre'],
        )!,
      ),
      session: $AffectionTableTable.$convertersession.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}session'],
        )!,
      ),
    );
  }

  @override
  $AffectionTableTable createAlias(String alias) {
    return $AffectionTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SemestreEnum, String, String> $convertersemestre =
      const EnumNameConverter<SemestreEnum>(SemestreEnum.values);
  static JsonTypeConverter2<SessionEnum, String, String> $convertersession =
      const EnumNameConverter<SessionEnum>(SessionEnum.values);
}

class Affectation extends DataClass implements Insertable<Affectation> {
  final int codeCreneau;
  final String codeSmartexEns;
  final SemestreEnum semestre;
  final SessionEnum session;
  const Affectation({
    required this.codeCreneau,
    required this.codeSmartexEns,
    required this.semestre,
    required this.session,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code_creneau'] = Variable<int>(codeCreneau);
    map['code_smartex_ens'] = Variable<String>(codeSmartexEns);
    {
      map['semestre'] = Variable<String>(
        $AffectionTableTable.$convertersemestre.toSql(semestre),
      );
    }
    {
      map['session'] = Variable<String>(
        $AffectionTableTable.$convertersession.toSql(session),
      );
    }
    return map;
  }

  AffectionTableCompanion toCompanion(bool nullToAbsent) {
    return AffectionTableCompanion(
      codeCreneau: Value(codeCreneau),
      codeSmartexEns: Value(codeSmartexEns),
      semestre: Value(semestre),
      session: Value(session),
    );
  }

  factory Affectation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Affectation(
      codeCreneau: serializer.fromJson<int>(json['codeCreneau']),
      codeSmartexEns: serializer.fromJson<String>(json['codeSmartexEns']),
      semestre: $AffectionTableTable.$convertersemestre.fromJson(
        serializer.fromJson<String>(json['semestre']),
      ),
      session: $AffectionTableTable.$convertersession.fromJson(
        serializer.fromJson<String>(json['session']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codeCreneau': serializer.toJson<int>(codeCreneau),
      'codeSmartexEns': serializer.toJson<String>(codeSmartexEns),
      'semestre': serializer.toJson<String>(
        $AffectionTableTable.$convertersemestre.toJson(semestre),
      ),
      'session': serializer.toJson<String>(
        $AffectionTableTable.$convertersession.toJson(session),
      ),
    };
  }

  Affectation copyWith({
    int? codeCreneau,
    String? codeSmartexEns,
    SemestreEnum? semestre,
    SessionEnum? session,
  }) => Affectation(
    codeCreneau: codeCreneau ?? this.codeCreneau,
    codeSmartexEns: codeSmartexEns ?? this.codeSmartexEns,
    semestre: semestre ?? this.semestre,
    session: session ?? this.session,
  );
  Affectation copyWithCompanion(AffectionTableCompanion data) {
    return Affectation(
      codeCreneau: data.codeCreneau.present
          ? data.codeCreneau.value
          : this.codeCreneau,
      codeSmartexEns: data.codeSmartexEns.present
          ? data.codeSmartexEns.value
          : this.codeSmartexEns,
      semestre: data.semestre.present ? data.semestre.value : this.semestre,
      session: data.session.present ? data.session.value : this.session,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Affectation(')
          ..write('codeCreneau: $codeCreneau, ')
          ..write('codeSmartexEns: $codeSmartexEns, ')
          ..write('semestre: $semestre, ')
          ..write('session: $session')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(codeCreneau, codeSmartexEns, semestre, session);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Affectation &&
          other.codeCreneau == this.codeCreneau &&
          other.codeSmartexEns == this.codeSmartexEns &&
          other.semestre == this.semestre &&
          other.session == this.session);
}

class AffectionTableCompanion extends UpdateCompanion<Affectation> {
  final Value<int> codeCreneau;
  final Value<String> codeSmartexEns;
  final Value<SemestreEnum> semestre;
  final Value<SessionEnum> session;
  final Value<int> rowid;
  const AffectionTableCompanion({
    this.codeCreneau = const Value.absent(),
    this.codeSmartexEns = const Value.absent(),
    this.semestre = const Value.absent(),
    this.session = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AffectionTableCompanion.insert({
    required int codeCreneau,
    required String codeSmartexEns,
    required SemestreEnum semestre,
    required SessionEnum session,
    this.rowid = const Value.absent(),
  }) : codeCreneau = Value(codeCreneau),
       codeSmartexEns = Value(codeSmartexEns),
       semestre = Value(semestre),
       session = Value(session);
  static Insertable<Affectation> custom({
    Expression<int>? codeCreneau,
    Expression<String>? codeSmartexEns,
    Expression<String>? semestre,
    Expression<String>? session,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (codeCreneau != null) 'code_creneau': codeCreneau,
      if (codeSmartexEns != null) 'code_smartex_ens': codeSmartexEns,
      if (semestre != null) 'semestre': semestre,
      if (session != null) 'session': session,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AffectionTableCompanion copyWith({
    Value<int>? codeCreneau,
    Value<String>? codeSmartexEns,
    Value<SemestreEnum>? semestre,
    Value<SessionEnum>? session,
    Value<int>? rowid,
  }) {
    return AffectionTableCompanion(
      codeCreneau: codeCreneau ?? this.codeCreneau,
      codeSmartexEns: codeSmartexEns ?? this.codeSmartexEns,
      semestre: semestre ?? this.semestre,
      session: session ?? this.session,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codeCreneau.present) {
      map['code_creneau'] = Variable<int>(codeCreneau.value);
    }
    if (codeSmartexEns.present) {
      map['code_smartex_ens'] = Variable<String>(codeSmartexEns.value);
    }
    if (semestre.present) {
      map['semestre'] = Variable<String>(
        $AffectionTableTable.$convertersemestre.toSql(semestre.value),
      );
    }
    if (session.present) {
      map['session'] = Variable<String>(
        $AffectionTableTable.$convertersession.toSql(session.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AffectionTableCompanion(')
          ..write('codeCreneau: $codeCreneau, ')
          ..write('codeSmartexEns: $codeSmartexEns, ')
          ..write('semestre: $semestre, ')
          ..write('session: $session, ')
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
  late final $EnseignantMatiereTableTable enseignantMatiereTable =
      $EnseignantMatiereTableTable(this);
  late final $VoeuxTableTable voeuxTable = $VoeuxTableTable(this);
  late final $CreneauTableTable creneauTable = $CreneauTableTable(this);
  late final $ExamenTableTable examenTable = $ExamenTableTable(this);
  late final $AffectionTableTable affectionTable = $AffectionTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    gradesTable,
    enseignantsTable,
    matiereTable,
    enseignantMatiereTable,
    voeuxTable,
    creneauTable,
    examenTable,
    affectionTable,
  ];
}

typedef $$GradesTableTableCreateCompanionBuilder =
    GradesTableCompanion Function({
      required GradeEnum codeGrade,
      required String label,
      Value<double> nbHeure,
      Value<int> rowid,
    });
typedef $$GradesTableTableUpdateCompanionBuilder =
    GradesTableCompanion Function({
      Value<GradeEnum> codeGrade,
      Value<String> label,
      Value<double> nbHeure,
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
  ColumnWithTypeConverterFilters<GradeEnum, GradeEnum, String> get codeGrade =>
      $composableBuilder(
        column: $table.codeGrade,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get nbHeure => $composableBuilder(
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

  ColumnOrderings<double> get nbHeure => $composableBuilder(
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
  GeneratedColumnWithTypeConverter<GradeEnum, String> get codeGrade =>
      $composableBuilder(column: $table.codeGrade, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<double> get nbHeure =>
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
                Value<GradeEnum> codeGrade = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<double> nbHeure = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GradesTableCompanion(
                codeGrade: codeGrade,
                label: label,
                nbHeure: nbHeure,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required GradeEnum codeGrade,
                required String label,
                Value<double> nbHeure = const Value.absent(),
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
      required GradeEnum gradeCodeEns,
      Value<bool> participeSurveillance,
      Value<int> rowid,
    });
typedef $$EnseignantsTableTableUpdateCompanionBuilder =
    EnseignantsTableCompanion Function({
      Value<String> codeSmartexEns,
      Value<String> nomEns,
      Value<String> prenomEns,
      Value<String> emailEns,
      Value<GradeEnum> gradeCodeEns,
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

  static MultiTypedResultKey<$VoeuxTableTable, List<Voeux>>
  _voeuxTableRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.voeuxTable,
    aliasName: $_aliasNameGenerator(
      db.enseignantsTable.codeSmartexEns,
      db.voeuxTable.codeSmartexEns,
    ),
  );

  $$VoeuxTableTableProcessedTableManager get voeuxTableRefs {
    final manager = $$VoeuxTableTableTableManager($_db, $_db.voeuxTable).filter(
      (f) => f.codeSmartexEns.codeSmartexEns.sqlEquals(
        $_itemColumn<String>('code_smartex_ens')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_voeuxTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
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

  Expression<bool> voeuxTableRefs(
    Expression<bool> Function($$VoeuxTableTableFilterComposer f) f,
  ) {
    final $$VoeuxTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codeSmartexEns,
      referencedTable: $db.voeuxTable,
      getReferencedColumn: (t) => t.codeSmartexEns,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VoeuxTableTableFilterComposer(
            $db: $db,
            $table: $db.voeuxTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
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

  Expression<T> voeuxTableRefs<T extends Object>(
    Expression<T> Function($$VoeuxTableTableAnnotationComposer a) f,
  ) {
    final $$VoeuxTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codeSmartexEns,
      referencedTable: $db.voeuxTable,
      getReferencedColumn: (t) => t.codeSmartexEns,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VoeuxTableTableAnnotationComposer(
            $db: $db,
            $table: $db.voeuxTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
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
          PrefetchHooks Function({bool gradeCodeEns, bool voeuxTableRefs})
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
                Value<GradeEnum> gradeCodeEns = const Value.absent(),
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
                required GradeEnum gradeCodeEns,
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
          prefetchHooksCallback:
              ({gradeCodeEns = false, voeuxTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (voeuxTableRefs) db.voeuxTable],
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
                    return [
                      if (voeuxTableRefs)
                        await $_getPrefetchedData<
                          Enseignant,
                          $EnseignantsTableTable,
                          Voeux
                        >(
                          currentTable: table,
                          referencedTable: $$EnseignantsTableTableReferences
                              ._voeuxTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EnseignantsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).voeuxTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.codeSmartexEns == item.codeSmartexEns,
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
      PrefetchHooks Function({bool gradeCodeEns, bool voeuxTableRefs})
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
typedef $$EnseignantMatiereTableTableCreateCompanionBuilder =
    EnseignantMatiereTableCompanion Function({
      required String codeMatiere,
      required String codeSmartexEns,
      Value<int> rowid,
    });
typedef $$EnseignantMatiereTableTableUpdateCompanionBuilder =
    EnseignantMatiereTableCompanion Function({
      Value<String> codeMatiere,
      Value<String> codeSmartexEns,
      Value<int> rowid,
    });

class $$EnseignantMatiereTableTableFilterComposer
    extends Composer<_$AppDb, $EnseignantMatiereTableTable> {
  $$EnseignantMatiereTableTableFilterComposer({
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

  ColumnFilters<String> get codeSmartexEns => $composableBuilder(
    column: $table.codeSmartexEns,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EnseignantMatiereTableTableOrderingComposer
    extends Composer<_$AppDb, $EnseignantMatiereTableTable> {
  $$EnseignantMatiereTableTableOrderingComposer({
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

  ColumnOrderings<String> get codeSmartexEns => $composableBuilder(
    column: $table.codeSmartexEns,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EnseignantMatiereTableTableAnnotationComposer
    extends Composer<_$AppDb, $EnseignantMatiereTableTable> {
  $$EnseignantMatiereTableTableAnnotationComposer({
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

  GeneratedColumn<String> get codeSmartexEns => $composableBuilder(
    column: $table.codeSmartexEns,
    builder: (column) => column,
  );
}

class $$EnseignantMatiereTableTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $EnseignantMatiereTableTable,
          EnseignantMatiere,
          $$EnseignantMatiereTableTableFilterComposer,
          $$EnseignantMatiereTableTableOrderingComposer,
          $$EnseignantMatiereTableTableAnnotationComposer,
          $$EnseignantMatiereTableTableCreateCompanionBuilder,
          $$EnseignantMatiereTableTableUpdateCompanionBuilder,
          (
            EnseignantMatiere,
            BaseReferences<
              _$AppDb,
              $EnseignantMatiereTableTable,
              EnseignantMatiere
            >,
          ),
          EnseignantMatiere,
          PrefetchHooks Function()
        > {
  $$EnseignantMatiereTableTableTableManager(
    _$AppDb db,
    $EnseignantMatiereTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EnseignantMatiereTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$EnseignantMatiereTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$EnseignantMatiereTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> codeMatiere = const Value.absent(),
                Value<String> codeSmartexEns = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EnseignantMatiereTableCompanion(
                codeMatiere: codeMatiere,
                codeSmartexEns: codeSmartexEns,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String codeMatiere,
                required String codeSmartexEns,
                Value<int> rowid = const Value.absent(),
              }) => EnseignantMatiereTableCompanion.insert(
                codeMatiere: codeMatiere,
                codeSmartexEns: codeSmartexEns,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EnseignantMatiereTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $EnseignantMatiereTableTable,
      EnseignantMatiere,
      $$EnseignantMatiereTableTableFilterComposer,
      $$EnseignantMatiereTableTableOrderingComposer,
      $$EnseignantMatiereTableTableAnnotationComposer,
      $$EnseignantMatiereTableTableCreateCompanionBuilder,
      $$EnseignantMatiereTableTableUpdateCompanionBuilder,
      (
        EnseignantMatiere,
        BaseReferences<
          _$AppDb,
          $EnseignantMatiereTableTable,
          EnseignantMatiere
        >,
      ),
      EnseignantMatiere,
      PrefetchHooks Function()
    >;
typedef $$VoeuxTableTableCreateCompanionBuilder =
    VoeuxTableCompanion Function({
      Value<int> id,
      required SemestreEnum semestre,
      required SessionEnum session,
      required String codeSmartexEns,
      required int jour,
      required SeanceEnum seance,
    });
typedef $$VoeuxTableTableUpdateCompanionBuilder =
    VoeuxTableCompanion Function({
      Value<int> id,
      Value<SemestreEnum> semestre,
      Value<SessionEnum> session,
      Value<String> codeSmartexEns,
      Value<int> jour,
      Value<SeanceEnum> seance,
    });

final class $$VoeuxTableTableReferences
    extends BaseReferences<_$AppDb, $VoeuxTableTable, Voeux> {
  $$VoeuxTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EnseignantsTableTable _codeSmartexEnsTable(_$AppDb db) =>
      db.enseignantsTable.createAlias(
        $_aliasNameGenerator(
          db.voeuxTable.codeSmartexEns,
          db.enseignantsTable.codeSmartexEns,
        ),
      );

  $$EnseignantsTableTableProcessedTableManager get codeSmartexEns {
    final $_column = $_itemColumn<String>('code_smartex_ens')!;

    final manager = $$EnseignantsTableTableTableManager(
      $_db,
      $_db.enseignantsTable,
    ).filter((f) => f.codeSmartexEns.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_codeSmartexEnsTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VoeuxTableTableFilterComposer
    extends Composer<_$AppDb, $VoeuxTableTable> {
  $$VoeuxTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SemestreEnum, SemestreEnum, String>
  get semestre => $composableBuilder(
    column: $table.semestre,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<SessionEnum, SessionEnum, String>
  get session => $composableBuilder(
    column: $table.session,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get jour => $composableBuilder(
    column: $table.jour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SeanceEnum, SeanceEnum, String> get seance =>
      $composableBuilder(
        column: $table.seance,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  $$EnseignantsTableTableFilterComposer get codeSmartexEns {
    final $$EnseignantsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codeSmartexEns,
      referencedTable: $db.enseignantsTable,
      getReferencedColumn: (t) => t.codeSmartexEns,
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
    return composer;
  }
}

class $$VoeuxTableTableOrderingComposer
    extends Composer<_$AppDb, $VoeuxTableTable> {
  $$VoeuxTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get semestre => $composableBuilder(
    column: $table.semestre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get session => $composableBuilder(
    column: $table.session,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get jour => $composableBuilder(
    column: $table.jour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get seance => $composableBuilder(
    column: $table.seance,
    builder: (column) => ColumnOrderings(column),
  );

  $$EnseignantsTableTableOrderingComposer get codeSmartexEns {
    final $$EnseignantsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codeSmartexEns,
      referencedTable: $db.enseignantsTable,
      getReferencedColumn: (t) => t.codeSmartexEns,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnseignantsTableTableOrderingComposer(
            $db: $db,
            $table: $db.enseignantsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VoeuxTableTableAnnotationComposer
    extends Composer<_$AppDb, $VoeuxTableTable> {
  $$VoeuxTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SemestreEnum, String> get semestre =>
      $composableBuilder(column: $table.semestre, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SessionEnum, String> get session =>
      $composableBuilder(column: $table.session, builder: (column) => column);

  GeneratedColumn<int> get jour =>
      $composableBuilder(column: $table.jour, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SeanceEnum, String> get seance =>
      $composableBuilder(column: $table.seance, builder: (column) => column);

  $$EnseignantsTableTableAnnotationComposer get codeSmartexEns {
    final $$EnseignantsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codeSmartexEns,
      referencedTable: $db.enseignantsTable,
      getReferencedColumn: (t) => t.codeSmartexEns,
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
    return composer;
  }
}

class $$VoeuxTableTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $VoeuxTableTable,
          Voeux,
          $$VoeuxTableTableFilterComposer,
          $$VoeuxTableTableOrderingComposer,
          $$VoeuxTableTableAnnotationComposer,
          $$VoeuxTableTableCreateCompanionBuilder,
          $$VoeuxTableTableUpdateCompanionBuilder,
          (Voeux, $$VoeuxTableTableReferences),
          Voeux,
          PrefetchHooks Function({bool codeSmartexEns})
        > {
  $$VoeuxTableTableTableManager(_$AppDb db, $VoeuxTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VoeuxTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VoeuxTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VoeuxTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<SemestreEnum> semestre = const Value.absent(),
                Value<SessionEnum> session = const Value.absent(),
                Value<String> codeSmartexEns = const Value.absent(),
                Value<int> jour = const Value.absent(),
                Value<SeanceEnum> seance = const Value.absent(),
              }) => VoeuxTableCompanion(
                id: id,
                semestre: semestre,
                session: session,
                codeSmartexEns: codeSmartexEns,
                jour: jour,
                seance: seance,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required SemestreEnum semestre,
                required SessionEnum session,
                required String codeSmartexEns,
                required int jour,
                required SeanceEnum seance,
              }) => VoeuxTableCompanion.insert(
                id: id,
                semestre: semestre,
                session: session,
                codeSmartexEns: codeSmartexEns,
                jour: jour,
                seance: seance,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VoeuxTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({codeSmartexEns = false}) {
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
                    if (codeSmartexEns) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.codeSmartexEns,
                                referencedTable: $$VoeuxTableTableReferences
                                    ._codeSmartexEnsTable(db),
                                referencedColumn: $$VoeuxTableTableReferences
                                    ._codeSmartexEnsTable(db)
                                    .codeSmartexEns,
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

typedef $$VoeuxTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $VoeuxTableTable,
      Voeux,
      $$VoeuxTableTableFilterComposer,
      $$VoeuxTableTableOrderingComposer,
      $$VoeuxTableTableAnnotationComposer,
      $$VoeuxTableTableCreateCompanionBuilder,
      $$VoeuxTableTableUpdateCompanionBuilder,
      (Voeux, $$VoeuxTableTableReferences),
      Voeux,
      PrefetchHooks Function({bool codeSmartexEns})
    >;
typedef $$CreneauTableTableCreateCompanionBuilder =
    CreneauTableCompanion Function({
      Value<int> codeCreneau,
      required int nbSalle,
      required SeanceEnum seance,
      required DateTime dateCreneau,
    });
typedef $$CreneauTableTableUpdateCompanionBuilder =
    CreneauTableCompanion Function({
      Value<int> codeCreneau,
      Value<int> nbSalle,
      Value<SeanceEnum> seance,
      Value<DateTime> dateCreneau,
    });

class $$CreneauTableTableFilterComposer
    extends Composer<_$AppDb, $CreneauTableTable> {
  $$CreneauTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get codeCreneau => $composableBuilder(
    column: $table.codeCreneau,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nbSalle => $composableBuilder(
    column: $table.nbSalle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SeanceEnum, SeanceEnum, String> get seance =>
      $composableBuilder(
        column: $table.seance,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get dateCreneau => $composableBuilder(
    column: $table.dateCreneau,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CreneauTableTableOrderingComposer
    extends Composer<_$AppDb, $CreneauTableTable> {
  $$CreneauTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get codeCreneau => $composableBuilder(
    column: $table.codeCreneau,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nbSalle => $composableBuilder(
    column: $table.nbSalle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get seance => $composableBuilder(
    column: $table.seance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateCreneau => $composableBuilder(
    column: $table.dateCreneau,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CreneauTableTableAnnotationComposer
    extends Composer<_$AppDb, $CreneauTableTable> {
  $$CreneauTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get codeCreneau => $composableBuilder(
    column: $table.codeCreneau,
    builder: (column) => column,
  );

  GeneratedColumn<int> get nbSalle =>
      $composableBuilder(column: $table.nbSalle, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SeanceEnum, String> get seance =>
      $composableBuilder(column: $table.seance, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreneau => $composableBuilder(
    column: $table.dateCreneau,
    builder: (column) => column,
  );
}

class $$CreneauTableTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $CreneauTableTable,
          Creneau,
          $$CreneauTableTableFilterComposer,
          $$CreneauTableTableOrderingComposer,
          $$CreneauTableTableAnnotationComposer,
          $$CreneauTableTableCreateCompanionBuilder,
          $$CreneauTableTableUpdateCompanionBuilder,
          (Creneau, BaseReferences<_$AppDb, $CreneauTableTable, Creneau>),
          Creneau,
          PrefetchHooks Function()
        > {
  $$CreneauTableTableTableManager(_$AppDb db, $CreneauTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CreneauTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CreneauTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CreneauTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> codeCreneau = const Value.absent(),
                Value<int> nbSalle = const Value.absent(),
                Value<SeanceEnum> seance = const Value.absent(),
                Value<DateTime> dateCreneau = const Value.absent(),
              }) => CreneauTableCompanion(
                codeCreneau: codeCreneau,
                nbSalle: nbSalle,
                seance: seance,
                dateCreneau: dateCreneau,
              ),
          createCompanionCallback:
              ({
                Value<int> codeCreneau = const Value.absent(),
                required int nbSalle,
                required SeanceEnum seance,
                required DateTime dateCreneau,
              }) => CreneauTableCompanion.insert(
                codeCreneau: codeCreneau,
                nbSalle: nbSalle,
                seance: seance,
                dateCreneau: dateCreneau,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CreneauTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $CreneauTableTable,
      Creneau,
      $$CreneauTableTableFilterComposer,
      $$CreneauTableTableOrderingComposer,
      $$CreneauTableTableAnnotationComposer,
      $$CreneauTableTableCreateCompanionBuilder,
      $$CreneauTableTableUpdateCompanionBuilder,
      (Creneau, BaseReferences<_$AppDb, $CreneauTableTable, Creneau>),
      Creneau,
      PrefetchHooks Function()
    >;
typedef $$ExamenTableTableCreateCompanionBuilder =
    ExamenTableCompanion Function({
      Value<int> id,
      required int codeCreneau,
      required String codeMatiere,
      required String classe,
    });
typedef $$ExamenTableTableUpdateCompanionBuilder =
    ExamenTableCompanion Function({
      Value<int> id,
      Value<int> codeCreneau,
      Value<String> codeMatiere,
      Value<String> classe,
    });

class $$ExamenTableTableFilterComposer
    extends Composer<_$AppDb, $ExamenTableTable> {
  $$ExamenTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get codeCreneau => $composableBuilder(
    column: $table.codeCreneau,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codeMatiere => $composableBuilder(
    column: $table.codeMatiere,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get classe => $composableBuilder(
    column: $table.classe,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExamenTableTableOrderingComposer
    extends Composer<_$AppDb, $ExamenTableTable> {
  $$ExamenTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get codeCreneau => $composableBuilder(
    column: $table.codeCreneau,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codeMatiere => $composableBuilder(
    column: $table.codeMatiere,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get classe => $composableBuilder(
    column: $table.classe,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExamenTableTableAnnotationComposer
    extends Composer<_$AppDb, $ExamenTableTable> {
  $$ExamenTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get codeCreneau => $composableBuilder(
    column: $table.codeCreneau,
    builder: (column) => column,
  );

  GeneratedColumn<String> get codeMatiere => $composableBuilder(
    column: $table.codeMatiere,
    builder: (column) => column,
  );

  GeneratedColumn<String> get classe =>
      $composableBuilder(column: $table.classe, builder: (column) => column);
}

class $$ExamenTableTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $ExamenTableTable,
          Examen,
          $$ExamenTableTableFilterComposer,
          $$ExamenTableTableOrderingComposer,
          $$ExamenTableTableAnnotationComposer,
          $$ExamenTableTableCreateCompanionBuilder,
          $$ExamenTableTableUpdateCompanionBuilder,
          (Examen, BaseReferences<_$AppDb, $ExamenTableTable, Examen>),
          Examen,
          PrefetchHooks Function()
        > {
  $$ExamenTableTableTableManager(_$AppDb db, $ExamenTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExamenTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExamenTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExamenTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> codeCreneau = const Value.absent(),
                Value<String> codeMatiere = const Value.absent(),
                Value<String> classe = const Value.absent(),
              }) => ExamenTableCompanion(
                id: id,
                codeCreneau: codeCreneau,
                codeMatiere: codeMatiere,
                classe: classe,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int codeCreneau,
                required String codeMatiere,
                required String classe,
              }) => ExamenTableCompanion.insert(
                id: id,
                codeCreneau: codeCreneau,
                codeMatiere: codeMatiere,
                classe: classe,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExamenTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $ExamenTableTable,
      Examen,
      $$ExamenTableTableFilterComposer,
      $$ExamenTableTableOrderingComposer,
      $$ExamenTableTableAnnotationComposer,
      $$ExamenTableTableCreateCompanionBuilder,
      $$ExamenTableTableUpdateCompanionBuilder,
      (Examen, BaseReferences<_$AppDb, $ExamenTableTable, Examen>),
      Examen,
      PrefetchHooks Function()
    >;
typedef $$AffectionTableTableCreateCompanionBuilder =
    AffectionTableCompanion Function({
      required int codeCreneau,
      required String codeSmartexEns,
      required SemestreEnum semestre,
      required SessionEnum session,
      Value<int> rowid,
    });
typedef $$AffectionTableTableUpdateCompanionBuilder =
    AffectionTableCompanion Function({
      Value<int> codeCreneau,
      Value<String> codeSmartexEns,
      Value<SemestreEnum> semestre,
      Value<SessionEnum> session,
      Value<int> rowid,
    });

class $$AffectionTableTableFilterComposer
    extends Composer<_$AppDb, $AffectionTableTable> {
  $$AffectionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get codeCreneau => $composableBuilder(
    column: $table.codeCreneau,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codeSmartexEns => $composableBuilder(
    column: $table.codeSmartexEns,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SemestreEnum, SemestreEnum, String>
  get semestre => $composableBuilder(
    column: $table.semestre,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<SessionEnum, SessionEnum, String>
  get session => $composableBuilder(
    column: $table.session,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$AffectionTableTableOrderingComposer
    extends Composer<_$AppDb, $AffectionTableTable> {
  $$AffectionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get codeCreneau => $composableBuilder(
    column: $table.codeCreneau,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codeSmartexEns => $composableBuilder(
    column: $table.codeSmartexEns,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get semestre => $composableBuilder(
    column: $table.semestre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get session => $composableBuilder(
    column: $table.session,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AffectionTableTableAnnotationComposer
    extends Composer<_$AppDb, $AffectionTableTable> {
  $$AffectionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get codeCreneau => $composableBuilder(
    column: $table.codeCreneau,
    builder: (column) => column,
  );

  GeneratedColumn<String> get codeSmartexEns => $composableBuilder(
    column: $table.codeSmartexEns,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<SemestreEnum, String> get semestre =>
      $composableBuilder(column: $table.semestre, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SessionEnum, String> get session =>
      $composableBuilder(column: $table.session, builder: (column) => column);
}

class $$AffectionTableTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $AffectionTableTable,
          Affectation,
          $$AffectionTableTableFilterComposer,
          $$AffectionTableTableOrderingComposer,
          $$AffectionTableTableAnnotationComposer,
          $$AffectionTableTableCreateCompanionBuilder,
          $$AffectionTableTableUpdateCompanionBuilder,
          (
            Affectation,
            BaseReferences<_$AppDb, $AffectionTableTable, Affectation>,
          ),
          Affectation,
          PrefetchHooks Function()
        > {
  $$AffectionTableTableTableManager(_$AppDb db, $AffectionTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AffectionTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AffectionTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AffectionTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> codeCreneau = const Value.absent(),
                Value<String> codeSmartexEns = const Value.absent(),
                Value<SemestreEnum> semestre = const Value.absent(),
                Value<SessionEnum> session = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AffectionTableCompanion(
                codeCreneau: codeCreneau,
                codeSmartexEns: codeSmartexEns,
                semestre: semestre,
                session: session,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int codeCreneau,
                required String codeSmartexEns,
                required SemestreEnum semestre,
                required SessionEnum session,
                Value<int> rowid = const Value.absent(),
              }) => AffectionTableCompanion.insert(
                codeCreneau: codeCreneau,
                codeSmartexEns: codeSmartexEns,
                semestre: semestre,
                session: session,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AffectionTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $AffectionTableTable,
      Affectation,
      $$AffectionTableTableFilterComposer,
      $$AffectionTableTableOrderingComposer,
      $$AffectionTableTableAnnotationComposer,
      $$AffectionTableTableCreateCompanionBuilder,
      $$AffectionTableTableUpdateCompanionBuilder,
      (Affectation, BaseReferences<_$AppDb, $AffectionTableTable, Affectation>),
      Affectation,
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
  $$EnseignantMatiereTableTableTableManager get enseignantMatiereTable =>
      $$EnseignantMatiereTableTableTableManager(
        _db,
        _db.enseignantMatiereTable,
      );
  $$VoeuxTableTableTableManager get voeuxTable =>
      $$VoeuxTableTableTableManager(_db, _db.voeuxTable);
  $$CreneauTableTableTableManager get creneauTable =>
      $$CreneauTableTableTableManager(_db, _db.creneauTable);
  $$ExamenTableTableTableManager get examenTable =>
      $$ExamenTableTableTableManager(_db, _db.examenTable);
  $$AffectionTableTableTableManager get affectionTable =>
      $$AffectionTableTableTableManager(_db, _db.affectionTable);
}
