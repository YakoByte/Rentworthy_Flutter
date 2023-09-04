import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'common_components/dropdown/dropdown_search.dart';

class UserModel {
  final String id;
  final DateTime createdAt;
  final String name;
  final String avatar;

  UserModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      createdAt: DateTime.parse(json["createdAt"]),
      name: json["name"],
      avatar: json["avatar"],
    );
  }

  static List<UserModel> fromJsonList(List list) {
    return list.map((item) => UserModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  ///this method will prevent the override of toString
  bool userFilterByCreationDate(String filter) {
    return this.createdAt.toString().contains(filter);
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(UserModel model) {
    return this.id == model.id;
  }

  @override
  String toString() => name;
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<int>>();
  final _multiKey = GlobalKey<DropdownSearchState<String>>();
  final _popupBuilderKey = GlobalKey<DropdownSearchState<String>>();
  final _popupCustomValidationKey = GlobalKey<DropdownSearchState<int>>();
  final _userEditTextController = TextEditingController(text: 'Mrs');
  final myKey = GlobalKey<DropdownSearchState<MultiLevelString>>();
  final List<MultiLevelString> myItems = [
    MultiLevelString(level1: "1"),
    MultiLevelString(level1: "2"),
    MultiLevelString(
      level1: "3",
      subLevel: [
        MultiLevelString(level1: "sub3-1"),
        MultiLevelString(level1: "sub3-2"),
      ],
    ),
    MultiLevelString(level1: "4")
  ];
  bool? _popupBuilderSelection = false;

  @override
  Widget build(BuildContext context) {
    void _handleCheckBoxState({bool updateState = true}) {
      var selectedItem =
          _popupBuilderKey.currentState?.popupGetSelectedItems ?? [];
      var isAllSelected =
          _popupBuilderKey.currentState?.popupIsAllItemSelected ?? false;
      _popupBuilderSelection =
          selectedItem.isEmpty ? false : (isAllSelected ? true : null);

      if (updateState) setState(() {});
    }

    _handleCheckBoxState(updateState: false);

    return Scaffold(
      appBar: AppBar(title: Text("DropdownSearch Demo")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(4),
            children: <Widget>[
              ///************************[simple examples for single and multi selection]************///
              Text("[simple examples for single and multi selection]"),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<int>(
                      items: [1, 2, 3, 4, 5, 6, 7],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<int>.multiSelection(
                      clearButtonProps: ClearButtonProps(isVisible: true),
                      items: [1, 2, 3, 4, 5, 6, 7],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customDropDownExampleMultiSelection(
      BuildContext context, List<UserModel> selectedItems) {
    if (selectedItems.isEmpty) {
      return ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(),
        title: Text("No item selected"),
      );
    }

    return Wrap(
      children: selectedItems.map((e) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(e.avatar),
              ),
              title: Text(e.name),
              subtitle: Text(
                e.createdAt.toString(),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, UserModel item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.name),
        subtitle: Text(item.createdAt.toString()),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(item.avatar),
        ),
      ),
    );
  }

  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "https://63c1210999c0a15d28e1ec1d.mockapi.io/users",
      queryParameters: {"filter": filter},
    );

    final data = response.data;
    if (data != null) {
      return UserModel.fromJsonList(data);
    }

    return [];
  }
}

class _CheckBoxWidget extends StatefulWidget {
  final Widget child;
  final bool? isSelected;
  final ValueChanged<bool?>? onChanged;

  _CheckBoxWidget({required this.child, this.isSelected, this.onChanged});

  @override
  CheckBoxState createState() => CheckBoxState();
}

class CheckBoxState extends State<_CheckBoxWidget> {
  bool? isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  void didUpdateWidget(covariant _CheckBoxWidget oldWidget) {
    if (widget.isSelected != isSelected) isSelected = widget.isSelected;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0x88F44336),
            Colors.blue,
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Select: '),
              Checkbox(
                  value: isSelected,
                  tristate: true,
                  onChanged: (bool? v) {
                    if (v == null) v = false;
                    setState(() {
                      isSelected = v;
                      if (widget.onChanged != null) widget.onChanged!(v);
                    });
                  }),
            ],
          ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}

class MultiLevelString {
  final String level1;
  final List<MultiLevelString> subLevel;
  bool isExpanded;

  MultiLevelString({
    this.level1 = "",
    this.subLevel = const [],
    this.isExpanded = false,
  });

  MultiLevelString copy({
    String? level1,
    List<MultiLevelString>? subLevel,
    bool? isExpanded,
  }) =>
      MultiLevelString(
        level1: level1 ?? this.level1,
        subLevel: subLevel ?? this.subLevel,
        isExpanded: isExpanded ?? this.isExpanded,
      );

  @override
  String toString() => level1;
}
