{ stdenv, fetchurl, dpkg }:

stdenv.mkDerivation rec {
  name = "libbit4xpki-idemia";

  src = fetchurl {
    url = "https://swdownload1.agenziaentrate.gov.it/pub/sanita/libbit4xpki-idemia-amd64.1.4.10-622.deb";
    sha256 = "1mq6xng97d5s94h84p1clsnh56g245xcr1pbjm3ryjf43w7jlqlx";
  };

  unpackPhase = "dpkg-deb -x $src $out";

  meta = {
    description = "Libraries for the XPKI client used by the Italian CNS.";
    homepage = "https://swdownload1.agenziaentrate.gov.it";
    #license = stdenv.lib.licenses.unfree;
  };
    buildInputs = [ dpkg ];

  # set dpkg PATH
  shellHook = ''
    export PATH="${dpkg}/bin:$PATH"
  '';

}
