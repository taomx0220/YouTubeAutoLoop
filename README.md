# YouTube Auto Loop 20.21.6

A tiny iOS tweak for the official YouTube app that automatically forces **single-video loop mode** on YouTube **20.21.6** (the iOS 15-era version).

## What it does

- Applies only when `CFBundleShortVersionString` is exactly `20.21.6`.
- Hooks `YTAutoplayAutonavController`.
- Sets `loopMode` to `2` when the controller initializes.
- Forces later loop-mode changes back to `2` so the video keeps looping.
- No UI, no network access, no account data access.

The implementation is based on the same YouTube class and loop-mode value used by the open-source **YouLoop** tweak. Current community projects list YouTube 20.21.6 as the tested iOS 15 target and include YouLoop for that version.

## Build with Theos

### Local

Install Theos and an iOS SDK, then:

```sh
make clean package FINALPACKAGE=1
```

The generated tweak can be found under `.theos/obj/` or as a package under `packages/`, depending on the Theos target.

### GitHub Actions

This repository includes `.github/workflows/build.yml`. Upload/fork the project to GitHub, then run the workflow. The workflow builds the tweak and uploads the resulting `.dylib` and `.deb` as artifacts.

## Injection

For TrollStore-based workflows, inject the resulting **dylib** into the official decrypted YouTube 20.21.6 app using your preferred tweak-injection tool (for example TrollFools). Keep a backup of the original app before injecting.

## Notes

This is intentionally a minimal tweak. If YouTube changes the relevant controller/class in a future app version, this version-specific build may stop working. It deliberately does nothing on versions other than 20.21.6.
