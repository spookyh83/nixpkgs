{ lib
, stdenv
, fetchFromGitHub
, makeWrapper
, curl
, whois
, bind
, mtr
, jq
, ipcalc
, grepcidr
, nmap
, aha
}:

stdenv.mkDerivation rec {
  pname = "asn";
  version = "0.73.3";

  src = fetchFromGitHub {
    owner = "nitefood";
    repo = "asn";
    rev = "v${version}";
    sha256 = "sha256-O0Iu+7UAAf+v0gZdGTdBpdn9BZ/9OqTAA/u0WDiz9s8=";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    install -Dv asn "$out/bin/asn"

    wrapProgram $out/bin/asn \
      --prefix PATH : "${lib.makeBinPath [ curl whois bind mtr jq ipcalc grepcidr nmap aha ]}"
  '';

  meta = {
    description = "OSINT command line tool for investigating network data";
    longDescription = ''
      ASN / RPKI validity / BGP stats / IPv4v6 / Prefix / URL / ASPath / Organization /
      IP reputation / IP geolocation / IP fingerprinting / Network recon /
      lookup API server / Web traceroute server
    '';
    homepage = "https://github.com/nitefood/asn";
    license = with lib.licenses; [ mit ];
    maintainers = with lib.maintainers; [ devhell ];
  };
}
