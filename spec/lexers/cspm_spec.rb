# -*- coding: utf-8 -*- #
# frozen_string_literal: true

describe Rouge::Lexers::CSPM do
    let(:subject) { Rouge::Lexers::CSPM.new }
  
    describe 'guessing' do
      include Support::Guessing
  
      it 'guesses by filename' do
        assert_guess :filename => 'foo.csp'
      end

    end
  end
  