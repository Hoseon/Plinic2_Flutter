// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// /* 아임포트 결제 모듈을 불러옵니다. */
// import 'package:iamport_flutter/iamport_payment.dart';
// /* 아임포트 결제 데이터 모델을 불러옵니다. */
// import 'package:iamport_flutter/model/payment_data.dart';

// class Payment extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // final todo = ModalRoute.of(context).settings.arguments;
//     // print(todo);
//     return IamportPayment(
//       appBar: new AppBar(
//         title: new Text('아임포트 플리닉 결제'),
//       ),
//       initialChild: Container(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               SvgPicture.asset(
//                 'assets/images/ic_system_logo_symbol.svg',
//                 width: 130,
//                 height: 130,
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
//                 child: Text(
//                   '잠시만 기다려주세요...',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       userCode: 'imp24449006', //가맹점 식별코드
//       data: PaymentData.fromJson({
//         'pg': 'html5_inicis', // PG사
//         'payMethod': 'card', // 결제수단
//         'name': '플리닉2 과도금액 결제', // 주문명
//         'merchantUid': 'mid_${DateTime.now().millisecondsSinceEpoch}', // 주문번호
//         'amount': 10000000, // 결제금액
//         'buyerName': '홍길동', // 구매자 이름
//         'buyerTel': '01012345678', // 구매자 연락처
//         'buyerEmail': 'example@naver.com', // 구매자 이메일
//         'buyerAddr': '서울시 강남구 신사동 661-16', // 구매자 주소
//         'buyerPostcode': '06018', // 구매자 우편번호
//         'appScheme': 'plinic_v2', // 앱 URL scheme
//         'display': {
//           'cardQuota': [2, 3] //결제창 UI 내 할부개월수 제한
//         }
//       }),
//       //콜백함수 호출
//       callback: (Map<String, String> result) {
//         print(result);
//       },
//     );
//   }
// }