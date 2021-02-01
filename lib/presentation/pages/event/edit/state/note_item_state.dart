enum NoteItemState {
  gone,
  visible,
}

extension NoteItemStateEx on NoteItemState {
  bool get isGone => this == NoteItemState.gone;

  bool get isVisible => this == NoteItemState.visible;
}
