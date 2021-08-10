import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum BloodSupplyStatus { kritisch, laag, goed }

extension BloodSupplyStatusExtension on BloodSupplyStatus {

  String get name {
    switch (this) {
      case BloodSupplyStatus.kritisch:
        return "kritisch";
      case BloodSupplyStatus.laag:
        return "laag";
      case BloodSupplyStatus.goed:
        return "goed";
    }
  }

  String label(BuildContext context) {
    switch (this) {
      case BloodSupplyStatus.kritisch:
        return AppLocalizations.of(context)!.bloodSupplyStatusCritical;
      case BloodSupplyStatus.laag:
        return AppLocalizations.of(context)!.bloodSupplyStatusLow;
      case BloodSupplyStatus.goed:
        return AppLocalizations.of(context)!.bloodSupplyStatusGood;
    }
  }

  String description(BuildContext context) {
    switch (this) {
      case BloodSupplyStatus.kritisch:
        return AppLocalizations.of(context)!.bloodSupplyStatusCriticalDescription;
      case BloodSupplyStatus.laag:
        return AppLocalizations.of(context)!.bloodSupplyStatusLowDescription;
      case BloodSupplyStatus.goed:
        return AppLocalizations.of(context)!.bloodSupplyStatusGoodDescription;
    }
  }
}
