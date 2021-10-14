# -*- coding: utf-8 -*- #
# frozen_string_literal: true

describe Rouge::Lexers::RoboChartAssertions do
    let(:subject) { Rouge::Lexers::RoboChartAssertions.new }
  
    describe 'guessing' do
      include Support::Guessing
  
      it 'guesses by filename' do
        assert_guess :filename => 'foo.assertions'
      end

    end
  end
  