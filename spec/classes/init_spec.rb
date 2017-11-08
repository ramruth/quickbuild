require 'spec_helper'
describe 'quickbuild' do

  context 'with defaults for all parameters' do
    it { should contain_class('quickbuild') }
  end
end
