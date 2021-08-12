import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum BloodSupplyStatus { critical, low, good }

extension BloodSupplyStatusExtension on BloodSupplyStatus {
  String get name {
    switch (this) {
      case BloodSupplyStatus.critical:
        return "kritisch";
      case BloodSupplyStatus.low:
        return "laag";
      case BloodSupplyStatus.good:
        return "goed";
    }
  }

  String label(BuildContext context) {
    switch (this) {
      case BloodSupplyStatus.critical:
        return AppLocalizations.of(context)!.bloodSupplyStatusCritical;
      case BloodSupplyStatus.low:
        return AppLocalizations.of(context)!.bloodSupplyStatusLow;
      case BloodSupplyStatus.good:
        return AppLocalizations.of(context)!.bloodSupplyStatusGood;
    }
  }

  String description(BuildContext context) {
    switch (this) {
      case BloodSupplyStatus.critical:
        return AppLocalizations.of(context)!.bloodSupplyStatusCriticalDescription;
      case BloodSupplyStatus.low:
        return AppLocalizations.of(context)!.bloodSupplyStatusLowDescription;
      case BloodSupplyStatus.good:
        return AppLocalizations.of(context)!.bloodSupplyStatusGoodDescription;
    }
  }
}
