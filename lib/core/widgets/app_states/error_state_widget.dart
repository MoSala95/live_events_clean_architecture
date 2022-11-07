// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ErrorrStateWidget extends StatelessWidget {
//   final Function()? onRetry;
//   const ErrorrStateWidget({super.key, this.onRetry});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Icon(
//               Icons.error,
//               color: Theme.of(context).errorColor,
//               size: 150.0,
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             RichText(
//               // ignore: prefer_const_constructors
//               text: TextSpan(
//                 text: 'Ooops!',
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 32,
//                 ),
//                 children: <TextSpan>[
//                   TextSpan(
//                       text: ' seems like there is an error',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: Text(
//                 "We are sorry that you experianced this, please try again later. ",
//                 style: TextStyle(fontSize: 14),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Container(
//                 padding: EdgeInsets.fromLTRB(20, 0, 20, 50),
//                 child: Visibility(
//                   visible: onRetry != null,
//                   child: ElevatedButton(
//                     onPressed: onRetry,
//                     child: Text("Retry"),
//                   ),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
