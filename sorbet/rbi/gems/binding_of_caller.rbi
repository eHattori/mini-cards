# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/binding_of_caller/all/binding_of_caller.rbi
#
# binding_of_caller-1.0.0

module BindingOfCaller
end
module BindingOfCaller::BindingExtensions
  def callers; end
  def frame_count; end
  def frame_description; end
  def frame_type; end
  def of_caller(n); end
end
class Binding
  include BindingOfCaller::BindingExtensions
end
