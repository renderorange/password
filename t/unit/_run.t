use strict;
use warnings;

use Test::More;
use Capture::Tiny ();
use FindBin       ();

my $class = 'password';

require "$FindBin::Bin/../../$class";

HAPPY_PATH: {
    note( 'happy path' );

    my $expected_length = 12;
    my @options = ();

    my ( $stdout, $stderr, @result ) = Capture::Tiny::capture {
        $class->_run( [ @options ] )
    };

    chomp( $stdout );

    like( $stdout, qr/^[a-z0-9]+$/i, 'returned string contains expected characters' );
    is( length $stdout, $expected_length, 'returned string is expected length' );
    ok( !$stderr, 'no output was produced to stderr' );
}

LENGTH: {
    note( 'length' );

    my $expected_length = 13;
    my @options = ( '--length', $expected_length );

    my ( $stdout, $stderr, @result ) = Capture::Tiny::capture {
        $class->_run( [ @options ] )
    };

    chomp( $stdout );

    like( $stdout, qr/^[a-z0-9]+$/i, 'returned string contains expected characters' );
    is( length $stdout, $expected_length, 'returned string is expected length' );
    ok( !$stderr, 'no output was produced to stderr' );
}

VERSION: {
    note( 'version' );

    my @options = ( '--version' );

    my ( $stdout, $stderr, @result ) = Capture::Tiny::capture {
        $class->_run( [ @options ] )
    };

    chomp( $stdout );

    like( $stdout, qr/^[0-9\.0-9\.0-9]+$/i, 'returned string contains expected characters' );
    ok( !$stderr, 'no output was produced to stderr' );
}

done_testing();
exit;

__END__
