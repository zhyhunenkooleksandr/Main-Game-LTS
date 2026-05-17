controls = [
    ["Interaction", "E"],
    ["Walking",     "WASD"],
    ["Attacking",   "A"],
    ["Defence",     "D"]
];

back_hovered = false;
slider_dragging = false;
volume = 1.0; 
slider_width = 200;
slider_x = room_width / 2;

//THE DYNAMIC CASCADING LAYOUT
header_y         = room_height * 0.12;
controls_start_y = room_height * 0.26;
controls_gap     = 60;


slider_y         = controls_start_y + (array_length(controls) * controls_gap) + 50;

back_btn_y       = slider_y + 90;