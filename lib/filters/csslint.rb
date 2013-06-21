# encoding: utf-8

class CSSLintFilter < Nanoc::Filter
  requires 'execcsslint'

  identifier :csslint
  type :text

  def run(content, params={})
    messages = CSSLint.run(content).error_messages

    "csslint: #{item.identifier.chop}.#{item[:extension]}", messages unless messages.empty?

    # Don't raise an exception by default since CSS will generally work.
    if params[:strict]
        raise RuntimeError, "csslint: fatal error" unless result.valid?
    end

    # A textual filter should return the content (in our case unchanged).
    content
  end
end