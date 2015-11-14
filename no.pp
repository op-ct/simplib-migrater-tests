class foo()
{
  include 'woot'               # no
  include 'commonly::accepted' # no
  include 'commonly'           # no
  include 'woot::foo'          # no
  include 'woot::common'       # no

  woot::foo{ 'doo'             # no
    woot => foo,
    foo    => 'common',        # no
  }

  class{ 'commonly::common':   # no
    foo => 'dur',
  }
  class{ 'commonly::foo':      # no
    foo => 'dur',
  }
  class{ 'commonly':           # no
    foo => 'dur',
  }

  class{ 'woot::foo':          # no
    foo => 'dur',
  }
  class{ 'woot':               # no
    foo => 'dur',
  }
}
