{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  tuya-device-sharing-sdk,
  pytestCheckHook,
  syrupy,
}:

buildPythonPackage (finalAttrs: {
  pname = "tuya-device-handlers";
  version = "0.0.15";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "home-assistant-libs";
    repo = "tuya-device-handlers";
    tag = "v${finalAttrs.version}";
    hash = "sha256-3DUB/ucwvDE9yJPYJ5NdDWC8EVi0hVkHxpYh73wAaZk=";
  };

  build-system = [ poetry-core ];

  dependencies = [ tuya-device-sharing-sdk ];

  nativeCheckInputs = [
    pytestCheckHook
    syrupy
  ];

  pythonImportsCheck = [ "tuya_device_handlers" ];

  meta = {
    description = "Tuya quirks library";
    homepage = "https://github.com/home-assistant-libs/tuya-device-handlers";
    changelog = "https://github.com/home-assistant-libs/tuya-device-handlers/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.jamiemagee ];
  };
})
