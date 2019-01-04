use strict;
use warnings;

use Test::More;
use Capture::Tiny ();
use FindBin       ();

my $password_bin = "$FindBin::Bin/../../password";

LENGTH: {
    note( 'length' );

    my $expected_length = 13;
    my @options = ( '--length', $expected_length );

    my ( $stdout, $stderr, $exit ) = Capture::Tiny::capture {
        system( $password_bin, @options );
    };

    like( $stdout, qr/^[a-z0-9]{$expected_length}$/i, 'returned string contains expected characters' );
    ok( !$stderr, 'no output was produced to stderr' );
    is( $exit, 0, 'exit value was 0' );
}

VERSION: {
    note( 'version' );

    my @options = qw( --version );

    my ( $stdout, $stderr, $exit ) = Capture::Tiny::capture {
        system( $password_bin, @options );
    };

    like( $stdout, qr/\d+\.\d+\.\d+$/, 'returned string contains expected characters' );
    ok( !$stderr, 'no output was produced to stderr' );
    is( $exit, 0, 'exit value was 0' );
}

HELP: {
    note( 'help' );

    my @options = qw( --help );

    my ( $stdout, $stderr, $exit ) = Capture::Tiny::capture {
        system( $password_bin, @options );
    };

    like( $stdout, qr/Usage/, 'returned output contains Usage section' );
    like( $stdout, qr/Options/, 'returned output contains Options section' );
    ok( !$stderr, 'no output was produced to stderr' );
    is( $exit, 0, 'exit value was 0' );
}

MAN: {
    note( 'man' );

    my @options = qw( --man );

    my ( $stdout, $stderr, $exit ) = Capture::Tiny::capture {
        system( $password_bin, @options );
    };

    like( $stdout, qr/$_/, "returned output contains $_ section" )
        foreach (
            'NAME', 'SYNOPSIS', 'OPTIONS', 'DESCRIPTION', 'EXAMPLES',
            'SUBROUTINES/METHODS', 'EXIT STATUS', 'DEPENDENCIES',
            'AUTHOR', 'LICENSE AND COPYRIGHT'
        );

    ok( !$stderr, 'no output was produced to stderr' );
    is( $exit, 0, 'exit value was 0' );
}

EXCEPTIONS: {
    note( 'exceptions' );

    my $invalid_length = 'a';
    my $expected_error = qq(Value "$invalid_length" invalid for option length);
    my @options = ( '--length', $invalid_length );

    my ( $stdout, $stderr, $exit ) = Capture::Tiny::capture {
        system( $password_bin, @options );
    };

    like( $stderr, qr/$expected_error/, 'returned stderr contains the expected error' );
    like( $stdout, qr/Usage/, 'returned stdout contains Usage section' );

    TODO: {
        local $TODO = 'fine tune exit value on exception';

        isnt( $exit, 0, 'exit value was not 0' );
    };
}

done_testing();
exit;

__END__
