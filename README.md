ReplaceClassName
---
`ReplaceClassName` is An Easy Way for Replacing Classname

[![Gem Version](https://badge.fury.io/rb/replace_class.svg)](http://badge.fury.io/rb/replace_class)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/MickeyHub/ReplaceClassName)



## Install

```sh
$ gem install replace_class
```

**Note: If Mac OS X 10.11 or later, for `rootless`, you can not install replace_class directly, following is solution:**

1\. use [Homebrew](http://brew.sh/) and [RVM](https://rvm.io/) to install Ruby, then install replace_class(recommand)

```sh
# Install Homebrew:
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install RVM:
$ \curl -sSL https://get.rvm.io | bash -s stable --ruby

$ gem install replace_class
```

2\. specify replace_class's bin file PATH

```sh
$ export PATH=/usr/local/bin:$PATH;gem install -n /usr/local/bin replace_class
```

3\. override Ruby Gem 's bindir

```sh
$ echo 'gem: --bindir /usr/local/bin' >> ~/.gemrc
$ gem install replace_class
```

## Usage

```text
Usage: [replace_class -s source -d dest path]
    -s, --source sourceClass         Source class name for replacement
    -d, --dest destClass             Dest class name for replacement
    -f, --force                      No interaction with user
    -y, --yes                        Same to force option
```

## Example
```sh
replace_class -s APOPost -d APOTuso $(SRCROOT)
```

**Note: if current working directory is $(SRCROOT), following is also available**

```sh
replace_class -s APOPost -d APOTuso
```

## Issues & Contributions
Please [open an issue here on GitHub](https://github.com/MickeyHub/ReplaceClassName/issues) if you have a problem, suggestion, or other comment.

Pull requests are welcome and encouraged! There are no official guidelines, but please try to be consistent with the existing code style.

## Licence
This project is licensed under the terms of the MIT license. See the LICENSE file.
