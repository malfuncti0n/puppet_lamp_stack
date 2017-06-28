require 'spec_helper'
describe 'symfony' do
  context 'with default values for all parameters' do
    it { should contain_class('symfony') }
  end
end
