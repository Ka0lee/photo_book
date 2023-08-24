module PhotographsHelper
  def photograph_lists(photographs)
    html = ''
    photographs.each do |photograph|
      html += render(partial: 'photograph',locals: { photograph: photograph })
    end
    return raw(html)
  end
end
