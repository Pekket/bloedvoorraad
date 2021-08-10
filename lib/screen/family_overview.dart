import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants.dart' as Constants;

import '../model/blood_type.dart';
import '../widget/add_family_form.dart';
import '../service/local_storage_service.dart';
import '../model/family_member.dart';

class FamilyOverview extends StatefulWidget {
  static String id = "family_overview";

  @override
  _FamilyOverviewState createState() => _FamilyOverviewState();
}

class _FamilyOverviewState extends State<FamilyOverview> {
  List<FamilyMember> _familyMembers = [];

  @override
  void initState() {
    super.initState();

    LocalStorage.getFamilyMembers().then((members) {
      setState(() {
        _familyMembers = members;
      });
    });
  }

  void _removeMember(index) {
    this.setState(() {
        _familyMembers.removeAt(index);
      });

    LocalStorage.saveFamilyMembers(_familyMembers);
  }

  void _addMember(String name, BloodType bt) {

    this.setState(() {
      _familyMembers.add(FamilyMember(name, bt));
    });

    Navigator.pop(context);
    LocalStorage.saveFamilyMembers(_familyMembers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return _bottomSheet;
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: _familyMembers.length > 0
          ? ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(8.0),
              itemCount: _familyMembers.length,
              itemBuilder: (context, index) {
                final member = _familyMembers[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Card(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                    child: Container(
                      alignment: AlignmentDirectional.centerEnd,
                      color: Constants.PRIMARY_COLOR,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.delete_forever_rounded,
                          color: Constants.WHITE_COLOR,
                        ),
                      ),
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) => _removeMember(index),
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                    child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Constants.PRIMARY_COLOR,
                          child: Text(
                            member.bloodType.name,
                            style: TextStyle(color: Constants.WHITE_COLOR),
                          ),
                        ),
                        title: Text(
                          member.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                );
              })
          : Center(child: Text(AppLocalizations.of(context)!.familyEmptyList)),
    );
  }

  Widget get _bottomSheet => Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: AddFamilyMember(_addMember));
}
