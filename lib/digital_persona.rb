module DigitalPersona
  extend FFI::Library
  ffi_lib "/home/hamilton/workspace/digital_pesona_c/libdp.so"
  attach_function :soma, [:int, :int], :int
  attach_function :check_fingerprint, [:string, :int, :string, :int], :int
  
end