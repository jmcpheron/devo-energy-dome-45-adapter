/*
   Devo Energy Dome - Full Size Helmet (Fixed with Proper Connections)
   This creates horizontal connecting surfaces between each stepped segment
*/

$fn = 300; // Smoothness

// Parameters
inner_diameter = 200;      // mm: inner diameter of the helmet
shell_thickness = 2.5;     // mm: wall thickness
step_count = 4;            // Number of steps (layers)
total_height = 110;        // mm: total height of the helmet
taper_factor = 0.92;       // How much each step tapers inward
reduction_per_step = 24;   // mm: reduction in diameter per step

step_height = total_height / step_count;
outer_diameter = inner_diameter + 2 * shell_thickness;

// Module for creating a horizontal shelf/ring
module horizontal_shelf(outer_d, inner_d, height, z_pos) {
    translate([0, 0, z_pos])
        difference() {
            cylinder(d = outer_d, h = height);
            cylinder(d = inner_d, h = height + 0.1);
        }
}

// Module for the complete helmet with proper connections
module devo_helmet_complete() {
    union() {
        // Create all the tapered segments
        for (i = [0 : step_count - 1]) {
            bottom_outer = outer_diameter - i * reduction_per_step;
            top_outer = bottom_outer * taper_factor;
            bottom_inner = inner_diameter - i * reduction_per_step;
            top_inner = bottom_inner * taper_factor;
            
            z = i * step_height;
            
            // Main tapered segment
            difference() {
                translate([0, 0, z])
                    cylinder(d1 = bottom_outer, d2 = top_outer, h = step_height);
                translate([0, 0, z - 0.05])
                    cylinder(d1 = bottom_inner, d2 = top_inner, h = step_height + 0.1);
            }
        }
        
        // Create horizontal connecting shelves between segments
        for (i = [1 : step_count - 1]) {
            // Get dimensions of the segment below
            prev_bottom_outer = outer_diameter - (i-1) * reduction_per_step;
            prev_top_outer = prev_bottom_outer * taper_factor;
            prev_bottom_inner = inner_diameter - (i-1) * reduction_per_step;
            prev_top_inner = prev_bottom_inner * taper_factor;
            
            // Get dimensions of current segment
            curr_bottom_outer = outer_diameter - i * reduction_per_step;
            curr_bottom_inner = inner_diameter - i * reduction_per_step;
            
            z = i * step_height;
            
            // Create the horizontal shelf connecting the two segments
            // The shelf extends from the inner edge to the outer edge
            horizontal_shelf(prev_top_outer, curr_bottom_inner, shell_thickness, z - shell_thickness);
        }
        
        // Add the top cap to close the opening
        final_step = step_count - 1;
        final_bottom_outer = outer_diameter - final_step * reduction_per_step;
        final_top_outer = final_bottom_outer * taper_factor;
        final_bottom_inner = inner_diameter - final_step * reduction_per_step;
        final_top_inner = final_bottom_inner * taper_factor;
        
        // Solid top cap (no hole in the middle)
        translate([0, 0, total_height])
            cylinder(d = final_top_outer, h = shell_thickness);
    }
}

// Render the complete helmet
devo_helmet_complete();