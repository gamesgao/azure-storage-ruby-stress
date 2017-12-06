module RubyInstaller
module Runtime # Rewrite from C:/projects/rubyinstaller2-hbuor/lib/ruby_installer/build/singleton.rb
  class << self
    # Add +path+ as a search path for DLLs
    #
    # This can be used to allow ruby extension files (typically named +<extension>.so+ ) to import dependent DLLs from another directory.
    #
    # If this method is called with a block, the path is temporary added until the block is finished.
    # The method returns a DllDirectory instance, when called without a block.
    # It can be used to remove the directory later.
    def add_dll_directory(path, &block)
      DllDirectory.new(path, &block)
    end

    # :nodoc:
    def msys2_installation
      @msys2_installation ||= Msys2Installation.new
    end

    # Switch to explicit search paths added by add_dll_directory() and enable MSYS2-MINGW directory this way, if available.
    def enable_dll_search_paths
      msys2_installation.enable_dll_search_paths
    end

    # Add MSYS2 to the PATH and set other environment variables required to run MSYS2.
    #
    # This method tries to find a MSYS2 installation or exits with a description how to install MSYS2.
    #
    # +mingwarch+ should be either 'mingw32', 'mingw64' or nil.
    # In the latter case the mingw architecture is used based on the architecture of the running Ruby process.
    def enable_msys_apps(*opts)
      msys2_installation.enable_msys_apps(*opts)
    end

    def disable_msys_apps(*opts)
      msys2_installation.disable_msys_apps(*opts)
    end
  end
end
end
