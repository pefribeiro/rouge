# -*- coding: utf-8 -*- #
# frozen_string_literal: true

# Adapted from https://github.com/jnwhiteh/pygments_csp_lexer/blob/master/csp_lexer/__init__.py
# and based on the FDR manual.

module Rouge
    module Lexers
        class CSPM < RegexLexer
            title "CSPM"
            desc "The Communicating Sequential Processes Machine-readable language"
            tag "csp"
            aliases "cspm"
            filenames "*.csp"

            state :whitespace do
                rule %r/\s+/, Text::Whitespace
            end

            state :root do
                mixin :whitespace
                rule %r(\{\-), Comment::Multiline, :comment
                rule %r(\-\-.*?$), Comment::Single

                rule %r/"/, Str::Double, :string
                rule %r/\[(FD|T|F)=/, Keyword

                rule %r/\\|\?|!|->|\[\]|\|~\||\|\|\||\[\||\|]|\[\[|\]\]|\|\||;|\||\|\\/, Operator
                rule %r/{\||\|}|{|}|\.\.|:|#|<-|<->|==|<|>|<=|>=|@|&|=|[+-\/*%^]/, Operator
                rule %r/\b(assert|nametype|datatype|let|within|newtype|channel|external|transparent)\b/, Keyword
                rule %r/\b(if|then|else)\b/, Keyword
                rule %r/\b([0-9]+)\b/, Num::Integer
                rule %r/\b(true|false|True|False)\b/, Keyword::Constant
                rule %r/\b(Bool|Char|Events|Int|Proc)\b/, Keyword::Type
                rule %r/\b(length|length|null|head|tail|concat|elem|union|inter|diff|Union|Inter|member|card|empty|set|Set|Seq|seq|true|false|True|False|STOP|SKIP|CHAOS|DIV|WAIT|RUN|prioritise|prioritisepo|error|show|productions|extensions|diamond|normal|sbisim|tau_loop_factor|timed_priority|model_compress|explicate|sbisim|wbisim|chase)\b/, Name::Builtin

                rule %r/\(|\)|,|\[|\]/, Punctuation
                rule %r/^(\s*)([a-zA-Z0-9_\']+)(\s*)(\(.*?\)|)(\s*=)/ do
                    groups Text, Name::Function, Text, Text, Text
                end 
                rule %r/[A-Za-z_][A-Za-z0-9_\']*/, Name
                rule %r/[^\S\n]/, Text
            end

            state :string do
                rule %r/[^\\"]+/, Str::Double
                rule %r/\\./, Str::Escape
                rule %r/"/, Str::Double, :pop!
            end
        
            state :comment do
                rule %r(\-\}), Comment::Multiline, :pop!
                rule %r(\{\-), Comment::Multiline, :comment
                rule %r([^\-\}]+), Comment::Multiline
            end

        end
    end
end        