module DatasHelper
  def format_date(object)
    msg = tag.span(t('default.nao_informada'), class: 'text-danger')
    object.present? ? date_format(object) : msg
  end

  def date_format(date)
    date ? date.strftime('%H:%M') : nil
  end
end
