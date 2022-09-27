class Ders{
  final String name;
  final double harfDegeri;
  final double krediDegeri;

  Ders({required this.name, required this.harfDegeri, required this.krediDegeri});

  @override
  String toString() {
    return '$name $harfDegeri $krediDegeri';
  }

}