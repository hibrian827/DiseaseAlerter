import 'package:flutter/material.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  // final String _selectedDate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "환자가 발생했나요?",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              const Text("상황을 자세히 설명해줘서 추가해주세요!"),
              const Text("당신의 노력이 다음 환자를 예방합니다"),
              // 질병 입력
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 30,
                ),
                child: SizedBox(
                  height: 40,
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "질병 이름",
                    ),
                  ),
                ),
              ),
              // 날짜 선택
              const Text("날짜를 입력해주세요"),
              const Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "년",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 70,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "월",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 70,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "일",
                      ),
                    ),
                  ),

                  // IconButton(
                  //   onPressed: () {
                  //     _selectedDate = "";
                  //   },
                  //   icon: const Icon(Icons.date_range),
                  // )
                ],
              ),
              // // 온도, 습도 입력
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Text("온도 : "),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: TextField(),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Row(
                      children: [
                        Text("습도 : "),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: TextField(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
