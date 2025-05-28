{ buildDotnetModule
, fetchFromGitHub
, lib
, pkgs
}:

let
  importNugetDeps = import ./nuget-deps.nix;
in

buildDotnetModule rec {
  pname = "melonloader";
  version = "0.0.1";

  dotnet-sdk = pkgs.dotnet-sdk_9;
  dotnet-runtime = pkgs.dotnet-runtime_6;

  src = fetchFromGitHub {
    owner = "HeyImKyu";
    repo = "MelonLoader";
    rev = "aa5794baa1103bc98f13e2b70250750ec2524200";
    sha256 = "sha256-TFVsHrw4MlHH1qqGI6GlZE2ZOnunvzZrSTPKIZUWi6E=";
  };

  projectFile = "MelonLoader.Bootstrap/MelonLoader.Bootstrap.csproj";
  nugetConfig = ./NuGet.config;
  nugetDeps = ./nix-deps.json;

  postPatch = ''
    echo "Bootstrap dir contents:"
    ls -R MelonLoader.Bootstrap
    echo "MelonLoader dir contents:"
    ls -R MelonLoader
  '';

  meta = with lib; {
    homepage = "some_homepage";
    description = "some_description";
    license = licenses.mit;
  };
}

