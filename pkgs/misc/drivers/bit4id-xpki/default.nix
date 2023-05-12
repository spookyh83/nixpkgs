{ lib, stdenv, fetchurl, dpkg, pcsclite, opensc, pcsctools, ccid }:
stdenv.mkDerivation rec {
  name = "bit4xpki";
  src = fetchurl {
    url = "https://swdownload1.agenziaentrate.gov.it/pub/sanita/libbit4xpki-idemia-amd64.1.4.10-622.deb";
    sha256 = "1mq6xng97d5s94h84p1clsnh56g245xcr1pbjm3ryjf43w7jlqlx";
  };
  unpackPhase = "dpkg-deb -x $src $out";
  meta = with lib; {
    description = "Libraries for the XPKI client used by the Italian CNS.";
    homepage = "https://sistemats1.sanita.finanze.it/portale/elenco-driver-cittadini-modalita-accesso";
    platforms = [ "x86_64-linux" ];
    license = licenses.unfree;
  };
    buildInputs = [ dpkg ];
    shellHook = ''
    export PATH="${dpkg}/bin:$PATH"
  '';

}
