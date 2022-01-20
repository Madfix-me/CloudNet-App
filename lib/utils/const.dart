import 'package:flutter/material.dart';

const String appTitle = 'CloudNet';

const radius = LayoutElement<double>(16.0, 8.0, 4.0);
const edgeAll = LayoutElement<EdgeInsets>(
    EdgeInsets.all(24), EdgeInsets.all(16), EdgeInsets.all(4));
const elevation = 0.0;
const iconsSize = 24.0;

const appbarHeight = 66.0;
const navbarHeight = 66.0;
const bottomNavBarHeight = 150.0;

const transitionDuration = Duration(milliseconds: 300);
const transitionCurve = Curves.easeInOut;

const rotationDuration = Duration(milliseconds: 300);
const rotationCurve = Curves.easeInOutBack;

//Helper Layout class
class LayoutElement<T> {
  const LayoutElement(this.big, this.medium, this.small);
  final T big;
  final T medium;
  final T small;
}
