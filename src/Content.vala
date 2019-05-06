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

public class ContentStack : Gtk.Stack {
    private struct Content {
        string title;
        string result;
    }

    static Content[] content = {
        Content () {
            title = _("To be successful, you don’t need a degree. Successful is he who knows to lose and still have a loving family and friends."),
            result = "motivational"
        },
        Content () {
            title = _("Your actions will take you to the top notch of success. Just keep working on your goals. It will create the path to success."),
            result = "motivational"
        },
        Content () {
            title = _("Life will become much easier, when we will finally understand which hands to shake & which ones to Hold."),
            result = "motivational"
        },
        Content () {
            title = _("Failing is the first step to the path of success. It means you are trying in every way to achieve it in your life."),
            result = "motivational"
        },
        Content () {
            title = _("The secrete to success is constancy. Stick to your purpose and work hard. Otherwise, success is just a dream."),
            result = "motivational"
        },
        Content () {
            title = _("Don’t waste your time looking back on what you’ve lost. Move on, for life is not meant to be traveled backwards."),
            result = "motivational"
        },
        Content () {
            title = _("Happiness of life lies within yourself. As long as you feel you are content, you are happy."),
            result = "motivational"
        },
        Content () {
            title = _("Another term of sharing is happiness. The more you start sharing, the more you are happy in life."),
            result = "motivational"
        },
        Content () {
            title = _("Don’t dwell in past. Don’t daydream of future. Now is the time. Now is the life to enjoy. Live a happy and healthy life."),
            result = "motivational"
        },
        Content () {
            title = _("Without struggle, you wouldn’t have known what life is. Struggle makes a person know what real life is."),
            result = "motivational"
        },
        Content () {
            title = _("The first step toward success is taken when you refuse to be a captive of the environment in which you first find yourself."),
            result = "quote"
        },
        Content () {
            title = _("Twenty years from now you will be more disappointed by the things that you didn’t do than by the ones you did do."),
            result = "quote"
        },
        Content () {
            title = _("I’m a success today because I had a friend who believed in me and I didn’t have the heart to let him down."),
            result = "quote"
        },
        Content () {
            title = _("Love yourself first and everything else falls into line. You really have to love yourself to get anything done in this world."),
            result = "quote"
        },
        Content () {
            title = _("Challenges are what make life interesting and overcoming them is what makes life meaningful."),
            result = "quote"
        },
        Content () {
            title = _("I am very grateful to God. He has sent the most beautiful and amazing person in my life. My dear, you are a blessing from God."),
            result = "message"
        },
        Content () {
            title = _("I am blessed to have so many great things in my life - family, friends and God. All will be in my thoughts daily."),
            result = "message"
        },
        Content () {
            title = _("God gave us the gift of life; it is up to us to give ourselves the gift of living well."),
            result = "message"
        },
        Content () {
            title = _("Let go of yesterday. Let today be a new beginning and be the best that you can, and you'll get to where God wants you to be."),
            result = "message"
        },
        Content () {
            title = _("God writes the Gospel not in the Bible alone, but also on trees, and in the flowers and clouds and stars."),
            result = "message"
        }
    };

    public ContentStack () {
        Object (
            margin: 24,
            margin_bottom: 24,
            transition_type: Gtk.StackTransitionType.CROSSFADE
        );
    }

    construct {
        int i = 1;
        foreach (var Phrases in content) {
            var label = new Gtk.Label (Phrases.title);
            label.max_width_chars = 20;
            label.wrap = true;
            label.get_style_context ().add_class ("Phrases");
            label.get_style_context ().add_class (Phrases.result);

            var grid = new Gtk.Grid ();
            grid.column_spacing = grid.row_spacing = 8;
            grid.halign = Gtk.Align.CENTER;

            grid.attach (label, 0, 0);

            add_named (grid, i.to_string ());

            i++;
        }

        var rand = Random.int_range (1, 21);
        visible_child_name = rand.to_string ();
    }
}
