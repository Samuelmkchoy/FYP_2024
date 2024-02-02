// game.vala
class GameWindow : Gtk.Window {
    GameState game_state;

    construct(GameState game_state) {
        this.game_state = game_state;

        this.set_title("Bridges Game - Play");
        this.destroy.connect(Gtk.main_quit);
        this.set_default_size(400, 400);

        var drawing_area = new Gtk.DrawingArea();
        drawing_area.add_events(Gdk.EventMask.BUTTON_PRESS_MASK);
        drawing_area.button_press_event.connect(on_drawing_area_clicked);

        this.add(drawing_area);
    }

    bool on_drawing_area_clicked(Gdk.EventButton event) {
        int row = (int)(event.y / (this.get_allocated_height() / game_state.size));
        int col = (int)(event.x / (this.get_allocated_width() / game_state.size));

        add_bridge(row, col);

        this.queue_draw();

        if (is_solution_valid()) {
            stdout.printf("Congratulations!\n");
        }

        return true;
    }

    void add_bridge(int row, int col) {
        if (row >= 0 && row < game_state.size && col >= 0 && col < game_state.size) {
            game_state.grid[row][col].has_bridge = true;
        }
    }

    bool is_solution_valid() {
        return true;
    }

    override bool on_draw(Cairo.Context cr) {
        draw_game_grid(cr);
        return true;
    }

    void draw_game_grid(Cairo.Context cr) {
        // Background color
        cr.set_source_rgb(1, 1, 1);
        cr.paint();

        double cell_width = this.get_allocated_width() / game_state.size;
        double cell_height = this.get_allocated_height() / game_state.size;

        for (int i = 0; i < game_state.size; i++) {
            for (int j = 0; j < game_state.size; j++) {
                double x = j * cell_width;
                double y = i * cell_height;

                cr.arc(x + cell_width / 2, y + cell_height / 2, cell_width / 4, 0, 2 * Math.PI);
                cr.set_source_rgb(0, 0, 0);
                cr.fill_preserve();

                if (game_state.grid[i][j].has_bridge) {
                    cr.set_source_rgb(0, 0, 0);
                    cr.set_line_width(2.0);
                    cr.stroke();
                }
            }
        }
    }
}
