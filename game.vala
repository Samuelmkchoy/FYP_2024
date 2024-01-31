class GameWindow : Gtk.Window {
	construct {
		this.set_title("Bridges Puzzle Game - Play");
		this.destroy.connect(Gtk.main_quit);
		this.set_default_size(800,600);
	}
}
