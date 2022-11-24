import '../../features/ipotato_timer/pages/ipotato_timer_page.dart';

class IPotatoRoutes {

  ///This not allow to create instance of this class
  IPotatoRoutes._();


  ///All the routes will be defined hear
  static final routes = {"/": (context) => const IPotatoTimerPage()};
}
