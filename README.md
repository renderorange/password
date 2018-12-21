# password

generate cryptographically secure passwords

## SYNOPSIS

```
password [--length] <int> 
         [--version]
         [--help] [--man]
```

## OPTIONS

```
--length     how long you want the password (defaults to 12)
--version    print the version and exit
--help       print this dialogue
--man        display the full documentation
```

## DESCRIPTION

This script generates cryptographically secure random passwords, using alphanumeric characters with case variation.

## EXAMPLES

Get a 12 character length password

```
password
```

Get a 32 character length password

```
password --length 32
```

## EXIT STATUS

- 0 - Indicates completion without failure
- 1 - Indicates failure

## DEPENDENCIES

- strictures
- Getopt::Long
- Pod::Usage
- Crypt::Random

## AUTHOR

Blaine Motsinger, <blaine@renderorange.com>

## LICENSE AND COPYRIGHT

This software is available under the MIT license.

Copyright (c) 2018 Blaine Motsinger
