import 'dart:math';

class Todo {
  final String _id;
  String _title;
  String? _description;
  bool _done;

  Todo(
    this._title, {
    String? description,
  })  : _description = description,
        _id = (DateTime.now().millisecondsSinceEpoch - Random().nextInt(100))
            .toString(),
        _done = false;

  String get id => _id;
  String get title => _title;
  String? get description => _description;
  bool get done => _done;

  void editTitle(String title) {
    _title = title;
  }

  void editDescription(String? description) {
    _description = description;
  }

  void changeDone(bool? done) {
    _done = done ?? false;
  }

  @override
  String toString() {
    return 'Todo{title: $_title, description: $_description, done: $_done}';
  }
}
