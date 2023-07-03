import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

enum SortBy {
  popularity('popularity', Remix.bar_chart_line),
  revenue('revenue', Remix.bank_line),
  primaryReleaseDate('primary_release_date', Remix.calendar_line),
  voteAverage('vote_average', Remix.star_line),
  voteCount('vote_count', Remix.user_star_line);

  final String value;
  final IconData icon;

  const SortBy(this.value, this.icon);
}
