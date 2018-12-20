# password

generate cryptographically secure passwords

## SYNOPSIS

```
password [--length] <int> 
         [--help] [--man]
```

## OPTIONS

```
--length    how long you want the password (defaults to 12)
--help      print this dialogue
--man       display the full documentation
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

## DEPENDENCIES

- strictures
- Getopt::Long
- Pod::Usage
- Crypt::Random

## AUTHOR

Blaine Motsinger, <blaine@renderorange.com>
