import 'dart:math';

import 'package:sberbank_acquiring/sberbank_acquiring_core.dart';

final SberbankAcquiring acquiring = SberbankAcquiring(
  SberbankAcquiringConfig(
    userName: '',
    password: '',
  ),
);

const String orderId = '';
const String pan = '4111111111111111';
const String clientId = '';
const String bindingId = '';

String get orderNumber =>
    (999999 * Random(DateTime.now().millisecondsSinceEpoch).nextInt(100000))
        .toString();
