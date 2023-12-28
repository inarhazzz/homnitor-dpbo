namespace GtkApp {
    [GtkTemplate (ui = "/org/gtk/ver1/window.ui")]
    public class Window : Gtk.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.HeaderBar header_bar;
        [GtkChild]
        private unowned Gtk.Button tambah;
        [GtkChild]
        private unowned Gtk.Box boxx;

        public Window (Gtk.Application app) {
            Object (application: app);
            tambah.clicked.connect (()=>{
                var data = new Data(app);
                data.present ();
            });
            var input = File.new_for_path ("/mnt/c/Users/Annisa/OneDrive/Documents/Kuliah/Vala/Homnitor/homnitor/src/setor.txt");
            var connect = input.read();
            var scanner = new DataInputStream(connect);
            string content = "";
    
            while (true) {
                string? line = scanner.read_line(null);
                if (line == null) {
                    break;
                }
                content += line + "\n";
            }
            var label = new Gtk.Label (content);
            label.add_css_class ("info");
            boxx.append(label);

             var css_provider = new Gtk.CssProvider ();
             string path = "/mnt/c/Users/Annisa/OneDrive/Documents/Kuliah/Vala/Homnitor/homnitor/src/style.css";
             css_provider.load_from_path (path);
             Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
            
        }
    }
}
