import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:practics/res/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  final Color textColor;
  final bool loading;

  const RoundButton({
    super.key,
    required this.title,
    required this.onpress,
    this.textColor = AppColors.whiteColor,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onpress,
      borderRadius: BorderRadius.circular(30),
      splashColor: Colors.white24,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF6D5DF6), Color(0xFF3D3BCE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: loading
            ? const Center(
                child: SpinKitThreeBounce(color: Colors.white, size: 20),
              )
            : Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1,
                    color: textColor,
                  ),
                ),
              ),
      ),
    );
  }
}
