
extension IntExtention on int? {
  orZero() {
    return this ?? 0;
  }
}