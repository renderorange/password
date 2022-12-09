use ExtUtils::MakeMaker;
  
WriteMakefile(
    NAME => 'password',
    AUTHOR => 'Blaine Motsinger <blaine@renderorange.com>',
    ABSTRACT_FROM => 'password',
    VERSION_FROM => 'password',
    LICENSE => 'mit',
    META_MERGE => {
        'meta-spec' => { version => 2 },
        resources => {
            bugtracker => {
                web => 'https://github.com/renderorange/password/issues',
            },
            homepage => 'https://github.com/renderorange/password',
            repository => {
                type => 'git',
                url => 'https://github.com/renderorange/password.git',
                web => 'https://github.com/renderorange/password',
            },
        },
    },

    MIN_PERL_VERSION => '5.10.1',
    BUILD_REQUIRES => {
        'ExtUtils::MakeMaker' => '6.64',  # for TEST_REQUIRES
    },
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '6.64',
    },
    TEST_REQUIRES => {
        'Capture::Tiny' => 0,
        'FindBin' => 0,
        'Test::More' => '0.98',
        'Test::Deep' => 0,
        'Test::Exception' => '0.42',  # recommended by Test2
    },
    PREREQ_PM => {
        'Getopt::Long' => '2.45',  # at least 2.45 for bugfixes
        'Math::Random::Secure' => 0,
        'Pod::Usage' => '1.67',  # at least 1.67 for bugfixes
        'strict' => 0,
        'warnings' => 0,
    },

    EXE_FILES => [
        'password',
    ],

    test => {
        TESTS => 't/*/*.t',
    },
);
