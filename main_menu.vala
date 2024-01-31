class MainMenuWindow : Gtk.Window {    
    construct{
	this.set_title ("Briges Puzzle Game");
    this.destroy.connect(Gtk.main_quit);
    this.set_default_size(350,70);
    this.border_width = 10;
    this.window_position = Gtk.WindowPosition.CENTER;
    
    // Make a Box to hold the button
    var box = new Gtk.Box(Gtk.Orientation.VERTICAL, 5);
    
    // Button 1
    var button1 = new Gtk.Button.with_label("Play");
    button1.clicked.connect(() => {
		var gameWindow = new GameWindow();
		gameWindow.show_all();
		this.hide();
		//stdout.printf("Play clicked!\n");
	});
	
	// Button 2
    var button2 = new Gtk.Button.with_label("Leaderboard");
    button2.clicked.connect(() => {
		stdout.printf("Leaderboard clicked!\n");
	});
		
    // Button 3
    var button3 = new Gtk.Button.with_label("Exit");
    button3.clicked.connect(Gtk.main_quit);
	
	//add buttons to the box
	box.pack_start(button1, true, true, 0);
	box.pack_start(button2, true, true, 0);
	box.pack_start(button3, true, true, 0);
	
    this.add(box);
	}
}
