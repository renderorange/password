use strict;
use warnings;

use Test::More;
use FindBin ();

my $class = 'password';

require "$FindBin::Bin/../$class";

HAPPY_PATH: {
    note( 'happy path' );

    my $expected_length = 13;

    my $object = password->new(
        length => $expected_length,
    );

    my $password = $object->generate();

    like( $password, qr/^[a-z0-9]+$/i, 'returned string contains expected characters' );
    is( length $password, $expected_length, 'returned string is expected length' );
}

done_testing();
exit;

__END__
