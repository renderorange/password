use strict;
use warnings;

use Test::More;
use FindBin ();

my @required_modules = qw{
    strictures
    Getopt::Long
    Pod::Usage
    Math::Random::Secure
};

use_ok($_) foreach @required_modules;

my $class = 'password';

require_ok( "$FindBin::Bin/../../$class" );

my @methods = qw{
    new
    generate
    _run
};

can_ok($class, $_) foreach @methods;

done_testing();
exit;

__END__
