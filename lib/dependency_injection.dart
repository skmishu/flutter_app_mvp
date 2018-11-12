enum Flavor { PROC, MOC };

class Injectior {

  // ignore: undefined_method
  static final Injectior _singleton = new Injectior()._internal();
  static Flavor _flavor;

  static void Configure(Flavor flavor) {
    _flavor = flavor;
  }

  // ignore: invalid_factory_name_not_a_class
  factory Injector(){
    return _singleton;
  }

  Injectior._internal();

}