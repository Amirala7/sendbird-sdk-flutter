class CachedData<T> {
  T value;
  bool isRemoved;
  int ts;

  CachedData({
    this.value,
    this.isRemoved = false,
    this.ts,
  });
}
