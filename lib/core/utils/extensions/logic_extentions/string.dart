
extension StringExtention on String? {
  orEmpty() {
    return this ?? "";
  }
}