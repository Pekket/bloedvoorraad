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

  String get label {
    switch (this) {
      case BloodSupplyStatus.kritisch:
        return "Kritische voorraad";
      case BloodSupplyStatus.laag:
        return "Lage voorraad";
      case BloodSupplyStatus.goed:
        return "Voldoende voorraad";
    }
  }

  String get description {
    switch (this) {
      case BloodSupplyStatus.kritisch:
        return "De bloedvoorraad van jouw bloedgroep is kritiek.";
      case BloodSupplyStatus.laag:
        return "De bloedvoorraad van deze bloedgroep is laag.";
      case BloodSupplyStatus.goed:
        return "De bloedvoorraad van deze bloedgroep is voldoende hoog.";
    }
  }
}
