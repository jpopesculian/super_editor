import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:super_text/super_text.dart';

import 'super_text_test_tools.dart';

const primaryCaretStyle = CaretStyle(color: Colors.black);

void main() {
  group("Caret layer", () {
    group("with a single caret", () {
      testGoldens("paints a normal caret", (tester) async {
        await pumpThreeLinePlainSuperText(
          tester,
          aboveBuilder: (context, TextLayout textLayout) {
            return Stack(
              children: [
                TextLayoutCaret(
                  textLayout: textLayout,
                  style: primaryCaretStyle,
                  position: const TextPosition(offset: 35),
                  blinkCaret: false,
                ),
              ],
            );
          },
        );

        await screenMatchesGolden(tester, "CaretLayer_single-caret_normal");
      });

      testGoldens("paints caret styles", (tester) async {
        await pumpThreeLinePlainSuperText(
          tester,
          aboveBuilder: (context, TextLayout textLayout) {
            return Stack(
              children: [
                TextLayoutCaret(
                  textLayout: textLayout,
                  style: const CaretStyle(
                    width: 4,
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                  position: const TextPosition(offset: 35),
                  blinkCaret: false,
                ),
              ],
            );
          },
        );

        await screenMatchesGolden(tester, "CaretLayer_single-caret_decorated");
      });
    });

    group("with multiple carets", () {
      testGoldens("paints multiple carets", (tester) async {
        await pumpThreeLinePlainSuperText(
          tester,
          aboveBuilder: (context, TextLayout textLayout) {
            return Stack(
              children: [
                TextLayoutCaret(
                  textLayout: textLayout,
                  style: primaryCaretStyle,
                  position: const TextPosition(offset: 35),
                  blinkCaret: false,
                ),
                TextLayoutCaret(
                  textLayout: textLayout,
                  style: primaryCaretStyle.copyWith(color: Colors.purpleAccent),
                  position: const TextPosition(offset: 83),
                  blinkCaret: false,
                ),
                TextLayoutCaret(
                  textLayout: textLayout,
                  style: primaryCaretStyle.copyWith(color: Colors.green),
                  position: const TextPosition(offset: 16),
                  blinkCaret: false,
                ),
              ],
            );
          },
        );

        await screenMatchesGolden(tester, "CaretLayer_multi-caret");
      });

      testGoldens("paints two carets at the same position", (tester) async {
        await pumpThreeLinePlainSuperText(
          tester,
          aboveBuilder: (context, TextLayout textLayout) {
            return Stack(
              children: [
                TextLayoutCaret(
                  textLayout: textLayout,
                  style: primaryCaretStyle,
                  position: const TextPosition(offset: 35),
                  blinkCaret: false,
                ),
                TextLayoutCaret(
                  textLayout: textLayout,
                  style: primaryCaretStyle.copyWith(color: Colors.purpleAccent),
                  position: const TextPosition(offset: 35),
                  blinkCaret: false,
                ),
              ],
            );
          },
        );

        await screenMatchesGolden(tester, "CaretLayer_two-carets-same-position");
      });
    });
  });
}
