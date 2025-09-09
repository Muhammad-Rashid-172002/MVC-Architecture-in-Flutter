import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:practics/res/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  final Color color, textColor;
  final bool loading;

  const RoundButton({
    super.key,
    required this.title,
    required this.onpress,
    this.color = AppColors.primaryColor,
    this.textColor = AppColors.whiteColor,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onpress,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: loading
            ? SpinKitCircle(color: Colors.white)
            : Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
              ),
      ),
    );
  }
}
