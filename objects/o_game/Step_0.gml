// Escape key rm1
if (room == rm1) {
    if (keyboard_check_pressed(vk_escape)) {
        if (!instance_exists(o_pause)) {
            instance_create_depth(0, 0, -9999, o_pause);
        }
    }
}