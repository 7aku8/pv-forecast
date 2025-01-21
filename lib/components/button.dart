import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({required this.onPressed, required this.text, super.key});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(28),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
