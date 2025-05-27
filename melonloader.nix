{ buildDotnetModule
, fetchFromGitHub
, lib
, dotnetCorePackages
}:

buildDotnetModule rec {
  pname = "melonloader";
  version = "0.0.1";

  dotnet-sdk = dotnetCorePackages.sdk_6_0;
  dotnet-runtime = dotnetCorePackages.runtime_6_0;

  src = fetchFromGitHub {
    owner = "HeyImKyu";
    repo = "MelonLoader";
    rev = "01c70cbb7c90b88fb1160e6dd1d0581f6c1417ea";
    sha256 = "sha256-9yIwnYAoRJyFeRfOjQ+6di9Z/iWHaPjMXPa6olj4r6s=";
  };

  projectFile = "MelonLoader/MelonLoader.csproj";

  meta = with lib; {
    homepage = "some_homepage";
    description = "some_description";
    license = licenses.mit;
  };
}

