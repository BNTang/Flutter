/// Flutter 程序的入口文件
import 'package:flutter/material.dart';

// 引入解决丢失精度库
import 'package:decimal/decimal.dart';

/// Flutter 程序的入口函数
void main() {
  // 1.Flutter 主函数，程序一运行起来就会执行
  // 2.运行 App 并且创建组件
  runApp(const MyApp());
}

/// MyApp 是一个组件，继承自 StatelessWidget，是一个无状态的组件
/// 并且是符合 Material Design 规范的组件
class MyApp extends StatelessWidget {
  /// const 关键字表示 MyApp 是一个常量，一旦创建就不会被修改
  /// super.key 表示调用父类的构造函数
  const MyApp({super.key});

  /// 自定义无状态组件必须重写父类的 build 方法，返回我们构建好的组件
  @override
  Widget build(BuildContext context) {
    // MaterialApp 是一个符合 Material Design 规范的组件
    return MaterialApp(
      theme: ThemeData.dark(),
      // Scaffold 是一个组件，用于实现页面的基本结构
      home: Scaffold(
        // appBar 是 Scaffold 的一个属性，表示页面的头部
        appBar: AppBar(
          // title 是 AppBar 的一个属性，表示头部的标题
          title: const Text('计算器'),
          // centerTitle 表示标题是否居中
          centerTitle: true,
        ),
        // body 是 Scaffold 的一个属性，表示页面的主体部分
        body: const CalculatorWidget(),
      ),
    );
  }
}

/// CalculatorWidget 是一个组件，继承自 StatefulWidget，是一个有状态的组件
class CalculatorWidget extends StatefulWidget {
  /// const 关键字表示 CalculatorWidget 是一个常量，一旦创建就不会被修改
  /// super.key 表示调用父类的构造函数
  const CalculatorWidget({super.key});

  /// createState 方法返回一个 State 对象
  @override
  State<StatefulWidget> createState() {
    // 返回一个 CalculatorState 对象
    return CalculatorState();
  }
}

/// CalculatorState 是一个 State 对象，继承自 State
/// 用于保存 CalculatorWidget 的状态
class CalculatorState extends State {
  /// 保存计算器的输出
  /// _ 表示私有变量
  String _output = '0';

  // 保存前面输入数据
  dynamic _num1 = 0;

  // 保存后面输入数据
  dynamic _num2 = 0;

  // 保存当前计算状态
  bool isCalculate = false;

  // 保存当前运算符
  String _operand = "";

  // 快速处理丢失精度结构
  final d = (String s) => Decimal.parse(s);

  void onBtnClick(btnText) {
    switch (btnText) {
      case "AC":
        _output = "0";
        _num1 = 0;
        _num2 = 0;
        isCalculate = false;
        _operand = "";
        break;
      case "+/-":
        // 负负得正
        if (_output.contains(".")) {
          // 小数
          _output = (-double.parse(_output)).toString();
        } else {
          // 整数
          _output = (-int.parse(_output)).toString();
        }
        break;
      case "%":
        // 百分号, 除以100
        _output = (d(_output) / d("100.0")).toDouble().toString();
        break;
      case "÷":
        isCalculate = true;
        _operand = btnText;

        // 如果已经保存了上一次输入内容, 那么就做运算
        if (_num1 != 0) {
          // 小数之间的运算
          if (_output.contains(".") || _num1 is double) {
            // 保存当前输入值
            _num2 = double.parse(_output);
            _output = (d(_num1.toString()) / d(_num2.toString()))
                .toDouble()
                .toString();
            _num1 = double.parse(_output);
          } else {
            // 整数之间运算
            _num2 = double.parse(_output);
            // 保存当前输入值
            _output = (d(_num1.toString()) / d(_num2.toString()))
                .toBigInt()
                .toString();
            _num1 = int.parse(_output);
          }
        }
        break;
      case "x":
        isCalculate = true;
        _operand = btnText;
        // 如果已经保存了上一次输入内容, 那么就做运算
        if (_num1 != 0) {
          // 小数之间的运算
          if (_output.contains(".") || _num1 is double) {
            // 保存当前输入值
            _num2 = double.parse(_output);
            _output = (d(_num1.toString()) * d(_num2.toString()))
                .toDouble()
                .toString();
            _num1 = double.parse(_output);
          } else {
            // 整数之间运算
            // 保存当前输入值
            _num2 = double.parse(_output);
            _output = (d(_num1.toString()) * d(_num2.toString()))
                .toBigInt()
                .toString();
            _num1 = int.parse(_output);
          }
        }
        break;
      case "+":
        isCalculate = true;
        _operand = btnText;
        if (_num1 != 0) {
          // 如果已经保存了上一次输入内容, 那么就做运算
          if (_output.contains(".") || _num1 is double) {
            // 小数之间的运算
            // 保存当前输入值
            _num2 = double.parse(_output);
            _output = (d(_num1.toString()) + d(_num2.toString()))
                .toDouble()
                .toString();
            _num1 = double.parse(_output);
          } else {
            // 整数之间运算
            // 保存当前输入值
            _num2 = double.parse(_output);
            _output = (d(_num1.toString()) + d(_num2.toString()))
                .toBigInt()
                .toString();
            _num1 = int.parse(_output);
          }
        }
        break;
      case "-":
        isCalculate = true;
        _operand = btnText;
        if (_num1 != 0) {
          // 如果已经保存了上一次输入内容, 那么就做运算
          if (_output.contains(".") || _num1 is double) {
            // 小数之间的运算
            // 保存当前输入值
            _num2 = double.parse(_output);
            _output = (d(_num1.toString()) - d(_num2.toString()))
                .toDouble()
                .toString();
            _num1 = double.parse(_output);
          } else {
            // 整数之间运算
            // 保存当前输入值
            _num2 = double.parse(_output);
            _output = (d(_num1.toString()) - d(_num2.toString()))
                .toBigInt()
                .toString();
            _num1 = int.parse(_output);
          }
        }
        break;
      case "=":
        onBtnClick(_operand);
        _operand = "";
        isCalculate = false;
        _num1 = 0;
        _num2 = 0;
        break;
      default:
        // 判断是否点击了运算符, 如果点击了就将当前的数据先存储起来
        if (isCalculate) {
          if (_output.contains(".")) {
            _num1 = double.parse(_output);
          } else {
            _num1 = int.parse(_output);
          }
          _output = "0";
          isCalculate = false;
        }

        // 如果是小数, 那么就不能再输入点了，如果已经包含了点，那么就不能再输入点了
        if (btnText == "." && _output.contains(".")) return;
        // 最多只能输入11位数，如果超过了就不能再输入了
        if (_output.length >= 11) return;
        // 第一次输入，如果输入的是0，那么就替换掉
        if (btnText != "." && _output == "0") {
          _output = btnText;
        } else {
          // 如果不是第一次输入，那么就拼接
          _output += btnText;
        }
        break;
    }

    // 只要执行了这句话, 就会更新UI
    setState(() {});
  }

  /// flutter 中的注释有哪些
  /// 1.单行注释 //
  /// 2.多行注释 /* */
  /// 3.文档注释 ///

  /// buildButton 方法用于构建按钮
  /// btnText 表示按钮的文本
  /// curColor 表示按钮的背景颜色
  /// isDouble 表示按钮是否是双倍宽度
  /// 返回一个按钮组件
  Widget buildButton(String btnText, dynamic curColor,
      {bool isDouble = false}) {
    return Container(
      // margin 表示容器的外边距, const EdgeInsets.only 表示只设置某个方向的外边距
      margin: const EdgeInsets.only(top: 10),
      // child 表示容器的子组件, GestureDetector 表示手势检测组件
      child: GestureDetector(
        // onTap 表示手势检测组件的点击事件
        onTap: () => onBtnClick(btnText),
        // child 表示手势检测组件的子组件
        child: Container(
          // width 表示容器的宽度
          width: isDouble ? 180 : 80,
          // height 表示容器的高度
          height: 80,
          // decoration 表示容器的装饰器，BoxDecoration 表示装饰器的样式
          decoration: BoxDecoration(
              // shape 表示装饰器的形状，BoxShape.rectangle 表示矩形
              shape: BoxShape.rectangle,
              // borderRadius 表示装饰器的圆角，const BorderRadius.all 表示所有的圆角
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              // color 表示装饰器的背景颜色
              color: curColor),
          // child 表示容器的子组件
          child: Center(
            // child 表示子组件的子组件
            child: Text(btnText,
                // style 表示文本的样式
                style: const TextStyle(
                    // fontSize 表示文本的大小
                    fontSize: 30,
                    // fontWeight 表示文本的粗细
                    fontWeight: FontWeight.bold,
                    // color 表示文本的颜色
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 计算器上半部分内容
        Container(
          // alignment 表示容器的对齐方式, Alignment.centerRight 表示右对齐
          alignment: Alignment.centerRight,
          // padding 表示容器的内边距, EdgeInsets.fromLTRB 表示分别设置左、上、右、下的内边距
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
          child: Text(
            // _output 表示计算器的输出，因为是动态计算的需要用状态保存
            _output,
            style: const TextStyle(fontSize: 62, color: Colors.white),
          ),
        ),
        // 计算器下半部分内容
        Container(
          // child 表示容器的子组件
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton("AC", Colors.grey),
                  buildButton("+/-", Colors.grey),
                  buildButton("%", Colors.grey),
                  buildButton("÷", Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton("7", Colors.grey),
                  buildButton("8", Colors.grey),
                  buildButton("9", Colors.grey),
                  buildButton("x", Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton("4", Colors.grey),
                  buildButton("5", Colors.grey),
                  buildButton("6", Colors.grey),
                  buildButton("-", Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton("1", Colors.grey),
                  buildButton("2", Colors.grey),
                  buildButton("3", Colors.grey),
                  buildButton("+", Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton("0", Colors.grey, isDouble: true),
                  buildButton(".", Colors.grey),
                  buildButton("=", Colors.orange),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
