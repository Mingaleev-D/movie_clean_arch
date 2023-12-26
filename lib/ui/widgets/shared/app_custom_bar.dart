import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppCustomBar extends StatelessWidget {
  const AppCustomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                const Text('🎞️'),
                const Gap(10),
                Text(
                  'Фильмы в кино',
                  style: titleStyle,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search_outlined)),
              ],
            )),
      ),
    );
  }
}
