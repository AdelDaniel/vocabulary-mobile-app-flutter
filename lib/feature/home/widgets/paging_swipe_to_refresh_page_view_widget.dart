import 'package:flutter/material.dart';

class PagingSwipeToRefreshPageViewWidget extends StatelessWidget {
  final Widget Function(int index) _itemWidget;
  final Function? _swipedToRefresh;
  final bool _isPagingEnabled;
  final PageController? _controller;
  final Key _pageViewKey;

  const PagingSwipeToRefreshPageViewWidget({
    super.key,
    required Key pageViewKey,
    required Widget Function(int index) itemWidget,
    Function? swipedToRefresh,
    bool isPagingEnabled = true,
    PageController? controller,
  })  : _itemWidget = itemWidget,
        _swipedToRefresh = swipedToRefresh,
        _isPagingEnabled = isPagingEnabled,
        _controller = controller,
        _pageViewKey = pageViewKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: PageView.builder(
              key: PageStorageKey(_pageViewKey),
              controller: _controller,
              physics: _isPagingEnabled
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, int index) {
                return _itemWidget(index);
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _refresh() async {
    if (_swipedToRefresh == null) return;
    await Future.microtask(() => _swipedToRefresh());
  }
}
