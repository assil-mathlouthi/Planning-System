class Matiere {
  final String id;
  final String libelle;

  const Matiere({required this.id, required this.libelle});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Matiere && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => '$id: $libelle';
}
