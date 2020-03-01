class EncryptionUtility
  extend EncryptionSHA

  def method_missing(sym, *args)
    puts ">>>>>>>>>>>> #{sym} not defined on #{self}".red
  end
end
