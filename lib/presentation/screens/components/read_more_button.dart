import 'package:fitness_thoughts/core/locator.dart';
import 'package:fitness_thoughts/core/utils/extensions/widget_extensions.dart';
import 'package:fitness_thoughts/domain/use_case/initiate_payment.dart';
import 'package:fitness_thoughts/presentation/providers/system_config_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReadMoreButton extends StatelessWidget {
  const ReadMoreButton({
    super.key,
    this.callback,
    this.color = Colors.black,
    this.absorbing = false,
  });

  final VoidCallback? callback;
  final Color color;
  final bool absorbing;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return AbsorbPointer(
        absorbing: absorbing,
        child: GestureDetector(
          onTap: () async {

            var config = ref.read(systemConfigProvider);
            if (callback != null) {
              await locator<InitiatePayment>().call(
                amount: 100,
                contact: '8086028340',
                email: 'sivaprasadnk123@gmail.com',
                key: kDebugMode ? config.liveKey! : config.liveKey!,
                appName: config.appName!,
                appDescription: config.appDescription!,
              );
              // callback!.call();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Text(
                  'Read more',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.arrow_forward_rounded,
                color: color,
                size: 16,
              )
            ],
          ),
        ),
      ).showCursorOnHover;
    });
  }
}
