import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'table_calendar/table_calendar.dart';

part 'product_availablity_screen_controller.g.dart';

@riverpod
class ProductAvailabilityController extends _$ProductAvailabilityController {
  late final ValueNotifier<List<Event>> _selectedEvents;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  DateTime get rangeEnd => _rangeEnd!;

  DateTime get rangeStart => _rangeStart!;

  DateTime get selectedDay => _selectedDay!;

  DateTime get focusedDay => _focusedDay!;

  RangeSelectionMode get rangeSelectionMode => _rangeSelectionMode!;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(getEventsForDay(_selectedDay!));
    state = const AsyncValue.data(null);
  }

  void onDaySelected(
      {required DateTime selectedDay, required DateTime focusedDay}) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      state = const AsyncLoading();
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _rangeStart = null; // Important to clean those
      _rangeEnd = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;

      _selectedEvents.value = getEventsForDay(selectedDay);
    }
    state = const AsyncValue.data(null);
  }

  List<Event> getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  onSelect(int index) async {
    state = const AsyncLoading();

    state = const AsyncValue.data(null);
  }
}

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1'),
      Event('Today\'s Event 2'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
