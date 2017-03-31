use strict;
use warnings;
use experimental 'smartmatch';

use Data::Dumper;
use JSON;

my @web = qw/google haruko facebook twitter independent/;

my $profile =
'{
    "name": "Alan",
    "email": {
        "gmail": ["alanwilliamswastaken@gmail.com", "theydonthaveit@gmail.com"]
    },
    "platforms": {
        "socail": ["facebook", "twitter", "snapchat"],
        "saas": ["haruko", "aws"]
    }
}';

my $readable = from_json($profile);

my $haruko = {
    'alanwilliamswastaken@gmail.com' => 1
};

my $independent = {
    'doyoureallyneedit@gmail.com' => 0
};

print 'Am I with Independent?'."\n";

if ( grep { $independent->{$_} } @{$readable->{'email'}->{'gmail'}} )
{
    print 'yes';
}
else
{
    print "No\n";
    print "Would you like to sign up?\n";
    print "Yes with Gmail account: theydonthaveit\@gmail.com\n";

    $independent->{'theydonthaveit@gmail.com'} = 1;

    print Dumper($independent);
}
