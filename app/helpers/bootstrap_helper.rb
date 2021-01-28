module BootstrapHelper
  def alerta_success(dismissable = false, index = '0', &block)
    bootstrap_div_alerta('success', 'check', 'Sucesso! ', dismissable,
                         index, &block)
  end

  def alerta_info(dismissable = false, index = '0', &block)
    bootstrap_div_alerta('primary', 'info-circle', 'Dica: ', dismissable,
                         index, &block)
  end

  def alerta_warning(dismissable = false, index = '0', &block)
    bootstrap_div_alerta('warning', 'exclamation-triangle', 'Atenção! ',
                         dismissable, index, &block)
  end

  def alerta_danger(dismissable = false, index = '0', &block)
    bootstrap_div_alerta('danger', 'close', 'Erro! ', dismissable,
                         index, &block)
  end

  def bootstrap_div_alerta(css_class, icon, txt, _dismissable = false, idx = '0', &block)
    tag.div(class: "alert alert-#{css_class} col-12", role: 'alert') do
      span_conteudo = tag.span tabindex: idx do
        concat tag.strong { fa_icon icon, text: txt }
        concat capture(&block)
      end
      concat span_conteudo
    end
  end
end
