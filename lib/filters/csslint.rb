# encoding: utf-8

class CSSLintFilter < Nanoc::Filter
  requires 'execcsslint'

  identifier :csslint
  type :text

  def run(content, params={})
    result = CSSLint.run(content)
    
    puts "csslint: #{item.identifier.chop}.#{item[:extension]}", result.error_messages unless result.error_messages.empty?
    
    # Don't raise an exception by default since CSS will generally work.
    if params[:strict]
        raise RuntimeError, "csslint: fatal error\n#{result.error_messages.select{|m| m =~ /error/}}" unless result.valid?
    end

    # A textual filter should return the content (in our case unchanged).
    content
  end
end