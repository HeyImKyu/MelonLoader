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
    rev = "6f453afbabce102230beb5a4b99a07fba004d118";
    sha256 = "sha256-sun5QaBFG9BedgBRGl61pjGwZrREhmceLQwDe01ziz8=";
  };

  projectFile = "MelonLoader/MelonLoader.csproj";
  nugetConfig = "NuGet.config";

  meta = with lib; {
    homepage = "some_homepage";
    description = "some_description";
    license = licenses.mit;
  };
}

