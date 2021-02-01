import 'package:simple_calendar_app/presentation/pages/event/edit/state/undo_cache.dart';

class UndoCacheStore {
  UndoCacheStore(UndoCache cache) : _caches = [cache];

  final List<UndoCache> _caches;

  bool get isEmpty => _caches.isEmpty;

  void push(UndoCache cache) {
    if (_caches.isEmpty) {
      _caches.add(cache);
    } else {
      final latestCache = _caches.last;
      if (latestCache != cache) {
        _caches.add(cache);
      }
    }
  }

  UndoCache? pop() {
    if (_caches.isEmpty) {
      return null;
    } else {
      return _caches.removeLast();
    }
  }
}
