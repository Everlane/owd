class SimpleProxy
  def initialize proxied, method
    @proxied = proxied
    @method  = method
  end

  def method_missing method, *args
    @proxied.send(@method, method, *args)
  end
end
