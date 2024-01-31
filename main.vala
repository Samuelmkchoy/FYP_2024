int main(string[] args) {
    Gtk.init(ref args);
    
    var header = new Gtk.HeaderBar();
    header.set_show_close_button(true);
    
    var window = new Gtk.Window();
    window.set_title ("Briges Game");
    window.destroy.connect(Gtk.main_quit);
    window.set_default_size(350,70);
    window.border_width = 10;
    window.window_position = Gtk.WindowPosition.CENTER;
    
    // Make a Box to hold the button
    var box = new Gtk.Box(Gtk.Orientation.VERTICAL, 5);
    
    // Button 1
    var button1 = new Gtk.Button.with_label("Play");
    button1.clicked.connect(() => {
		stdout.printf("Play clicked!\n");
	});
	
	// Button 2
    var button2 = new Gtk.Button.with_label("Leaderboard");
    button2.clicked.connect(() => {
		stdout.printf("Leaderboard clicked!\n");
	});
		
    // Button 3
    var button3 = new Gtk.Button.with_label("Exit");
    button3.clicked.connect(() => {
		stdout.printf("Exit clicked!\n");
	});
	
	//add buttons to the box
	box.pack_start(button1, true, true, 0);
	box.pack_start(button2, true, true, 0);
	box.pack_start(button3, true, true, 0);
	
    window.add(box);
    
    window.show_all();
    
    Gtk.main();
    
    return 0;
}
