{ buildDotnetModule
, fetchFromGitHub
, lib
, dotnetCorePackages
, pkgs
}:

buildDotnetModule rec {
  pname = "melonloader";
  version = "0.0.1";

  dotnet-sdk = dotnetCorePackages.sdk_6_0;
  dotnet-runtime = pkgs.dotnet-runtime_6;

  src = fetchFromGitHub {
    owner = "HeyImKyu";
    repo = "MelonLoader";
    rev = "master";
    sha256 = "sha256-9yIwnYAoRJyFeRfOjQ+6di9Z/iWHaPjMXPa6olj4r6s=";
  };

  projectFile = "MelonLoader/MelonLoader.csproj";

  meta = with lib; {
    homepage = "some_homepage";
    description = "some_description";
    license = licenses.mit;
  };
}

