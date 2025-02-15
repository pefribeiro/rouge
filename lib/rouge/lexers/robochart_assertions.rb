# -*- coding: utf-8 -*- #
# frozen_string_literal: true

module Rouge
    module Lexers

        load_lexer 'cspm.rb'

        class RoboChartAssertions < CSPM

            title "RoboChart Assertions"
            desc "RoboChart Assertions language"
            tag "assertions"
            aliases 'rca'
            filenames "*.assertions"

            prepend :root do
                rule %r(/\*), Comment::Multiline, :commentx
                rule %r(//.*?$), Comment::Single

                rule %r/\b(csp-begin|csp-end)\b/, Keyword
                rule %r/\b(csp|untimed|timed|assertion|associated(\s*)to|refines|equals|is(\s*)deterministic|is(\s*)timelock-free|terminates|is(\s*)refined(\s*)by|is(\s*)deadlock-free|is(\s*)divergence-free|set(\s*)to|with(\s*)constant|with(\s*)constants|in(\s*)the(\s*)traces(\s*)model|in(\s*)the(\s*)failures-divergences(\s*)model|in(\s*)the(\s*)tick-tock(\s*)model|in(\s*)the(\s*)failures(\s*)model)\b/, Keyword
            end

            state :commentx do
                rule %r(\*/), Comment::Multiline, :pop!
                rule %r(/\*), Comment::Multiline, :commentx
                rule %r([^*/]+), Comment::Multiline
                rule %r(.), Comment::Multiline
            end
        end
    end
end                    