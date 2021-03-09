class Phone implements Comparable<Phone> {
  String model;
  double inches;
  List<Phone> phones;

  Phone(this.model, this.inches);

  // Comparable
  @override
  int compareTo(Phone phone) {
    if (inches < phone.inches) {
      print('The screen of ' + this.model + ' is smaller than ' + phone.model);
      return -1;
    }

    if (inches > phone.inches) {
      print('The screen of ' + this.model + ' is bigger than ' + phone.model);
      return 1;
    } else {
      print('The screen of ' + this.model + ' is equals to ' + phone.model);
    }
    return 0;
  }

  // Json
  Phone.fromJson(Map<String, dynamic> json)
      : model = json['model'],
        inches = json['inches'];

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'inches': inches,
    };
  }
}

// Iterable
class PhonesCollection implements Iterable<PhonesCollection> {
  int number;
  List<PhonesCollection> phonesCollection = List();

  @override
  bool any(bool Function(PhonesCollection element) test) =>
      phonesCollection.any(test);

  @override
  Iterable<R> cast<R>() => phonesCollection.cast<R>();

  @override
  bool contains(Object element) => phonesCollection.contains(element);

  @override
  PhonesCollection elementAt(int index) => phonesCollection.elementAt(index);

  @override
  bool every(bool Function(PhonesCollection element) test) =>
      phonesCollection.every(test);

  @override
  Iterable<T> expand<T>(Iterable<T> Function(PhonesCollection element) f) =>
      phonesCollection.expand<T>(f);

  @override
  PhonesCollection get first => phonesCollection.first;

  @override
  PhonesCollection firstWhere(bool Function(PhonesCollection element) test,
          {PhonesCollection Function() orElse}) =>
      phonesCollection.firstWhere(test, orElse: orElse);

  @override
  T fold<T>(T initialValue,
          T Function(T previousValue, PhonesCollection element) combine) =>
      phonesCollection.fold<T>(initialValue, combine);

  @override
  Iterable<PhonesCollection> followedBy(Iterable<PhonesCollection> other) =>
      phonesCollection.followedBy(other);

  @override
  void forEach(void Function(PhonesCollection element) f) =>
      phonesCollection.forEach(f);

  @override
  bool get isEmpty => phonesCollection.isEmpty;

  @override
  bool get isNotEmpty => phonesCollection.isNotEmpty;

  @override
  Iterator<PhonesCollection> get iterator => phonesCollection.iterator;

  @override
  String join([String separator = ""]) => phonesCollection.join(separator);

  @override
  PhonesCollection get last => phonesCollection.last;

  @override
  PhonesCollection lastWhere(bool Function(PhonesCollection element) test,
          {PhonesCollection Function() orElse}) =>
      phonesCollection.lastWhere(test, orElse: orElse);

  @override
  int get length => phonesCollection.length;

  @override
  Iterable<T> map<T>(T Function(PhonesCollection e) f) =>
      phonesCollection.map(f);

  @override
  PhonesCollection reduce(
          PhonesCollection Function(
                  PhonesCollection value, PhonesCollection element)
              combine) =>
      phonesCollection.reduce(combine);

  @override
  PhonesCollection get single => phonesCollection.single;

  @override
  PhonesCollection singleWhere(bool Function(PhonesCollection element) test,
          {PhonesCollection Function() orElse}) =>
      phonesCollection.singleWhere(test, orElse: orElse);

  @override
  Iterable<PhonesCollection> skip(int count) => phonesCollection.skip(count);

  @override
  Iterable<PhonesCollection> skipWhile(
          bool Function(PhonesCollection value) test) =>
      phonesCollection.skipWhile(test);

  @override
  Iterable<PhonesCollection> take(int count) => phonesCollection.take(count);

  @override
  Iterable<PhonesCollection> takeWhile(
          bool Function(PhonesCollection value) test) =>
      phonesCollection.takeWhile(test);

  @override
  List<PhonesCollection> toList({bool growable = true}) =>
      phonesCollection.toList(growable: growable);

  @override
  Set<PhonesCollection> toSet() => phonesCollection.toSet();

  @override
  Iterable<PhonesCollection> where(
          bool Function(PhonesCollection element) test) =>
      phonesCollection.where(test);

  @override
  Iterable<T> whereType<T>() => phonesCollection.whereType<T>();
}

//Iterator
class NumbersIterator implements Iterator {
  var _numbers = ["One", "Two", "Three", "Four", "Five"];
  var _index = 0;

  String get current => _numbers[_index++];

  bool moveNext() => _index < _numbers.length;
}
