namespace GtkApp {
    [GtkTemplate (ui = "/org/gtk/ver1/data.ui")]
    public class Data : Gtk.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.HeaderBar header_bar;
        [GtkChild]
        private unowned Gtk.Entry hari;
        [GtkChild]
        private unowned Gtk.Entry bulan;
        [GtkChild]
        private unowned Gtk.Entry tahun;
        [GtkChild]
        private unowned Gtk.Entry iuran;
        [GtkChild]
        private unowned Gtk.Entry jml;
        [GtkChild]
        private unowned Gtk.Button submit;

        public Data (Gtk.Application app) {
            Object (application: app);
            submit.clicked.connect (()=>{
                var input = File.new_for_path ("/mnt/c/Users/Annisa/OneDrive/Documents/Kuliah/Vala/Homnitor/homnitor/src/setor.txt");
                var connect = input.append_to(FileCreateFlags.NONE);
                var all = hari.text + "\n";
                all += bulan.text + " " + tahun.text + "\n";
                all += "Iuran: Rp"+iuran.text + "\n";
                all += "Jumlah kWh: "+jml.text + " kWh\n\n";
                connect.write(all.data);
                connect.close();
                Ref.referenceWindow.destroy();
                print("1\n");
                var win = new GtkApp.Window (app);
                print("2\n");
                Ref.referenceWindow=win;
                print("3\n");
                win.present ();
                print("4\n");
                this.destroy();
                
            });

             var css_provider = new Gtk.CssProvider ();
             string path = "/mnt/c/Users/Annisa/OneDrive/Documents/Kuliah/Vala/Homnitor/homnitor/src/data.css";
             css_provider.load_from_path (path);
             Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
        }
    }
}