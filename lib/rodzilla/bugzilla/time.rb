module Rodzilla
  module Bugzilla
    class Time < Base
        #  The current time in UTC, according to the Bugzilla database server.
        attr_accessor :db_time

        # This is the current time in UTC, according to Bugzilla's web server.
        attr_accessor :web_time

        # Identical to web_time. (Exists only for backwards-compatibility with versions of Bugzilla before 3.6.)
        attr_accessor :web_time_utc

        # string The literal string UTC.
        # (Exists only for backwards-compatibility with versions of Bugzilla before 3.6.)
        attr_accessor :tz_name

        # string The literal string UTC.
        # (Exists only for backwards-compatibility with versions of Bugzilla before 3.6.)
        attr_accessor :tz_short_name

        # string The literal string +0000.
        # (Exists only for backwards-compatibility with versions of Bugzilla before 3.6.)
        attr_accessor :tz_offset
    end
  end
end