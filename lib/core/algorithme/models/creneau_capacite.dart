
class CreneauCapacity {
  final int nbSalles;
  final int nbProfesseursRequis;
  final int exces;

  const CreneauCapacity({
    required this.nbSalles,
    required this.nbProfesseursRequis,
    required this.exces,
  });

  @override
  String toString() {
    return '$nbSalles salles → $nbProfesseursRequis profs (base: ${nbSalles * 2} + excès: $exces)';
  }
}
