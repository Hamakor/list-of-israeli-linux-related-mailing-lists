package Iglu::LMLM::Types::Hamakor;

use strict;

use Mail::LMLM::Types::Mailman;

use vars qw(@ISA);

@ISA=qw(Mail::LMLM::Types::Mailman);

sub get_default_hostname
{
    my $self = shift;

    return "hamakor.org.il";
}

sub get_maintenance_url
{
    my $self = shift;

    return "http://hamakor.org.il/cgi-bin/mailman/listinfo/" . $self->get_group_base();
}

1;
