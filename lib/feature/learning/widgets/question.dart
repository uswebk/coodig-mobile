import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/model/quiz.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Question extends HookConsumerWidget {
  const Question(
    this._text,
    this._tags, {
    super.key,
  });

  final String _text;
  final List<Tag> _tags;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: CoodigColors.secondary,
      margin: const EdgeInsets.all(10),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.black12, width: 1.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text('Q.', style: TextStyle(fontSize: 22, color: Colors.blue, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 5, bottom: 10, right: 5),
                    constraints: const BoxConstraints(maxHeight: 200, minHeight: 150),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: _text,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white, height: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: _tags.map((tag) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: Text(
                          '# ${tag.name}',
                          style: const TextStyle(fontSize: 10, color: Colors.white70),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
