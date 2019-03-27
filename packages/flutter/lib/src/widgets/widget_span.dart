// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui' as ui show ParagraphBuilder;

import 'package:flutter/painting.dart';
import 'package:flutter/gestures.dart';

import 'framework.dart';

/// An immutable span of text.
///
/// A [TextSpan] object can be styled using its [style] property.
/// The style will be applied to the [text] and the [children].
///
/// A [TextSpan] object can just have plain text, or it can have
/// children [TextSpan] objects with their own styles that (possibly
/// only partially) override the [style] of this object. If a
/// [TextSpan] has both [text] and [children], then the [text] is
/// treated as if it was an unstyled [TextSpan] at the start of the
/// [children] list.
///
/// To paint a [TextSpan] on a [Canvas], use a [TextPainter]. To display a text
/// span in a widget, use a [RichText]. For text with a single style, consider
/// using the [Text] widget.
///
/// {@tool sample}
///
/// The text "Hello world!", in black:
///
/// ```dart
/// TextSpan(
///   text: 'Hello world!',
///   style: TextStyle(color: Colors.black),
/// )
/// ```
/// {@end-tool}
///
/// _There is some more detailed sample code in the documentation for the
/// [recognizer] property._
///
/// See also:
///
///  * [Text], a widget for showing uniformly-styled text.
///  * [RichText], a widget for finer control of text rendering.
///  * [TextPainter], a class for painting [TextSpan] objects on a [Canvas].
@immutable
class WidgetSpan extends PlaceholderSpan {
  /// Creates a [TextSpan] with the given values.
  ///
  /// For the object to be useful, at least one of [text] or
  /// [children] should be set.
  const WidgetSpan({
    Widget widget,
    TextStyle style,
    GestureRecognizer recognizer,
  }) : assert(widget != null),
       widget = widget,
       super(style: style, recognizer: recognizer);

  final Widget widget;

  // /// Describe the difference between this text span and another, in terms of
  // /// how much damage it will make to the rendering. The comparison is deep.
  // ///
  // /// See also:
  // ///
  // ///  * [TextStyle.compareTo], which does the same thing for [TextStyle]s.
  // RenderComparison compareTo(TextSpan other) {
  //   if (identical(this, other))
  //     return RenderComparison.identical;
  //   if (other.text != text ||
  //       children?.length != other.children?.length ||
  //       (style == null) != (other.style == null))
  //     return RenderComparison.layout;
  //   RenderComparison result = recognizer == other.recognizer ? RenderComparison.identical : RenderComparison.metadata;
  //   if (style != null) {
  //     final RenderComparison candidate = style.compareTo(other.style);
  //     if (candidate.index > result.index)
  //       result = candidate;
  //     if (result == RenderComparison.layout)
  //       return result;
  //   }
  //   if (children != null) {
  //     for (int index = 0; index < children.length; index += 1) {
  //       final RenderComparison candidate = children[index].compareTo(other.children[index]);
  //       if (candidate.index > result.index)
  //         result = candidate;
  //       if (result == RenderComparison.layout)
  //         return result;
  //     }
  //   }
  //   return result;
  // }

  // @override
  // bool operator ==(dynamic other) {
  //   if (identical(this, other))
  //     return true;
  //   if (other.runtimeType != runtimeType)
  //     return false;
  //   final TextSpan typedOther = other;
  //   return typedOther.text == text
  //       && typedOther.style == style
  //       && typedOther.recognizer == recognizer
  //       && listEquals<TextSpan>(typedOther.children, children);
  // }

  // @override
  // int get hashCode => hashValues(style, text, recognizer, hashList(children));

  // @override
  // String toStringShort() => '$runtimeType';

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.defaultDiagnosticsTreeStyle = DiagnosticsTreeStyle.whitespace;
  //   // Properties on style are added as if they were properties directly on
  //   // this TextSpan.
  //   if (style != null)
  //     style.debugFillProperties(properties);

  //   properties.add(DiagnosticsProperty<GestureRecognizer>(
  //     'recognizer', recognizer,
  //     description: recognizer?.runtimeType?.toString(),
  //     defaultValue: null,
  //   ));

  //   properties.add(StringProperty('text', text, showName: false, defaultValue: null));
  //   if (style == null && text == null && children == null)
  //     properties.add(DiagnosticsNode.message('(empty)'));
  // }

  // @override
  // List<DiagnosticsNode> debugDescribeChildren() {
  //   if (children == null)
  //     return const <DiagnosticsNode>[];
  //   return children.map<DiagnosticsNode>((TextSpan child) {
  //     if (child != null) {
  //       return child.toDiagnosticsNode();
  //     } else {
  //       return DiagnosticsNode.message('<null child>');
  //     }
  //   }).toList();
  // }
}
