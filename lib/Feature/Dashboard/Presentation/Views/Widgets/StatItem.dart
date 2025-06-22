import 'package:flutter/material.dart';

class StatItem {
  final String title;
  final String value;
  final IconData icon;
  final String percentage;
  final bool isPositive;

  StatItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.percentage,
    required this.isPositive,
  });
}

final List<StatItem> stats = [
  StatItem(
    title: 'Total Profit',
    value: '48,256',
    icon: Icons.attach_money,
    percentage: '+12',
    isPositive: true,
  ),
  StatItem(
    title: 'Total Users',
    value: '184',
    icon: Icons.people_alt_outlined,
    percentage: '+8',
    isPositive: true,
  ),
  StatItem(
    title: 'Available Public Spots',
    value: '42',
    icon: Icons.chair_alt_outlined,
    percentage: '-5',
    isPositive: false,
  ),
  StatItem(
    title: 'Available Reservable Spots',
    value: '28',
    icon: Icons.chair_alt_outlined,
    percentage: '+6',
    isPositive: true,
  ),
];
