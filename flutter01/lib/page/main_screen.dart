import 'package:flutter/material.dart';

// 导入自定义按钮
import 'custom_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi File Development in Flutter'),
      ),
      body: const Center(
        // 使用自定义按钮
        child: CustomButton(),
      ),
    );
  }
}
