int calculateWineAge(int releaseYear) {
  final currentYear = DateTime.now().year;

  if (releaseYear > currentYear) {
    return 0;
  }

  return currentYear - releaseYear;
}
