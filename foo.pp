class foo()
{
  include 'common'             # yes
  include '::common'           # yes
  include '::common::foo'      # yes
  include 'commonly::accepted' # no
  include 'commonly'           # no
  include 'uncommon::accepted' # no
  include 'uncommon'           # no
  include 'common::foo'        # yes
  include 'foo::common'        # no
  include "common"             # yes
  include "::common"           # yes
  include "::common::foo"      # yes
  include "commonly::accepted" # no
  include "commonly"           # no
  include "uncommon::accepted" # no
  include "uncommon"           # no
  include "common::foo"        # yes
  include "foo::common"        # no
  include common               # yes
  include ::common             # yes
  include ::common::foo        # yes
  include commonly::accepted   # no
  include commonly             # no
  include uncommon::accepted   # no
  include uncommon             # no
  include common::foo          # yes
  include foo::common          # no
  common::foo{ 'doo'           # yes
    common => foo,             # yes
    foo    => 'common',        # no
  }

  class{ 'commonly::common':   # no
    foo => 'dur',              # no
  }
  class{ 'commonly::foo':      # no
    foo => 'dur',              # no
  }
  class{ 'commonly':           # no
    foo => 'dur',              # no
  }

  class{ 'common::foo':        # yes
    foo => 'dur',              # no
  }
  class{ 'common':             # yes
    foo => 'dur',              # no
  }
}
