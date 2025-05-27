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
    rev = "6c320b45d43e7a78a9c89be27fb705dc872b531d";
    sha256 = "sha256-Y6UUWjpFEoQmQ9gmM93mIqQNhNb5IO+JhipFGTj4E6A=";
  };

  projectFile = "MelonLoader.Bootstrap/MelonLoader.Bootstrap.csproj";
  nugetConfig = ./NuGet.config;

  meta = with lib; {
    homepage = "some_homepage";
    description = "some_description";
    license = licenses.mit;
  };
}

