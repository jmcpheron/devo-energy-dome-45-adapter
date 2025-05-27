# Are You Not Into 45s? You Are DEVO! 🎵

![Devo Energy Dome Adapter](images/cover.jpg)

When a problem comes along, you must print it! This 3D printable 45 RPM record adapter is inspired by Devo's iconic red "Energy Dome" hats. Now your turntable can be as stylish as Mark Mothersbaugh himself!

## Whip It Into Shape (Quick Start)

1. Download `models/output.stl` or any STL file from the `models` directory
2. Print it good! (PLA or PETG recommended, 0.16mm layer height)
3. Freedom of choice - place it on your turntable spindle to play those sweet 45 RPM singles

## Automated De-Evolution 🤖

This project features **automated STL generation** via GitHub Actions:
- When OpenSCAD source files (`.scad`) are modified, fresh STL files are automatically compiled
- Generated `models/output.stl` is committed back to the repository 
- No need to manually run OpenSCAD - the workflow handles it all!

## Through Being Cool (Repository Contents)

- `src/` - OpenSCAD source file with parametric design (for when you want to get satisfaction)
- `models/` - Auto-generated ready-to-print 3D model files (STL, 3MF)
- `images/` - Beautiful mutants (photos and video of the adapter)
- `docs/` - For when you need to read the directions... RTFM!
- `.github/workflows/` - Automated compilation pipeline

For complete documentation that will crack that whip, see [docs/README.md](docs/README.md)

## Design Features

- **Stepped dome design** with 4 tapered layers that shrink and slant inward
- **38mm base diameter** - perfect fit for 45 RPM records
- **7.5mm center hole** - compatible with standard turntable spindles
- **High-resolution curves** ($fn = 300) for smooth surfaces
- **Parametric design** - easily customizable via OpenSCAD variables

## See It Spin! 🎵

https://github.com/jmcpheron/devo-energy-dome-45-adapter/raw/main/images/action-shot.mp4

## License

This project is released under the [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/). Share it freely, that's our duty!

## Credits

De-evolved by Jason J. McPheron ([@jmcpheron](https://github.com/jmcpheron))

---

*Are we not makers? We are DEVO!* 

> Q: Are we not 3D prints?  
> A: We are DEVO! 