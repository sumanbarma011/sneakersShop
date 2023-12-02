import 'package:flutter/material.dart';


class BottomNavIcon extends StatelessWidget {
  const BottomNavIcon({
    required this.onTap,
    required this.icon,
    super.key,
  });
  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:  SizedBox(
        height: 60,
        width: 36,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
