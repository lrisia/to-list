import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo/config/themes/theme_manager.dart';
import 'package:flutter_todo/model/todo.dart';

class TodoCard extends StatefulWidget {
  final Todo todo;
  final void Function(BuildContext)? onDelete;
  final void Function(BuildContext)? onDone;

  const TodoCard(this.todo, {super.key, this.onDelete, this.onDone});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  final TextEditingController _titleTextEditingController =
      TextEditingController();
  final TextEditingController _subTitleTextEditingController =
      TextEditingController();
  final FocusNode _titleTextFocusNode = FocusNode();
  final FocusNode _subtitleTextFocusNode = FocusNode();

  final int _secordDalayBeforeRemoveTodo = 3;
  Timer? _timer;
  int _countSecond = 0;

  @override
  void initState() {
    super.initState();
    _titleTextEditingController.text = widget.todo.title;
    _subTitleTextEditingController.text = widget.todo.description ?? '';
    if (_titleTextEditingController.text.isEmpty) {
      _titleTextFocusNode.requestFocus();
    }
    _titleTextFocusNode.addListener(_onFocusChange);
    _subtitleTextFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (!_titleTextFocusNode.hasFocus &&
        _titleTextEditingController.text.isEmpty) {
      setState(() {
        widget.onDelete?.call(context);
      });
    } else if (!_subtitleTextFocusNode.hasFocus &&
        _subTitleTextEditingController.text.isEmpty) {
      setState(() {
        widget.todo.editDescription(null);
      });
    }
  }

  @override
  void dispose() {
    _titleTextEditingController.dispose();
    _subTitleTextEditingController.dispose();
    _titleTextFocusNode.dispose();
    _subtitleTextFocusNode.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _titleTextEditingController.text = widget.todo.title;
    _subTitleTextEditingController.text = widget.todo.description ?? '';

    return Slidable(
      key: Key(widget.todo.id),
      endActionPane: ActionPane(
        extentRatio: 0.5,
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {
          widget.onDelete?.call(context);
        }),
        children: [
          SlidableAction(
            onPressed: widget.onDelete,
            icon: Icons.delete,
            label: 'Delete',
            backgroundColor: Colors.red,
            foregroundColor: context.colorScheme.onError,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.scale(
            scale: 1.25,
            child: Checkbox(
              value: widget.todo.done,
              onChanged: (value) {
                setState(() {
                  widget.todo.changeDone(value);
                });
                if (value == true) {
                  _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                    setState(() {
                      _countSecond++;
                    });
                    if (_countSecond == _secordDalayBeforeRemoveTodo) {
                      setState(() {
                        _timer?.cancel();
                        widget.onDelete?.call(context);
                      });
                    }
                  });
                } else {
                  setState(() {
                    _timer?.cancel();
                    _timer = null;
                    _countSecond = 0;
                  });
                }
              },
              shape: const CircleBorder(),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom:
                      BorderSide(width: 0.5, color: context.theme.dividerColor),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _titleTextEditingController,
                      focusNode: _titleTextFocusNode,
                      maxLines: null,
                      cursorColor: context.colorScheme.onPrimary,
                      textInputAction: TextInputAction.done,
                      style: context.textTheme.titleLarge,
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          widget.todo.editTitle(value);
                        });
                      },
                    ),
                    if (widget.todo.description != null ||
                        (_titleTextFocusNode.hasFocus &&
                            _titleTextEditingController.text.isNotEmpty)) ...[
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: _subTitleTextEditingController,
                        focusNode: _subtitleTextFocusNode,
                        maxLines: null,
                        style: context.textTheme.bodyMedium,
                        cursorColor: context.colorScheme.onPrimary,
                        decoration: const InputDecoration(
                          hintText: 'Note',
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            widget.todo.editDescription(value);
                          });
                        },
                      ),
                    ]
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
