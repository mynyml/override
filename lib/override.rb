#original idea: http://github.com/wycats/merb/blob/677d08b9dd972367369a509987264ded25e70f9a/merb-core/lib/merb-core/core_ext/class.rb
class Class
  def override(*names)
    mod = Module.new
    names.each do |name|
      method = self.instance_method(name.to_sym)
      mod.module_eval { send(:define_method, name.to_sym, method) }
      include mod
    end
  end
end
