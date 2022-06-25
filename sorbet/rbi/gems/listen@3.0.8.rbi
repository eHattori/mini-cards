# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `listen` gem.
# Please instead update this file by running `bin/tapioca gem listen`.

# Listener implementation for BSD's `kqueue`.
#
# @see http://www.freebsd.org/cgi/man.cgi?query=kqueue
# @see https://github.com/mat813/rb-kqueue/blob/master/lib/rb-kqueue/queue.rb
module Listen
  class << self
    def logger; end
    def logger=(logger); end
    def setup_default_logger_if_unset; end

    # This is used by the `listen` binary to handle Ctrl-C
    def stop; end

    # Listens to file system modifications on a either single directory or
    # multiple directories.
    #
    # @return [Listen::Listener] the listener
    # @yield [modified, added, removed] the changed files
    # @yieldparam modified [Array<String>] the list of modified files
    # @yieldparam added [Array<String>] the list of added files
    # @yieldparam removed [Array<String>] the list of removed files
    def to(*args, &block); end
  end
end

module Listen::Adapter
  class << self
    def _log(type, message); end
    def _usable_adapter_class; end
    def _warn_polling_fallback(options); end
    def select(options = T.unsafe(nil)); end
  end
end

class Listen::Adapter::BSD < ::Listen::Adapter::Base
  private

  def _change(event_flags); end
  def _configure(directory, &_callback); end
  def _event_path(event); end

  # Quick rubocop workaround
  def _find(*paths, &block); end

  def _process_event(dir, event); end
  def _run; end
  def _watch_file(path, queue); end
  def _watch_for_new_file(event); end

  class << self
    # @return [Boolean]
    def usable?; end
  end
end

Listen::Adapter::BSD::BUNDLER_DECLARE_GEM = T.let(T.unsafe(nil), String)
Listen::Adapter::BSD::DEFAULTS = T.let(T.unsafe(nil), Hash)
Listen::Adapter::BSD::OS_REGEXP = T.let(T.unsafe(nil), Regexp)

class Listen::Adapter::Base
  # @return [Base] a new instance of Base
  def initialize(config); end

  # Returns the value of attribute config.
  def config; end

  # TODO: it's a separate method as a temporary workaround for tests
  def configure; end

  # Returns the value of attribute options.
  def options; end

  def start; end

  # @return [Boolean]
  def started?; end

  def stop; end

  private

  def _log(*args, &block); end
  def _log_exception(msg, caller_stack); end

  # TODO: allow backend adapters to pass specific invalidation objects
  # e.g. Darwin -> DirRescan, INotify -> MoveScan, etc.
  def _queue_change(type, dir, rel_path, options); end

  def _stop; end
  def _timed(title); end

  class << self
    def _log(*args, &block); end

    # @return [Boolean]
    def usable?; end
  end
end

# TODO: only used by tests
Listen::Adapter::Base::DEFAULTS = T.let(T.unsafe(nil), Hash)

class Listen::Adapter::Config
  # @return [Config] a new instance of Config
  def initialize(directories, queue, silencer, adapter_options); end

  # Returns the value of attribute adapter_options.
  def adapter_options; end

  # Returns the value of attribute directories.
  def directories; end

  # Returns the value of attribute queue.
  def queue; end

  # Returns the value of attribute silencer.
  def silencer; end
end

# Adapter implementation for Mac OS X `FSEvents`.
class Listen::Adapter::Darwin < ::Listen::Adapter::Base
  private

  # NOTE: each directory gets a DIFFERENT callback!
  def _configure(dir, &callback); end

  def _process_event(dir, event); end
  def _run; end
  def _run_worker(worker); end
  def _run_workers_in_background(workers); end
  def _to_array(queue); end

  class << self
    # @return [Boolean]
    def usable?; end
  end
end

# The default delay between checking for changes.
Listen::Adapter::Darwin::DEFAULTS = T.let(T.unsafe(nil), Hash)

Listen::Adapter::Darwin::INCOMPATIBLE_GEM_VERSION = T.let(T.unsafe(nil), String)
Listen::Adapter::Darwin::OS_REGEXP = T.let(T.unsafe(nil), Regexp)

# @see https://github.com/nex3/rb-inotify
class Listen::Adapter::Linux < ::Listen::Adapter::Base
  private

  def _change(event_flags); end
  def _configure(directory, &callback); end

  # @return [Boolean]
  def _dir_event?(event); end

  def _process_event(dir, event); end
  def _run; end

  # @return [Boolean]
  def _skip_event?(event); end

  def _stop; end
end

Listen::Adapter::Linux::DEFAULTS = T.let(T.unsafe(nil), Hash)
Listen::Adapter::Linux::INOTIFY_LIMIT_MESSAGE = T.let(T.unsafe(nil), String)
Listen::Adapter::Linux::OS_REGEXP = T.let(T.unsafe(nil), Regexp)
Listen::Adapter::Linux::WIKI_URL = T.let(T.unsafe(nil), String)
Listen::Adapter::OPTIMIZED_ADAPTERS = T.let(T.unsafe(nil), Array)
Listen::Adapter::POLLING_FALLBACK_MESSAGE = T.let(T.unsafe(nil), String)

# Polling Adapter that works cross-platform and
# has no dependencies. This is the adapter that
# uses the most CPU processing power and has higher
# file IO than the other implementations.
class Listen::Adapter::Polling < ::Listen::Adapter::Base
  private

  def _configure(_, &callback); end
  def _process_event(dir, _); end
  def _run; end
end

Listen::Adapter::Polling::DEFAULTS = T.let(T.unsafe(nil), Hash)

# match every OS
Listen::Adapter::Polling::OS_REGEXP = T.let(T.unsafe(nil), Regexp)

# Adapter implementation for Windows `wdm`.
class Listen::Adapter::Windows < ::Listen::Adapter::Base
  private

  def _change(type); end
  def _configure(dir, &callback); end
  def _process_event(dir, event); end
  def _run; end

  class << self
    # @return [Boolean]
    def usable?; end
  end
end

Listen::Adapter::Windows::BUNDLER_DECLARE_GEM = T.let(T.unsafe(nil), String)
Listen::Adapter::Windows::OS_REGEXP = T.let(T.unsafe(nil), Regexp)

class Listen::Backend
  # @return [Backend] a new instance of Backend
  def initialize(directories, queue, silencer, config); end

  def min_delay_between_events; end
  def start; end
  def stop; end

  private

  # Returns the value of attribute adapter.
  def adapter; end
end

# TODO: rename to Snapshot
class Listen::Change
  # @return [Change] a new instance of Change
  def initialize(config, record); end

  # Invalidate some part of the snapshot/record (dir, file, subtree, etc.)
  def invalidate(type, rel_path, options); end

  # Returns the value of attribute record.
  def record; end

  private

  # Returns the value of attribute config.
  def config; end
end

# TODO: test this class for coverage
class Listen::Change::Config
  # @return [Config] a new instance of Config
  def initialize(queue, silencer); end

  def queue(*args); end

  # @return [Boolean]
  def silenced?(path, type); end
end

# TODO: refactor (turn it into a normal object, cache the stat, etc)
class Listen::Directory
  class << self
    def _async_changes(snapshot, path, previous, options); end
    def _change(snapshot, type, path, options); end

    # @raise [Errno::ENOTDIR]
    def _children(path); end

    def scan(snapshot, rel_path, options); end
  end
end

module Listen::Event; end

class Listen::Event::Config
  # @return [Config] a new instance of Config
  def initialize(listener, event_queue, queue_optimizer, wait_for_delay, &block); end

  def call(*args); end

  # @return [Boolean]
  def callable?; end

  def event_queue; end
  def min_delay_between_events; end
  def optimize_changes(changes); end

  # @return [Boolean]
  def paused?; end

  def sleep(*args); end

  # @return [Boolean]
  def stopped?; end

  def timestamp; end

  private

  # Returns the value of attribute listener.
  def listener; end
end

class Listen::Event::Loop
  # @return [Loop] a new instance of Loop
  def initialize(config); end

  def pause; end

  # @return [Boolean]
  def paused?; end

  # @return [Boolean]
  def processing?; end

  def resume; end
  def setup; end

  # @return [Boolean]
  def stopped?; end

  def teardown; end
  def wakeup_on_event; end

  private

  def _nice_error(ex); end
  def _sleep(*args); end
  def _wait_for_changes(ready_queue, config); end
  def _wait_until_resumed(ready_queue); end
  def _wakeup(reason); end

  # Returns the value of attribute config.
  def config; end

  # Returns the value of attribute state.
  def state; end

  # Sets the attribute state
  #
  # @param value the value to set the attribute state to.
  def state=(_arg0); end

  # Returns the value of attribute wait_thread.
  def wait_thread; end
end

class Listen::Event::Loop::Error < ::RuntimeError; end
class Listen::Event::Loop::Error::NotStarted < ::Listen::Event::Loop::Error; end

class Listen::Event::Processor
  # @return [Processor] a new instance of Processor
  def initialize(config, reasons); end

  # TODO: implement this properly instead of checking the state at arbitrary
  # points in time
  def loop_for(latency); end

  private

  # @raise [Stopped]
  def _check_stopped; end

  def _deadline; end
  def _flush_wakeup_reasons; end

  # for easier testing without sleep loop
  def _process_changes; end

  def _remember_time_of_first_unprocessed_event; end
  def _reset_no_unprocessed_events; end
  def _sleep(_local_reason, *args); end
  def _timestamp; end
  def _wait_until_events; end
  def _wait_until_events_calm_down; end
  def _wait_until_no_longer_paused; end

  # Returns the value of attribute config.
  def config; end
end

class Listen::Event::Processor::Stopped < ::RuntimeError; end

class Listen::Event::Queue
  # @return [Queue] a new instance of Queue
  def initialize(config, &block); end

  def <<(args); end

  # @return [Boolean]
  def empty?; end

  def pop; end

  private

  def _safe_relative_from_cwd(dir); end

  # Returns the value of attribute block.
  def block; end

  # Returns the value of attribute config.
  def config; end

  # Returns the value of attribute event_queue.
  def event_queue; end
end

class Listen::Event::Queue::Config
  # @return [Config] a new instance of Config
  def initialize(relative); end

  # @return [Boolean]
  def relative?; end
end

module Listen::FSM
  mixes_in_class_methods ::Listen::FSM::ClassMethods

  # Be kind and call super if you must redefine initialize
  def initialize; end

  # Obtain the current state of the FSM
  def state; end

  def transition(state_name); end

  # Immediate state transition with no checks, or callbacks. "Dangerous!"
  def transition!(state_name); end

  protected

  def current_state; end
  def current_state_name; end
  def default_state; end
  def states; end
  def transition_with_callbacks!(state_name); end
  def validate_and_sanitize_new_state(state_name); end

  class << self
    # Included hook to extend class methods
    def included(klass); end
  end
end

module Listen::FSM::ClassMethods
  # Obtain or set the default state
  # Passing a state name sets the default state
  def default_state(new_default = T.unsafe(nil)); end

  # Declare an FSM state and optionally provide a callback block to fire
  # Options:
  # * to: a state or array of states this state can transition to
  def state(*args, &block); end

  # Obtain the valid states for this FSM
  def states; end
end

# Default state name unless one is explicitly set
Listen::FSM::DEFAULT_STATE = T.let(T.unsafe(nil), Symbol)

class Listen::FSM::State
  # @return [State] a new instance of State
  def initialize(name, transitions = T.unsafe(nil), &block); end

  def call(obj); end

  # Returns the value of attribute name.
  def name; end

  # Returns the value of attribute transitions.
  def transitions; end

  # @return [Boolean]
  def valid_transition?(new_state); end
end

class Listen::File
  class << self
    def change(record, rel_path); end

    # @return [Boolean]
    def inaccurate_mac_time?(stat); end
  end
end

# @private api
module Listen::Internals; end

module Listen::Internals::ThreadPool
  class << self
    def add(&block); end
    def stop; end
  end
end

class Listen::Listener
  include ::Listen::FSM
  extend ::Listen::FSM::ClassMethods

  # Initializes the directories listener.
  #
  # @param directory [String] the directories to listen to
  # @param options [Hash] the listen options (see Listen::Listener::Options)
  # @return [Listener] a new instance of Listener
  # @yield [modified, added, removed] the changed files
  # @yieldparam modified [Array<String>] the list of modified files
  # @yieldparam added [Array<String>] the list of added files
  # @yieldparam removed [Array<String>] the list of removed files
  def initialize(*dirs, &block); end

  def ignore(regexps); end
  def ignore!(regexps); end
  def only(regexps); end

  # Stops invoking callbacks (messages pile up)
  def pause; end

  # @return [Boolean]
  def paused?; end

  # processing means callbacks are called
  #
  # @return [Boolean]
  def processing?; end

  # Starts processing events and starts adapters
  # or resumes invoking callbacks if paused
  def start; end

  # Stops both listening for events and processing them
  def stop; end

  private

  # Returns the value of attribute backend.
  def backend; end

  # Returns the value of attribute processor.
  def processor; end
end

class Listen::Listener::Config
  # @return [Config] a new instance of Config
  def initialize(opts); end

  def adapter_instance_options(klass); end
  def adapter_select_options; end
  def min_delay_between_events; end

  # @return [Boolean]
  def relative?; end

  def silencer_rules; end
end

Listen::Listener::Config::DEFAULTS = T.let(T.unsafe(nil), Hash)

class Listen::Logger
  class << self
    def debug(*args, &block); end
    def error(*args, &block); end
    def fatal(*args, &block); end
    def info(*args, &block); end
    def warn(*args, &block); end
  end
end

class Listen::Options
  # @return [Options] a new instance of Options
  def initialize(opts, defaults); end

  def method_missing(name, *_); end
end

class Listen::QueueOptimizer
  # @return [QueueOptimizer] a new instance of QueueOptimizer
  def initialize(config); end

  def smoosh_changes(changes); end

  private

  def _calculate_add_remove_difference(actions, path, default_if_exists); end
  def _detect_possible_editor_save(changes); end
  def _logical_action_for(path, actions); end

  # remove extraneous rb-inotify events, keeping them only if it's a possible
  # editor rename() call (e.g. Kate and Sublime)
  def _reinterpret_related_changes(cookies); end

  # groups changes into the expected structure expected by
  # clients
  def _squash_changes(changes); end

  # Returns the value of attribute config.
  def config; end
end

class Listen::QueueOptimizer::Config
  # @return [Config] a new instance of Config
  def initialize(adapter_class, silencer); end

  def debug(*args, &block); end

  # @return [Boolean]
  def exist?(path); end

  # @return [Boolean]
  def silenced?(path, type); end
end

# @private api
class Listen::Record
  # @return [Record] a new instance of Record
  def initialize(directory); end

  def add_dir(rel_path); end
  def build; end
  def dir_entries(rel_path); end
  def file_data(rel_path); end

  # TODO: one Record object per watched directory?
  # TODO: deprecate
  def root; end

  def unset_path(rel_path); end
  def update_file(rel_path, data); end

  private

  def _auto_hash; end
  def _fast_build_dir(remaining, symlink_detector); end
  def _fast_try_file(entry); end
  def _fast_unset_path(dirname, basename); end
  def _fast_update_file(dirname, basename, data); end
  def tree; end
end

# Represents a directory entry (dir or file)
class Listen::Record::Entry
  # file: "/home/me/watched_dir", "app/models", "foo.rb"
  # dir, "/home/me/watched_dir", "."
  #
  # @return [Entry] a new instance of Entry
  def initialize(root, relative, name = T.unsafe(nil)); end

  def children; end
  def meta; end

  # Returns the value of attribute name.
  def name; end

  def real_path; end

  # record hash is e.g.
  # if @record["/home/me/watched_dir"]["project/app/models"]["foo.rb"]
  # if @record["/home/me/watched_dir"]["project/app"]["models"]
  # record_dir_key is "project/app/models"
  def record_dir_key; end

  # Returns the value of attribute relative.
  def relative; end

  # Returns the value of attribute root.
  def root; end

  def sys_path; end

  private

  # @raise [Errno::ENOTDIR]
  def _entries(dir); end

  def _join; end
end

class Listen::Record::SymlinkDetector
  # @return [SymlinkDetector] a new instance of SymlinkDetector
  def initialize; end

  def verify_unwatched!(entry); end

  private

  def _fail(symlinked, real_path); end
end

class Listen::Record::SymlinkDetector::Error < ::RuntimeError; end
Listen::Record::SymlinkDetector::SYMLINK_LOOP_ERROR = T.let(T.unsafe(nil), String)
Listen::Record::SymlinkDetector::WIKI = T.let(T.unsafe(nil), String)

class Listen::Silencer
  # @return [Silencer] a new instance of Silencer
  def initialize; end

  def configure(options); end

  # Returns the value of attribute ignore_patterns.
  def ignore_patterns; end

  # Sets the attribute ignore_patterns
  #
  # @param value the value to set the attribute ignore_patterns to.
  def ignore_patterns=(_arg0); end

  # Returns the value of attribute only_patterns.
  def only_patterns; end

  # Sets the attribute only_patterns
  #
  # @param value the value to set the attribute only_patterns to.
  def only_patterns=(_arg0); end

  # TODO: switch type and path places - and verify
  #
  # @return [Boolean]
  def silenced?(relative_path, type); end

  private

  def _init_ignores(ignores, overrides); end

  # Returns the value of attribute options.
  def options; end
end

class Listen::Silencer::Controller
  # @return [Controller] a new instance of Controller
  def initialize(silencer, default_options); end

  def append_ignores(*regexps); end
  def replace_with_bang_ignores(regexps); end
  def replace_with_only(regexps); end

  private

  def _reconfigure_silencer(extra_options); end
end

# The default list of directories that get ignored.
Listen::Silencer::DEFAULT_IGNORED_DIRECTORIES = T.let(T.unsafe(nil), Regexp)

# The default list of files that get ignored.
Listen::Silencer::DEFAULT_IGNORED_EXTENSIONS = T.let(T.unsafe(nil), Regexp)

Listen::VERSION = T.let(T.unsafe(nil), String)