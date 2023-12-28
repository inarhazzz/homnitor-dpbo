namespace GtkApp {
    public class Application : Gtk.Application {
        public Application () {
            Object (application_id: "org.gtk.ver1", flags: ApplicationFlags.FLAGS_NONE);
        }

        construct {
            ActionEntry[] action_entries = {
                { "about", this.on_about_action },
                { "preferences", this.on_preferences_action },
                { "quit", this.quit }
            };
            this.add_action_entries (action_entries, this);
            this.set_accels_for_action ("app.quit", {"<primary>q"});
        }

        public override void activate () {
            base.activate ();
            var win = this.active_window;
            if (win == null) {
                win = new GtkApp.Window (this);
                Ref.referenceWindow=(GtkApp.Window)win;
            }
            win.present ();
        }

        private void on_about_action () {
            string[] authors = { "Cahya Maharani Putri", "Viola Gustira Ayu", "Annisa Zahrani" };
            Gtk.show_about_dialog (this.active_window,
                                   "program-name", "Homnitor",
                                   "authors", authors,
                                   "version", "0.1.0");
        }

        private void on_preferences_action () {
            message ("app.preferences action activated");
        }
    }
}
