use strict;
use warnings;

use Test::More;
use Test::Deep;
use Test::Exception;
use FindBin ();

my $class = 'password';

require "$FindBin::Bin/../../$class";

HAPPY_PATH: {
    note( 'happy path' );

    my $object = password->new(
        length => 12,
    );

    my $numer_match = '\d';
    my $one_quant   = '+';

    my $expected_object = {
        length => re( $numer_match . $one_quant ),
    };

    bless $expected_object, 'password';

    cmp_deeply( $object, $expected_object, 'returned object is the expected class and structure' );
}

EXCEPTIONS: {
    note( 'exceptions' );

    subtest 'testing length argument' => sub {
        plan tests => 4;

        dies_ok { password->new() } 'dies if not set';
        dies_ok { password->new( length => 'a' ) } 'dies if not an int';
        dies_ok { password->new( length => -1 ) } 'dies if not a positive int';
        like $@, qr/length must be a positive integer/, 'exception string is as expected';
    };
}

done_testing();
exit;

__END__
