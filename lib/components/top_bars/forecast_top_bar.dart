import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pv_forecast/dashboard/state/page/page_bloc.dart';

class ForecastTopBar extends StatelessWidget {
  const ForecastTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            context.read<PageBloc>().add(
                  const SelectPage(4, InitiatedBy.bottomNav),
                );
          },
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 24,
            child: Icon(Icons.notifications_outlined, color: Colors.black87),
          ),
        ),
        const SizedBox(width: 16),
        const Text(
          'Forecast',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const Spacer(),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/user_avatar.png'),
          radius: 24,
        ),
      ],
    );
  }
}
