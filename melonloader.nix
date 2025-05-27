{ buildDotnetModule
, fetchFromGitHub
, lib
}:

buildDotnetModule rec {
  pname = "melonloader";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "HeyImKyu";
    repo = "MelonLoader";
    rev = "081d216bc97c8913409faab16df22b0e13b5a82a";
    sha256 = "sha256-9yIwnYAoRJyFeRfOjQ+6di9Z/iWHaPjMXPa6olj4r6s=";
  };

  projectFile = "MelonLoader/MelonLoader.csproj";

  meta = with lib; {
    homepage = "some_homepage";
    description = "some_description";
    license = licenses.mit;
  };
}

