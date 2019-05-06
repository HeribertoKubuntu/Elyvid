/*
* Copyright (c) 2019 Heriberto Delgado Garcia (https://heriberto.updog.co/template/elyvid/elyvid/elyvid.html)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 3 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Heriberto Delgado Garcia <heriberto_delgado@protonmail.com>
*/

public class Elyvid : Gtk.Application {
    public static GLib.Settings settings;

    public Elyvid () {
        Object (application_id: "com.github.heribertokubuntu.elyvid",
        flags: ApplicationFlags.FLAGS_NONE);
    }

    static construct {
        settings = new Settings ("com.github.heribertokubuntu.elyvid");
    }

    protected override void activate () {
        if (get_windows ().length () > 0) {
            get_windows ().data.present ();
            return;
        }

        var main_window = new MainWindow (this);

        var window_x = settings.get_int ("window-x");
        var window_y = settings.get_int ("window-y");

        if (window_x != -1 ||  window_y != -1) {
            main_window.move (window_x, window_y);
        }

        main_window.show_all ();

        var quit_action = new SimpleAction ("quit", null);

        add_action (quit_action);
        set_accels_for_action ("app.quit", {"Escape"});

        var provider = new Gtk.CssProvider ();
        provider.load_from_resource ("/com/github/heribertokubuntu/elyvid/Application.css");
        Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);

        quit_action.activate.connect (() => {
            if (main_window != null) {
                main_window.destroy ();
            }
        });
    }

    private static int main (string[] args) {
        Gtk.init (ref args);

        var app = new Elyvid ();
        return app.run (args);
    }
}

