# encoding: utf-8

class CSSLintFilter < Nanoc::Filter
  requires 'execcsslint'

  identifier :csslint
  type :text

  def run(content, params={})
    messages = CSSLint.run(content).error_messages
    
    "csslint: #{item.identifier.chop}.#{item[:extension]}", messages unless messages.empty?
    
    # A textual filter should return the content (in our case unchanged).
    content
  end
end