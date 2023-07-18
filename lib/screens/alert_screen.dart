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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.1,
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.05,
                  ),
                  child: SizedBox(
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.7,
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "질병 이름",
                      ),
                    ),
                  ),
                ),
                // 날짜 선택
                const Text("날짜를 입력해주세요"),
                Row(
                  children: [
                    const MyInputField(
                      text: "년",
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,
                    ),
                    const MyInputField(text: "월"),
                    SizedBox(
                      width: screenWidth * 0.05,
                    ),
                    const MyInputField(text: "일"),
                  ],
                ),
                // // 온도, 습도 입력
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    children: [
                      const Row(
                        children: [
                          Text("온도 : "),
                          MyInputField(text: ""),
                        ],
                      ),
                      SizedBox(
                        width: screenWidth * 0.1,
                      ),
                      const Row(
                        children: [
                          Text("습도 : "),
                          MyInputField(text: ""),
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
      ),
    );
  }
}

class MyInputField extends StatelessWidget {
  final String text;

  const MyInputField({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.05,
      child: TextField(
        decoration: InputDecoration(
          hintText: text,
        ),
      ),
    );
  }
}
