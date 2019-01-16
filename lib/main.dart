import 'package:flutter/material.dart';

// Calculator
const String APP_NAME = 'Simple Calculator';
const String PLUS = '+';
const String MINUS = '-';
const String TIMES = 'X';
const String DIVIDED_BY = '/';
const String CLEAR = 'C';
const String CANCEL_INPUT = 'CI';
const String PERCENTAGE = '%';
const String POSITIVE_NEGATIVE = '+/-';
const String DECIMAL = '.';
const String EQUALS = '=';
const String ONE = '1';
const String TWO = '2';
const String THREE = '3';
const String FOUR = '4';
const String FIVE = '5';
const String SIX = '6';
const String SEVEN = '7';
const String EIGHT = '8';
const String NINE = '9';
const String ZERO = '0';

// Components sizes
const double PORTRAIT_FONTSIZE = 40.0;
const double PORTRAIT_HEIGHT = 90.0;
const double LANDSCAPE_FONTSIZE = 20.0;
const double LANDSCAPE_HEIGHT = 52.0;

void main() => runApp(new MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blueGrey,
        accentColor: Colors.white70,
      ),
      home: new SimpleCalculator(),
    ));

class SimpleCalculator extends StatefulWidget {
  @override
  State createState() => new _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  Calculator _calculator = new Calculator();
  String _displayText = ZERO;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(APP_NAME),
        ),
        body: OrientationBuilder(
            builder: (context, orientation) =>
              orientation == Orientation.portrait
                ? _buildPortraitOrientation() : _buildLandscapeOrientation()
            )
    );
  }

  Widget _buildPortraitOrientation(){
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 15.0, top: 5.0),
            child: Text(
              _displayText,
              textAlign: TextAlign.right,
              softWrap: false,
              style: TextStyle(fontSize: 80.0)
            ),
          ),
          Row(
            children: <Widget>[
              _buildButton(CLEAR, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
              _buildButton(CANCEL_INPUT, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
              _buildButton(PERCENTAGE, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
              _buildButton(DIVIDED_BY, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton(ONE, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
              _buildButton(TWO, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
              _buildButton(THREE, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
              _buildButton(TIMES, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton(FOUR, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
              _buildButton(FIVE, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
              _buildButton(SIX, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
              _buildButton(MINUS, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton(SEVEN, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
              _buildButton(EIGHT, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
              _buildButton(NINE, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
              _buildButton(PLUS, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton(DECIMAL, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
              _buildButton(ZERO, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
              _buildButton(POSITIVE_NEGATIVE, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
              _buildButton(EQUALS, PORTRAIT_HEIGHT, PORTRAIT_FONTSIZE),
            ],
          )
        ],
      );
  }

  Widget _buildLandscapeOrientation(){
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 15.0, top: 5.0),
            child: Text(
              _displayText,
              textAlign: TextAlign.right,
              softWrap: false,
              style: TextStyle(fontSize: 50.0),
            ),
          ),
          Row(
            children: <Widget>[
              _buildButton(CLEAR, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
              _buildButton(CANCEL_INPUT, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
              _buildButton(PERCENTAGE, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
              _buildButton(POSITIVE_NEGATIVE, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
              _buildButton(DIVIDED_BY, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton(ONE, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
              _buildButton(TWO, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
              _buildButton(THREE, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
              _buildButton(FOUR, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
              _buildButton(TIMES, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton(FIVE, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
              _buildButton(SIX, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
              _buildButton(SEVEN, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
              _buildButton(EIGHT, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
              _buildButton(MINUS, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton(NINE, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
              _buildButton(ZERO, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
              _buildButton(DECIMAL, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
              _buildButton(EQUALS, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
              _buildButton(PLUS, LANDSCAPE_HEIGHT, LANDSCAPE_FONTSIZE),
            ],
          )
        ],
      );
  }

  Widget _buildButton(String text, double height, double fontSize) {
    return Expanded(
      child: new MaterialButton(
          height: height,
          color: Theme.of(context).primaryColor,
          textColor: Theme.of(context).accentColor,
          child: new Text(text, style: TextStyle(fontSize: fontSize)),
          onPressed: () => _display(text)),
    );
  }

  void _display(String text) {

    if (text == CLEAR) {
      _calculator.clear();
    }

    if (text == CANCEL_INPUT) {
      _calculator.cancelInput();
    }

    if (text == POSITIVE_NEGATIVE) {
      _calculator.positiveNegative();
    }

    if (text == DECIMAL) {
      _calculator.decimal();
    }

    if (_isOperator(text)) {
      _calculator.operator(text);
    }

    if (_isNumber(text)) {
      _calculator.number(text);
    }

    if (text == EQUALS) {
      _calculator.equals();
    }

    setState(() {
      _displayText = _calculator.display;
    });
  }

  bool _isNumber(String text) {
    return (double.tryParse(text) != null);
  }

  bool _isOperator(String text) {
    return text == PLUS ||
        text == MINUS ||
        text == TIMES ||
        text == DIVIDED_BY ||
        text == PERCENTAGE;
  }
}

class Calculator {

  String _display;
  String _operator;
  double _firstValue;
  double _currentValue;
  bool _hasDecimal;

  Calculator(){
    _display = ZERO;
    _initialize();
  }

  String get display => _display;

  void clear(){
    _display = ZERO;
    _initialize();
  }

  void cancelInput(){
    _display = ZERO;
    _currentValue = 0.0;
  }

  void operator(String operator){
    _operator = operator;
    _firstValue = _currentValue;
    _currentValue = 0.0;
    _hasDecimal = false;
  }

  void decimal(){
    if (!_hasDecimal) {
      _display += DECIMAL;
      _hasDecimal = true;
    }
  }

  void number(String text){
    if (_hasDecimal)
      _display = _getCurrentInteger() + '.' + _getCurrentDecimals() + text;
    else
      _display = _getCurrentInteger() + text;

    _currentValue = double.tryParse(_display);
  }

  void positiveNegative(){
    if (_display != ZERO) {
      _currentValue = _currentValue * -1;
      _display = _formatResult(_currentValue);
    }
  }

  void equals(){
    var _total = 0.0;

    if (_operator == PLUS)
      _total = _firstValue + _currentValue;
    else if (_operator == MINUS)
      _total = _firstValue - _currentValue;
    else if (_operator == TIMES)
      _total = _firstValue * _currentValue;
    else if (_operator == DIVIDED_BY)
      _total = _firstValue / _currentValue;
    else if (_operator == PERCENTAGE)
      _total = _firstValue * (_currentValue / 100);

    _display = _formatResult(_total);

    _initialize();
  }

  void _initialize(){
    _operator = null;
    _firstValue = 0.0;
    _currentValue = 0.0;
    _hasDecimal = false;
  }

  String _formatResult(double value){
    if ((value - value.toInt()) != 0)
      return value.toString();
    else
      return value.toInt().toString();
  }

  String _getCurrentInteger() {
    return _currentValue.toInt() == 0 ? '' : _currentValue.toInt().toString();
  }

  String _getCurrentDecimals() {
    var _currentValueArray = _currentValue.toString().split('.');
    return _currentValueArray[1] == ZERO ? '' : _currentValueArray[1];
  }
}