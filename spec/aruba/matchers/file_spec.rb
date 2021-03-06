require 'spec_helper'

RSpec.describe 'File Matchers' do
  include_context 'uses aruba API'

  def expand_path(*args)
    @aruba.expand_path(*args)
  end

  describe 'to_be_existing_file' do
    context 'when file exists' do
      before :each do
        File.write(@file_path, '')
      end

      it { expect(@file_name).to be_existing_file }
    end

    context 'when file does not exist' do
      it { expect(@file_name).not_to be_existing_file }
    end
  end

  describe 'to_have_file_content' do
    context 'when file exists' do
      before :each do
        File.write(@file_path, 'aba')
      end

      context 'and file content is exactly equal string ' do
        it { expect(@file_name).to have_file_content('aba') }
      end

      context 'and file content contains string' do
        it { expect(@file_name).to have_file_content(/b/) }
      end

      context 'and file content is not exactly equal string' do
        it { expect(@file_name).not_to have_file_content('c') }
      end

      context 'and file content not contains string' do
        it { expect(@file_name).not_to have_file_content(/c/) }
      end
    end

    context 'when file does not exist' do
      it { expect(@file_name).not_to have_file_content('a') }
    end
  end

  describe 'to_have_file_size' do
    context 'when file exists' do
      before :each do
        File.write(@file_path, '')
      end

      context 'and file size is equal' do
        it { expect(@file_name).to have_file_size(0) }
      end

      context 'and file size is not equal' do
        it { expect(@file_name).not_to have_file_size(1) }
      end
    end

    context 'when file does not exist' do
      it { expect(@file_name).not_to have_file_size(0) }
    end
  end
end
