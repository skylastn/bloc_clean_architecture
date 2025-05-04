import 'package:flutter/material.dart';

class GlobalContentWidget extends StatelessWidget {
  const GlobalContentWidget({
    super.key,
    required this.child,
    required this.title,
  });
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        left: 18,
        right: 18,
        bottom: MediaQuery.of(context).size.height * 0.05,
      ),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
