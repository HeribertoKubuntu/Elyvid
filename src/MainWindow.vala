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

public class MainWindow : Gtk.Window {
    private ContentStack stack;

    public MainWindow (Gtk.Application application) {
        Object (
            application: application,
            icon_name: "com.github.heribertokubuntu.elyvid",
            resizable: false,
            title: _("Elyvid Phrases"),
            window_position: Gtk.WindowPosition.CENTER
        );
    }

    construct {
        var header = new Gtk.HeaderBar ();
        header.show_close_button = true;
        var header_context = header.get_style_context ();
        header_context.add_class ("titlebar");
        header_context.add_class ("default-decoration");
        header_context.add_class (Gtk.STYLE_CLASS_FLAT);

        var randomize_button = new Gtk.Button.from_icon_name ("media-playlist-shuffle-symbolic");
        randomize_button.tooltip_text = _("Go Next Phrase");

        var gtk_settings = Gtk.Settings.get_default ();

        stack = new ContentStack ();

        var context = get_style_context ();
        context.add_class ("elyvid");
        context.add_class ("rounded");
        context.add_class ("flat");

        randomize_button.clicked.connect (() => randomize_Phrases (stack) );

        header.pack_end (randomize_button);

        set_titlebar (header);
        add (stack);

        stack.realize.connect (() => {
           randomize_Phrases (stack, true);
        });
    }

    private void randomize_Phrases (
        ContentStack stack,
        bool allow_current = false
    ) {
        int rand = Random.int_range (1, 21);
        int current = int.parse (stack.visible_child_name);

        if (allow_current || rand != current) {
            stack.visible_child_name = rand.to_string ();
            return;
        }

        randomize_Phrases (stack);
    }

    public override bool configure_event (Gdk.EventConfigure event) {
        int root_x, root_y;
        get_position (out root_x, out root_y);
        Elyvid.settings.set_int ("window-x", root_x);
        Elyvid.settings.set_int ("window-y", root_y);

        return base.configure_event (event);
    }
}
