use strict;
use warnings;
use Test::More qw[no_plan];

use Carp; $SIG{__WARN__} = sub { Carp::cluck @_ };

use_ok 'Email::MIME::Creator';

my $hi    = Email::MIME->create(body => "Hi");
my $hello = Email::MIME->create(body => "Hello");
my $howdy = Email::MIME->create(body => "Howdy");

my $all_his = Email::MIME->create(
    attributes => {
      content_type => 'multipart/alternative',
    },
    parts => [ $hi, $howdy, $hello ],
);

is scalar($all_his->parts), 3, 'three parts';

my $email = Email::MIME->create(
    parts => [
        Email::MIME->create(
          attributes => {
            charset => 'UTF-8',
            disposition => 'inline',
          },
          body => "Intro",
        ),
        $all_his,
    ],
);

is scalar($email->parts), 2, 'two parts for email';

is scalar(($email->parts)[-1]->parts), 3, 'three parts for all_his';

my @parts = ($email->parts)[-1]->parts;
is $parts[0]->body_str, 'Hi';
is $parts[1]->body_str, 'Howdy';
is $parts[2]->body_str, 'Hello';
