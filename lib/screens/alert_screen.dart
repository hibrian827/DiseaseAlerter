import 'package:flutter/material.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  final String _selectedDate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Text(
                "환자가 발생했나요?",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              const Text("상황을 자세히 설명해줘서 추가해주세요!"),
              const Text("당신의 노력이 다음 환자를 예방합니다"),
              // 질병 입력
              // const TextField(
              //   decoration: InputDecoration(
              //     hintText: "질병 이름",
              //   ),
              // ),
              // 날짜 선택
              // Row(
              //   children: [
              //     const Text(""),
              //     const Text(""),
              //     const Text(""),
              //     IconButton(
              //       onPressed: () {
              //         _selectedDate = "";
              //       },
              //       icon: const Icon(Icons.date_range),
              //     )
              //   ],
              // ),
              // // 온도, 습도 입력
              // const Row(
              //   children: [
              //     Row(
              //       children: [
              //         Text("온도 : "),
              //         TextField(),
              //       ],
              //     ),
              //     Row(
              //       children: [
              //         Text("습도 : "),
              //         TextField(),
              //       ],
              //     ),
              //   ],
              // ),
              // // 인원 수 입력
              // const Row(
              //   children: [
              //     Text("감염 인원 : "),
              //     TextField(),
              //   ],
              // ),
              // 업로드 버튼
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
        ],
      ),
    );
  }
}
