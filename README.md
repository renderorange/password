# NAME

password - generate cryptographically secure passwords

# SYNOPSIS

    password [--length <int>] [--special|--no-special]
             [--version] [--help]

# OPTIONS

- --length &lt;int>

    how long you want the password (defaults to 12)

- --special | --no-special

    should there be special characters in the password

- --version

    print the version and exit

- --help

    print this dialogue

# DESCRIPTION

`password` generates cryptographically secure random passwords using alphanumeric characters with case variation and optional special characters.

`password` can be used as a script or as a perl module.

# INSTALLATION

To install `password` as a script.

- Generate the build and install tooling

        perl Makefile.PL

- Build, test, and install

        make
        make test && make install

# EXAMPLES

## As a script

- Get a 12 character length password

        password

- Get a 32 character length password

        password --length 32

- Get a 32 character length password with special characters

        password --length 32 --special

## As a module

- Get a 12 character length password

        require 'password';
        my $object   = password->new( length => 12 );
        my $password = $object->generate();

- Get a 32 character length password

        require 'password';
        my $object   = password->new( length => 32 );
        my $password = $object->generate();

- Get a 32 character length password with special characters

        require 'password';
        my $object   = password->new( length => 32, special => 1 );
        my $password = $object->generate();

# CONSTRUCTOR

## new

Constructor for the password object.

### ARGUMENTS

- length

    The length of the password to be generated.  Must be a positive integer.

### RETURNS

The password object.

### EXCEPTIONS

- length must be a positive integer

    This exception is thrown when verification of the length argument doesn't pass.

# METHODS

## generate

Generates the password based on the length as defined through the constructor.

### ARGUMENTS

None.

### RETURNS

The generated password string.

# EXIT STATUS

The following exit statuses are returned when run as a script.

- 0 - Indicates completion without failure
- 1 - Indicates failure

# DEPENDENCIES

- [Getopt::Long](https://metacpan.org/pod/Getopt::Long)
- [Pod::Usage](https://metacpan.org/pod/Pod::Usage)
- [Math::Random::Secure](https://metacpan.org/pod/Math::Random::Secure)

# AUTHOR

Blaine Motsinger, <blaine@renderorange.com>

# LICENSE AND COPYRIGHT

This software is available under the MIT license.

Copyright (c) 2022 Blaine Motsinger
