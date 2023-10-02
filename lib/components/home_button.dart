import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String title;
  final VoidCallback func;
  const HomeButton({super.key, required this.title, required this.func});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 319,
          height: 60,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: TextButton(
            onPressed: func,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF07070C),
                fontSize: 28,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class Frame2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: 319,
//           height: 60,
//           padding: const EdgeInsets.only(
//             top: 10,
//             left: 31,
//             right: 31,
//             bottom: 11,
//           ),
//           clipBehavior: Clip.antiAlias,
//           decoration: ShapeDecoration(
//             color: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//           child: TextButton(
//             onPressed: func,
//             child: Text(
//               title,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 color: Colors.amberAccent,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
