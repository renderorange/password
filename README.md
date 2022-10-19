# NAME

password - generate cryptographically secure passwords

# SYNOPSIS

    password [--length <int>] [--special|--no-special]
             [--version]
             [--help]

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

password generates cryptographically secure random passwords, using alphanumeric characters with case variation and optionally special characters.

The logic can be used directly as a script or used as a module.

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
        my $object = password->new( length => 12 );

        print $object->generate() . "\n";

- Get a 32 character length password

        require 'password';
        my $object = password->new( length => 32 );

        print $object->generate() . "\n";

- Get a 32 character length password with special characters

        require 'password';
        my $object = password->new( length => 32, special => 1 );

        print $object->generate() . "\n";

# SUBROUTINES/METHODS

## new

Constructor for the password object.

### ARGUMENTS

- length

    The length of the password to be generated.

    Must be a positive integer.

### RETURNS

The password object.

### EXCEPTIONS

- length must be a positive integer

    This exception is thrown when verification of the length argument doesn't pass.

## generate

Generates the password based on the length as defined through the constructor.

### ARGUMENTS

None.

### RETURNS

The generated password string.

# EXIT STATUS

- 0 - Indicates completion without failure
- 1 - Indicates failure

# DEPENDENCIES

- strictures
- Getopt::Long
- Pod::Usage
- Math::Random::Secure

# AUTHOR

Blaine Motsinger, <blaine@renderorange.com>

# LICENSE AND COPYRIGHT

This software is available under the MIT license.

Copyright (c) 2022 Blaine Motsinger
