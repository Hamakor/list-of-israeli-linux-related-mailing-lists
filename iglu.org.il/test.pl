#!/usr/bin/perl

use strict;
use warnings;

use lib '.';

use Mail::LMLM ();

use Iglu::LMLM::Types::Ivrix      ();
use Iglu::LMLM::Types::Linuxology ();
use Iglu::LMLM::Types::Iglu       ();
use Iglu::LMLM::Types::Perl_IL    ();
use Iglu::LMLM::Types::Hamakor    ();

my $prefix = "Iglu::LMLM::Types::";

my %extra_mailing_list_classes = (
    ( map { $_ => $prefix . ucfirst($_) } (qw(ivrix linuxology iglu hamakor)) ),
    "perl-il" => $prefix . "Perl_IL",
);

my @lists = (
    {
        'id'          => 'gnubies-il',
        'class'       => 'egroups',
        'group_base'  => 'gnubies-il',
        'title'       => "GNUbies-IL",
        'description' => (
                  "Israeli Linux (or UNIX in general) beginners can "
                . "post their questions here. If you are a "
                . " Linux beginner please use this mailing-list instead of Linux-IL"
        ),
        'guidelines' => (
                  "Anything that is Linux or UNIX related (including "
                . " newbie questions"
        ),
    },
    {
        'id'          => 'linux-il',
        'class'       => 'listar',
        'group_base'  => 'linux-il',
        'hostname'    => 'cs.huji.ac.il',
        'description' => ("The main mailing-list for Linux users in Israel."),
        'homepage'    => "http://www.iglu.org.il/",
        'title'       => "Linux-IL",
        'online_archive' => sub {
            my $self = shift;
            my $r    = shift;

            $r->start_para();

            $r->text("Local (cs.huji.ac.il) Archives (new messages only): ");
            $r->url("http://mailman.cs.huji.ac.il/pipermail/linux-il/");
            $r->text("\n");
            $r->text("Hamakor Archive: ");
            $r->url("http://mirror.hamakor.org.il/archives/linux-il/");
            $r->text("\n");
            $r->text("Mail-archive: ");
            $r->url("http://www.mail-archive.com/linux-il\@cs.huji.ac.il/");
            $r->text("\n");
            $r->text("Gmane: ");
            $r->url("http://dir.gmane.org/gmane.linux.region.israel");
            $r->text("\n");
            $r->text("Plasma-Gate archive: (old messages only)");
            $r->url("http://plasma-gate.weizmann.ac.il/Linux/maillists/");
            $r->text("\n");

            $r->end_para();

        },
        'guidelines' => (
                  "Linux-related questions and discussions. No "
                . "newbie questions (use gnubies-il instead).\n" . "\n"
                . "Post size is limited to 16 kilobytes. Larger posts are queued for "
                . "moderator approval.\n" . "\n"
                . "If you are not subscribed the message that you send to the list will "
                . "require moderator approval and will not be sent to the members "
                . "automatically.\n"
        ),
    },
    {
        'id'          => 'linux-heb',
        'class'       => 'iglu',
        'group_base'  => 'linux-heb',
        'description' => ("Linux Discussions and Q&A in Hebrew."),
        'title'       => "The Hebrew Linux Mailing List",
        'guidelines' =>
            ("Linux discussions, primarily in the Hebrew Language."),
        'online_archive' => sub { },
    },
    {
        'id'          => 'haifa-linux-club',
        'class'       => 'ezmlm',
        'group_base'  => 'haifux',
        'hostname'    => "haifux.org",
        'homepage'    => "http://www.haifux.org/",
        'title'       => "Haifa Linux Club Mailing-list",
        'description' => sub {
            my $self = shift;
            my $r    = shift;

            $r->start_para();
            $r->text("Announcements of events organized by or related to the ");
            $r->url( "http://www.haifux.org/", "Haifa Linux Club" );
            $r->text(" (a.k.a Haifux).");

            $r->end_para();

            $r->para(
"General discussion of Linux-related issues and problems is also common and welcome."
            );
        },
        'guidelines' =>
            ( "Announcement and Q\&A regarding the " . "Haifa Linux Club." ),
        'online_archive' =>
            "http://www.mail-archive.com/lin-club\@vipe.technion.ac.il/",
    },
    {
        'id'          => "bar-ilan",
        'class'       => 'hamakor',
        'homepage'    => "http://www.cs.biu.ac.il/biux/",
        'title'       => "Bar-Ilan University Linux Activities",
        'group_base'  => "biux",
        'description' => (
                  "Mailing-list for announcing, coordinating and "
                . "discussing Linux-related activities in Bar-Ilan University"
        ),
        'guidelines'     => ("General Linux questions are welcome (?)"),
        'online_archive' => "http://mirror.hamakor.org.il/archives/biux/",
    },
    {
        'id'          => 'iglu-jlc',
        'class'       => 'iglu',
        'group_base'  => 'iglu-jlc',
        'description' => (
                  "The Jerusalem Linux Club's mailing list. "
                . "Subscribe to get announcements, coordination activity "
                . "and other discussions."
        ),
        'title'      => "The Jerusalem Linux Club Activities",
        'guidelines' => ("JLC Activity. General Linux questions are welcome."),
        'homepage'   => "http://www.jlc.org.il/",
        'online_archive' => sub {
            my $self = shift;
            my $r    = shift;

            $self->render_none($r);
        },
    },
    {
        'id'          => 'telaviv-linux-club',
        'class'       => 'hamakor',
        'group_base'  => 'telux',
        'description' => (
                  "The Tel-Aviv Linux Club's mailing list. "
                . "Subscribe to get announcements, coordination activity "
                . "and other discussions."
        ),
        'title'          => "The Tel Aviv Linux Club Discussion List",
        'guidelines'     => ("Telux Activity. Hebrew posts are accepted."),
        'homepage'       => "http://www.cs.tau.ac.il/telux/",
        'online_archive' => sub {
            my $self = shift;
            my $r    = shift;

            $self->render_none($r);
        },
    },
    {
        'id'          => 'linux-il-announce',
        'class'       => 'listar',
        'group_base'  => 'linux-il-announce',
        'hostname'    => 'linux.org.il',
        'description' => (
                  "Announcements for Linux users in Israel "
                . "(Linux-IL members are automatically subscribed)"
        ),
        'homepage'       => "http://www.iglu.org.il/",
        'title'          => "Linux-IL Announce",
        'online_archive' => sub {
            my $self = shift;
            my $r    = shift;

            $r->start_para();
            $r->text("Plasma-Gate archive: ");
            $r->url("http://plasma-gate.weizmann.ac.il/Linux/maillists/");
            $r->text("\n");
            $r->text("Mail-archive: ");
            $r->url(
                "http://www.mail-archive.com/linux-il-announce%40cs.huji.ac.il/"
            );
            $r->end_para();

        },
        'guidelines' => (
                  "This list is moderated and the moderator accepts "
                . "any Linux-related announcements. Note that one is "
                . "already subscribed to it if he is subscribed to Linux-IL"
        ),
    },
    {
        'id'          => 'debian-il',
        'class'       => 'ezmlm',
        'group_base'  => 'debian-il',
        'hostname'    => "debian.org.il",
        'homepage'    => "http://www.debian.org.il/",
        'title'       => "Debian-IL",
        'description' => (
                  "A group dedicated for users of the Debian Linux "
                . "distribution in Israel."
        ),
        'guidelines' => (
                  "Coordination of Debian activities in Israel. "
                . "Local Debian support and advocacy. Questions of "
                . "localization of Debian to Israel "
        ),
        'online_archive' =>
            "http://www.mail-archive.com/debian-il\@debian.org.il/",
    },
    {
        'id'          => 'bsd-il',
        'class'       => 'mailman',
        'hostname'    => "libagent.org",
        'title'       => "Israeli BSD List",
        'group_base'  => "bsd-il",
        'description' => (
                  "This is the Israeli mailing list for the "
                . "BSD-derived operating systems. Discussions regarding FreeBSD, "
                . "OpenBSD, NetBSD, etc. are welcome"
        ),
        'guidelines'      => "None.",
        'owner'           => [ "bsd-il-master", "libagent.org" ],
        'maintenance-url' => "http://www.libagent.org/mailman/listinfo/bsd-il/",
        'online_archive'  => "http://www.libagent.org/pipermail/bsd-il/",
    },
    {
        'id'          => 'hackers-il',
        'class'       => 'egroups',
        'title'       => "Hackers-IL",
        'group_base'  => 'hackers-il',
        'description' => (
                  "Hackers-IL is a mailing-list dedicated to general "
                . "discussion of computer-related topics by Israeli people."
        ),
        'guidelines' => (
                  "Computers or science related discussions, "
                . "questions, news, announcements, etc. If it's specifically "
                . "related to Linux, you should consider posting it to the "
                . "Linux-IL or gnubies-il mailing-lists instead."
        ),
    },
    {
        'id'          => 'iglu-web',
        'class'       => 'iglu',
        'title'       => "IGLU's Website Adminstration (IGLU-web)",
        'group_base'  => 'iglu-web',
        'description' => sub {
            my $self = shift;
            my $r    = shift;

            $r->start_para();
            $r->text("The administrative group of the ");
            $r->url( "http://www.iglu.org.il/", "Linux-IL website" );
            $r->text(" holds its discussion, announcements and reports here.");
            $r->end_para();
        },
        'guidelines' => (
                  "Whatever is related to the local Israeli"
                . "Linux-related web-sites, as maintained by Hamakor. "
                . "Other messages should be directed to the other "
                . "lists."
        ),
    },
    {
        'id'          => 'perl-il',
        'class'       => "perl-il",
        'title'       => "Israeli Perl Mongers List",
        'group_base'  => 'perl',
        'description' => (
                  "The Israeli Perl-Mongers list is dedicated to "
                . "questions, answers and discussions regarding the Perl "
                . "programming language."
        ),
        'guidelines' => ("Anything that is Perl-related is acceptable."),
    },
    {
        'id'         => 'perl-il-news',
        'class'      => "perl-il",
        'title'      => "Israeli Perl News & Announcements",
        'group_base' => 'news',
        'description' =>
            ("This is a mailing list for Israeli Perl News and Announcemnts."),
        'guidelines' => ("Perl News and Announcements."),
    },
    {
        'id'          => "python-il",
        'class'       => 'hamakor',
        'title'       => "Python-IL",
        'group_base'  => "python-il",
        'description' => (
                  "Discussions, questions and answers regarding the "
                . "Python programming language."
        ),
        'guidelines'     => ("Whatever is related to Python."),
        'online_archive' => sub {
            my $self = shift;
            my $r    = shift;

            $r->start_para();
            $r->text("Mail-Archive: ");
            $r->url("http://www.mail-archive.com/python%40linux.org.il/");
            $r->text("\n");
            $r->text("Gmane: ");
            $r->url("http://dir.gmane.org/gmane.comp.python.israel");
            $r->text("\n");
            $r->text("New Posts: ");
            $r->url("http://hamakor.org.il/pipermail/python-il/");
            $r->text("\n");
            $r->end_para();
        },
    },
    {
        'id'          => 'php-il',
        'class'       => 'mailman',
        'hostname'    => "php-israel.org",
        'title'       => "PHP Israel List",
        'group_base'  => "php-israel",
        'description' => ("Discussions and Questions about PHP."),
        'guidelines'  => (
                  "Messages can be written in English and Hebrew."
                . "Please trim quoted messages so the E-mails won't be too long.",
        ),
        'owner' => [ "php-israel-master", "php-israel.org" ],
        'maintenance-url' =>
            "http://php-israel.org/mailman/listinfo/php-israel_php-israel.org",
        'online_archive' =>
            "http://php-israel.org/pipermail/php-israel_php-israel.org/",
    },
    {
        'id'          => 'ruby-il',
        'class'       => 'google',
        'title'       => "Ruby-Israel Mailing List (Israel.rb)",
        'group_base'  => "israelrb",
        'description' => ("Discussions and Questions about Ruby in Israel."),
        'guidelines'  => (
                  "Messages can be written in English and Hebrew."
                . "Please trim quoted messages so the E-mails won't be too long.",
        ),
    },
    {
        'id'          => 'heb-bugzap',
        'class'       => 'hamakor',
        'hostname'    => "projects.hamakor.org.il",
        'group_base'  => 'heb-bugzap',
        'description' => (
                  "Discussing, reporting and solving bugs related "
                . "with Israeli/Hebrew internationalisation (i18n) - "
                . "Bidirectionality, Right-to-left, niqud, etc."
        ),
        'title' => "Hebrew Bug Zappers",
    },
    {
        'id'          => "ivrix-discuss",
        'class'       => 'ivrix',
        'group_base'  => "ivrix-discuss",
        'title'       => "Ivrix Discussions List",
        'description' => [
            "Discussions mailing list for the Ivrix Project.",

            "This is a higher-volume mailing list intended for "
                . "discussing ideas for Ivrix, Ivrix projects, or "
                . "anything related to Hebrew support for Unix. It is "
                . "recommended that every Ivrix member who intends to "
                . "actively participate in Ivrix development "
                . "(or follow it closely) should subscribe to this "
                . "mailing list. "
        ],
        'guidelines' =>
            ( "Whatever related to Ivrix or Hebrew support " . "under Linux." ),
    },
    {
        'id'          => "translation",
        'class'       => 'ivrix',
        'group_base'  => "translation",
        'title'       => "Translation List",
        'description' => (
                  "Mailing List dedicated to translation of technical or "
                . "semi-technical documents from English to Hebrew or Arabic."
        ),
        'guidelines' => (
                  "Whatever related to translation of documents."
                . " Posts partially in Hebrew are acceptable."
        ),
    },
    {
        'id'          => 'w3c',
        'class'       => 'hamakor',
        'hostname'    => "projects.hamakor.org.il",
        'group_base'  => 'w3c',
        'description' => (
                  "Mailing list for increasing the standards' "
                . "compatibility of Israeli web-sites and making sure they operate "
                . "correctly in Linux and cross-platform browsers."
        ),
        'title'      => "Israeli Web Standards Mailing List",
        'guidelines' => (
                  "Whatever related to supprting web standards in "
                . "Israeli sites."
        ),
        'online_archive' => "http://mirror.hamakor.org.il/archives/w3c/",
    },
    {
        'id'          => 'hamakor-discussions',
        'class'       => 'hamakor',
        'hostname'    => "hamakor.org.il",
        'group_base'  => 'discussions',
        'description' => (
                  "Mailing list for general discussion of "
                . "Hamakor-related topics."
        ),
        'title'      => "Hamakor Discussions",
        'guidelines' => (
                  "Hebrew is preferable. Don't flame, and don't "
                . "reply to messages that contain trolling. This mailing list "
                . "is dedicated to discussions of activities and advocacy. "
                . "Technical questions should be directed elsewhere."
        ),
        'online_archive' => sub {
            my $self = shift;
            my $r    = shift;

            $r->start_para();
            $r->text("Hamakor Archive: ");
            $r->url("http://mirror.hamakor.org.il/archives/discussions/");
            $r->text(" (old posts only)\n");
            $r->text("Mailman Archive: ");
            $r->url("http://hamakor.org.il/pipermail/discussions/");
            $r->text(" (new posts only)\n");
            $r->text("gadot.fdns.net Archive: ");
            $r->url("http://gadot.fdns.net/lurker/list/hamakor-disc.en.html");
            $r->text("\n");

            $r->end_para();

        },
    },
    {
        'id'          => 'hatzor',
        'class'       => 'hamakor',
        'hostname'    => "projects.hamakor.org.il",
        'group_base'  => 'hatzor',
        'description' => (
                  "Mailing list for discussing the Hatzor project "
                . "and integrating Linux in Israeli schools"
        ),
        'title'      => "\"Hatzor Mailing List\"",
        'guidelines' => ("Whatever related to Linux in education in Israel"),
    },
);

sub prolog
{
    my $self   = shift;
    my $main_r = shift;

    $main_r->para( "This is a list of the mailing-lists which are affiliated "
            . "with the Israeli Group of Linux Users (IGLU). It includes such "
            . "information as how to subscribe/unsubscribe, posting address, "
            . "posting guidelines, the address of the mailing-list owner, the "
            . "mailing-list's homepage and the online messages archive." );

    $main_r->start_para();
    $main_r->text( "If you have any comments, suggestions or additions "
            . "regarding the information contained here, don't hesitate to "
            . "contact the maintainer of these pages at the following e-mail: "
    );

    $main_r->email_address( "shlomif", "shlomifish.org" );

    $main_r->text(", or in ");

    $main_r->url( "http://www.shlomifish.org/me/contact-me/",
        "other ways of contacting them." );

    $main_r->end_para();
}

sub epilog
{
    my $self   = shift;
    my $main_r = shift;

    $main_r->horizontal_line();

    $main_r->start_section("Other Mailing Lists");

    $main_r->para(
              "There are other world-wide Linux-related mailing-lists which "
            . "you can join. Here are some useful links:" );

    $main_r->start_para();
    $main_r->url(
        "http://www.secretagent.com/general/mail.html",
        "A list of many Linux mailing lists"
    );

    $main_r->text("\n");

    $main_r->url( "http://www.croftj.net/~barreiro/lml.shtml",
        "Linux Mailing List Menu" );

    $main_r->end_para();

    $main_r->start_para();

    $main_r->url( "http://www.mail-archive.com/", "The Mail Archive" );

    $main_r->text(" - Archives many Linux-related lists.\n");

    $main_r->url( "http://www.yahoogroups.com/", "YahooGroups.com" );

    $main_r->text( " - archives and provides subscription information for many "
            . "Linux-related lists." );

    $main_r->end_para();

    $main_r->end_section();

    $main_r->horizontal_line();

    open VERSION_IN, "<../ver.txt";
    my $version = <VERSION_IN>;
    close(VERSION_IN);

    chomp($version);

    $main_r->start_para();
    $main_r->text("You can checkout ");
    $main_r->url(
"https://bitbucket.org/shlomif/list-of-israeli-linux-related-mailing-lists",
"the perl code that was used to generate these pages from its BitBucket repository."
    );
    $main_r->text(". It depends on the ");
    $main_r->url( "http://metacpan.org/release/Mail-LMLM",
        "the Mail::LMLM CPAN module" );
    $main_r->text(".");
    $main_r->end_para();
}

my $renderer = Mail::LMLM->new(
    'extra-classes' => \%extra_mailing_list_classes,
    title           => "List of Linux-related mailing-lists in Israel",
    headline        => "Linux-related mailing-lists in Israel",
    lists           => \@lists,
    prolog          => \&prolog,
    epilog          => \&epilog,
);

my $dir = "./mailing-lists/";
mkdir($dir);
chdir($dir);

$renderer->render();

# Remove trailing whitespace.
system( $^X, "-lp", "-i", '-e', 's/\s+$//', glob("*.html") );
