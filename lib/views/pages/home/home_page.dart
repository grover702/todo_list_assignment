import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_assignment/models/user_model.dart';
import 'package:todo_list_assignment/services/shared_pref_view_model.dart';
import 'package:todo_list_assignment/views/widgets/form_input_with_hint_on_top.dart';

class TestPage extends StatefulWidget {
  const TestPage();

  @override
  State<StatefulWidget> createState() => TestPageState();
}

class TestPageState extends State<TestPage> {
  static const maxLength = 20;
  TextEditingController controller = TextEditingController();
  String str = '';

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  double appBarSize = 50;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          /*setState(() {
            appBarSize = 0;
          });*/
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
        }
      }
    });
  }

  final List<Widget> actions = [
    SlideAction(
      closeOnTap: true,
      color: Colors.green,
      /*onTap: () => setState(() => selectedLanguages.remove(lang)),*/
      child: Container(
        height: 50,
        child: Center(
          child: Text(
            'Complete',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  ];

  final List<Widget> secondaryActions = [
    SlideAction(
      closeOnTap: true,
      color: Colors.red,
      /*onTap: () => setState(() => selectedLanguages.remove(lang)),*/
      child: Container(
        height: 50,
        child: Center(
          child: Text(
            'Delete',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  ];

  late ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;

  @override
  Widget build(BuildContext context) {
    /*final SharedPrefController userController = Get.put(SharedPrefController());*/
    final userController = Provider.of<SharedPreferenceProvider>(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return SafeArea(
      child: Scaffold(
        body: Scrollbar(
          controller: _scrollViewController,
          child: ListView(
            children: [
              ImplicitlyAnimatedReorderableList<UserDataModel>(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
//                padding: const EdgeInsets.all(24),
                items: userController.userDataList,
                key: UniqueKey(),
                areItemsTheSame: (oldItem, newItem) => oldItem == newItem,
                onReorderFinished: (item, from, to, newList) {
                  userController.reOrderUserData(newList);
                  /* userController.userDataList
                    ..clear()
                    ..addAll(newList);*/
                },
                header: AnimatedContainer(
                  height: 51,
                  color: Colors.red,
                  duration: Duration(microseconds: 100),
                  child: FormInputWithHint(
                    label: '',
                    hintText: 'Create an item',
                    textInputAction: TextInputAction.done,
                    onSubmitted: () {
                      UserDataModel userData = UserDataModel();
                      userData.setTodoItemDateTime(DateTime.now().toString());
                      userData.setTodoItemName(controller.text.trim());
                      userData.setKey(userController.userDataList.length + 1);
                      userController.saveSharedPreference(userData);
                      controller.text = '';
                    },
                    controller: controller,
                    focusNode: FocusNode(),
                  ),
                ),
                itemBuilder: (context, itemAnimation, item, index) {
                  return Reorderable(
                    key: ValueKey(index),
                    builder: (context, dragAnimation, inDrag) =>
                        AnimatedBuilder(
                      animation: dragAnimation,
                      builder: (context, child) => Slidable(
                        key: ValueKey(index),
                        actionPane: SlidableDrawerActionPane(),
                        dismissal: SlidableDismissal(
                          /*   child: SlidableDrawerDismissal(
                            key: ValueKey(index),
                          ),*/
                          onDismissed: (actionType) {
                            try {
                              Get.snackbar(
                                  '',
                                  actionType == SlideActionType.primary
                                      ? 'Dismiss Archive'
                                      : 'Dismiss Delete');
                              //  userController.removeSavedDataItem(index);
                            } catch (onError) {
                              print(onError.toString());
                            }
                          },
                          child: SlidableDrawerDismissal(),
                        ),
                        actions: actions,
                        secondaryActions: secondaryActions,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: new LinearGradient(
                                colors: [
                                  Colors.red.withOpacity(0.5),
                                  Colors.red,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                tileMode: TileMode.clamp),
                          ),
                          // SizeFadeTransition clips, so use the
                          // Card as a parent to avoid the box shadow
                          // to be clipped.
                          child: SizeFadeTransition(
                            animation: itemAnimation,
                            child: Handle(
                              //delay: const Duration(milliseconds: 600),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                width: double.infinity,
                                child: Text(
                                  '${item.todoItemName}',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              ...userController.userRemovedItems.map((e) {
                return Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      e.todoItemName!,
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
