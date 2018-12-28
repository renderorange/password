use strict;
use warnings;

use Test::More;
use Capture::Tiny ();
use FindBin       ();

my $password_bin = "$FindBin::Bin/../../password";

VERSION: {
    note( 'version' );

    my @options = qw( --version );

    my ( $stdout, $stderr, $exit ) = Capture::Tiny::capture {
        system( $password_bin, @options );
    };

    like( $stdout, qr/\d+\.\d+\.\d+$/i, 'returned string contains expected characters' );
    ok( !$stderr, 'no output was produced to stderr' );
    is( $exit, 0, 'exit value was 0');
}

HELP: {
    note( 'help' );

    my @options = qw( --help );

    my ( $stdout, $stderr, $exit ) = Capture::Tiny::capture {
        system( $password_bin, @options );
    };

    like( $stdout, qr/Usage/i, 'returned output contains Usage section' );
    like( $stdout, qr/Options/i, 'returned output contains Options section' );
    ok( !$stderr, 'no output was produced to stderr' );
    is( $exit, 0, 'exit value was 0');
}

done_testing();
exit;

__END__
