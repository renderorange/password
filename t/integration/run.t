use strict;
use warnings;

use Test::More;
use Capture::Tiny ();
use FindBin       ();

my $password_bin = "$FindBin::Bin/../../password";

HAPPY_PATH: {
    note( 'happy path' );

    my $expected_length = 12;

    my ( $stdout, $stderr, $exit ) = Capture::Tiny::capture {
        system( $password_bin );
    };

    like( $stdout, qr/\n+$/i, 'returned string ends in newline' );
    chomp( $stdout );

    like( $stdout, qr/^[a-z0-9]+$/i, 'returned string contains expected characters' );
    is( length $stdout, $expected_length, 'returned string is expected length' );

    ok( !$stderr, 'no output was produced to stderr' );

    is( $exit, 0, 'exit value was 0');
}

done_testing();
exit;

__END__
