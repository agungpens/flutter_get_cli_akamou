import 'package:flutter/material.dart';

class BadgeComponen extends StatelessWidget {
  final bool isActive;

  const BadgeComponen({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isActive ? 'AKTIF' : 'TIDAK AKTIF',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
