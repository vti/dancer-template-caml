use strict;
use warnings;

use Test::More import => ["!pass"];

use Dancer ':syntax';
use Dancer::Test;

plan tests => 3;

setting template => 'caml';
setting views    => 't';

ok( get '/' => sub {
        template 'index', {name => 'vti'};
    }
);

route_exists [GET => '/'];
response_content_like([GET => '/'], qr/vti/);
