int main(string[] args) {
    Gtk.init(ref args);
    
    var header = new Gtk.HeaderBar();
    header.set_show_close_button(true);
    
    var window = new MainMenuWindow();  
    window.show_all();
    
    Gtk.main();
    
    return 0;
}
