import 'package:flutter/material.dart';

class ScriptDetailCard extends StatelessWidget {
  const ScriptDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    // 위젯의 높이를 동등하게 맞춰주는 위젯: IntrinsicHeight
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.asset(
              'assets/images/dream.jpeg',
              width: 110,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '책이름1',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'dream \ndream \ndream \ndream',
                  overflow: TextOverflow.ellipsis, // ...
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                  ),
                ),
                Text(
                  'dream',
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
