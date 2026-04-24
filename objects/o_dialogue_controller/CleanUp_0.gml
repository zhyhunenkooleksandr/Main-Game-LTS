//Clean up
global.can_open_lockers = true;

if (instance_exists(creator)) {
    creator.alarm[0] = 300;
}