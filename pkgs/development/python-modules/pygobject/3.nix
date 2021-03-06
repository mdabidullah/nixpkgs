{ stdenv, fetchurl, mkPythonDerivation, python, pkgconfig, glib, gobjectIntrospection, pycairo, cairo, which, ncurses}:

mkPythonDerivation rec {
  major = "3.22";
  minor = "0";
  name = "pygobject-${major}.${minor}";

  src = fetchurl {
    url = "mirror://gnome/sources/pygobject/${major}/${name}.tar.xz";
    sha256 = "08b29cfb08efc80f7a8630a2734dec65a99c1b59f1e5771c671d2e4ed8a5cbe7";
  };

  buildInputs = [ pkgconfig glib gobjectIntrospection ]
                 ++ stdenv.lib.optionals stdenv.isDarwin [ which ncurses ];
  propagatedBuildInputs = [ pycairo cairo ];

  meta = {
    homepage = http://live.gnome.org/PyGObject;
    description = "Python bindings for Glib";
    platforms = stdenv.lib.platforms.unix;
  };
}
