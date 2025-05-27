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
    rev = "b4f01dcd29fd7b8c3239756764056b91048c566b";
    sha256 = "sha256-9yIwnYAoRJyFeRfOjQ+6di9Z/iWHaPjMXPa6olj4r6s=";
  };

  projectFile = "MelonLoader/MelonLoader.csproj";

  meta = with lib; {
    homepage = "some_homepage";
    description = "some_description";
    license = licenses.mit;
  };
}

