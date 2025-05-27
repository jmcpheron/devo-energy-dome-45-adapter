/*
   Devo Energy Dome 45 Record Adapter
   This script creates a 3D printed record adapter inspired by the iconic Devo Energy Dome hat.
   - Base diameter: 38 mm (to match the 45 adapter size)
   - Stepped dome: built with 4 tapered cylinders that shrink and slant inward
   - Central hole: about 7.5 mm diameter for the turntable post
   
   Auto-compilation: STL files are automatically generated via GitHub Actions
*/

// Set the resolution for smoother circles
$fn = 300;

// Parameters
base_diameter = 38;      // mm: diameter of the adapter's base
post_diameter = 7.5;     // mm: diameter of the turntable post hole
step_count = 4;          // Number of steps (layers)
total_height = 18;       // Total height of the adapter (mm)
reduction_per_step = 6;  // Reduction in diameter per step (mm)
taper_factor = 0.8;      // How much each step tapers inward (0.8 = 20% taper)

step_height = total_height / step_count;

// Module to create the stepped dome (hat shape) with inward slant
module devo_hat() {
  union() {
    for (i = [0 : step_count - 1]) {
      // Each step shrinks the diameter by reduction_per_step
      bottom_diameter = base_diameter - i * reduction_per_step;
      top_diameter = bottom_diameter * taper_factor;
      
      translate([0, 0, i * step_height])
        cylinder(d1 = bottom_diameter, d2 = top_diameter, h = step_height);
    }
  }
}

// Create the adapter and subtract the central post hole
difference() {
  devo_hat();
  // Subtract the post hole (and subtract 2mm so there is not a hole in the top)
  translate([0, 0, -1])
    cylinder(d = post_diameter, h = total_height - 2);
}
