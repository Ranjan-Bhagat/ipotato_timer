import '../../features/ipotato_timer/pages/ipotato_timer_page.dart';

class IPotatoRoutes {

  ///This not allow to create instance of this class
  IPotatoRoutes._();

  //Routes names
  static const home = "/";

  ///All the routes will be defined hear
  static final routes = { home : (context) => const IPotatoTimerPage()};
}
