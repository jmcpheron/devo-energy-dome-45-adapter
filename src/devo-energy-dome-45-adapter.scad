/*
   Devo Energy Dome 45 Record Adapter
   This script creates a 3D printed record adapter inspired by the iconic Devo Energy Dome hat.
   - Base diameter: 38 mm (to match the 45 adapter size)
   - Stepped dome: built with 4 cylinders that shrink by 4 mm per step
   - Central hole: about 7.5 mm diameter for the turntable post
*/

// Set the resolution for smoother circles
$fn = 300;

// Parameters
base_diameter = 38;      // mm: diameter of the adapter's base
post_diameter = 7.5;     // mm: diameter of the turntable post hole
step_count = 4;          // Number of steps (layers)
total_height = 18;       // Total height of the adapter (mm)
reduction_per_step = 6;  // Reduction in diameter per step (mm)

step_height = total_height / step_count;

// Module to create the stepped dome (hat shape)
module devo_hat() {
  union() {
    for (i = [0 : step_count - 1]) {
      // Each step shrinks the diameter by reduction_per_step
      step_diameter = base_diameter - i * reduction_per_step;
      translate([0, 0, i * step_height])
        cylinder(d = step_diameter, h = step_height);
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
