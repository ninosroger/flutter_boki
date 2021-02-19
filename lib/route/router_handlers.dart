import 'package:fish_redux/fish_redux.dart';
import 'package:fluro/fluro.dart';

import '../global_store/global_store.dart';

Handler getPageHandler(Page<Object, dynamic> page) {
  return Handler(
    handlerFunc: (context, parameters) {
      if (page.isTypeof<GlobalBaseState>()) {
        /// 建立 AppStore 驱动 PageStore 的单向数据连接
        /// 1. 参数1 AppStore
        /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
        page.connectExtraStore<GlobalState>(
          GlobalStore.store,
          (Object pageState, GlobalState appState) {
            final GlobalBaseState gbs = pageState;
            if (gbs.themeColors != appState.themeColors) {
              if (pageState is Cloneable) {
                final Object copy = pageState.clone();
                final GlobalBaseState newState = copy;
                newState.themeColors = appState.themeColors;
                return newState;
              }
            }
            return pageState;
          },
        );
      }
      return page.buildPage(parameters);
    },
  );
}
