require 'spec_helper'

describe 'sublime_text::config' do
  let(:facts) { {:luser => 'testuser'} }

  let(:sublimedir) { "/Users/#{facts[:luser]}/Library/Application Support/Sublime Text 3" }
  # let(:pkgcontrol) { "#{sublimedir}/Installed Packages" }
  let(:packagedir) { "#{sublimedir}/Packages" }

  it { should contain_file(sublimedir).with_ensure('directory') }
  # it { should contain_file(pkgcontrol).with_ensure('directory') }
  it { should contain_file(packagedir).with_ensure('directory') }
end
