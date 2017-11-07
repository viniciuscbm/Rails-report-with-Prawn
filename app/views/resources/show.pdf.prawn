prawn_document do |pdf|

  # JACKSON

  # DUVIDA:

  # O cabeçalho e rodapé abaixo se repetem em todas as páginas que forem criadas, porém,
  # os textos em geral sobrescrevem o conteúdo deles, não respeitando a box.

  # Os texto do meu modelo podem ser de 30 até 2000 caracteres, ou seja, a box pode expandir
  # dependendo do tamanho do texto, e isso irá gerar páginas automaticamente

  # Ao total existem 5 campos com 30 a 2000 caracteres, na minha solução eu precisava de um relatório
  # dinâmico, que se adptasse a essa situação.

  # Também não vejo uma maneira de colocar o número das páginas.

  # Caso o prawn não de suporte a esse tipo de relatório eu já comecei a estudar o wicked_pdf.

  # Abaixo tentetei deixar o mas próximo possível do que tenho no projeto original
  # Onde tem (ACTIVE RECORD), seria algo que puxo de um modelo, mas isso está ok,
  # não precisa se preocupar com isso.


  # Cabeçalho
  pdf.repeat(:all) do
    pdf.bounding_box([0, pdf.cursor], :width => 500, :height => 70) do
      pdf.font_size(15) { pdf.text "NOME DA INSTITUIÇÃO (ACTIVE RECORD)", :style => :bold }
      pdf.font_size(12) { pdf.text "Sistema de Ouvidoria (e-SIC)" }
      pdf.font_size(12) { pdf.text "Histórico da Solicitação" }
      pdf.font_size(12) {pdf.text "Data da Emissão:#{Time.current.to_s(:show)}"}
      pdf.move_down 5
      pdf.stroke_horizontal_rule
    end
  end

    # Identificação da Solicitação
  pdf.bounding_box([0, pdf.cursor], :width => 250, :height => 20) do
    pdf.move_down 5
    pdf.text "Identificação da solicitação", :style => :bold
    pdf.stroke_horizontal_rule
  end

  # Data do Registro da Solicitação
    pdf.bounding_box([250, pdf.cursor + 20], :width => 250, :height => 20) do
      pdf.move_down 5
      pdf.text "Registrado em:#{@resource.created_at.to_s(:show)}", :align => :right, :style => :bold
      pdf.stroke_horizontal_rule
    end

    # Isso poderia se repetir nos outros 5 modelos, esse é só um teste com texto grande
    # A ideia é que esse texto grande respeite o cabeçalho e o rodapé.
    pdf.font_size(11) { pdf.text "Mensagem: #{@resource.description}"}

    # Rodapé
  pdf.repeat(:all) do
    pdf.bounding_box([0, 35], :width => 500, :height => 60) do
      pdf.stroke_horizontal_rule
      pdf.move_down 5
      pdf.text "Rua: NOME DA RUA (ACTIVE RECORD), n° NÚMERO (ACTIVE RECORD), COMPLEMENTO (ACTIVE RECORD)"
      pdf.text "Bairro: BAIRRO (ACTIVE RECORD), CEP: ZIPCODE (ACTIVE RECORD)"
      pdf.text "Telefone Ouvidoria: TELEFONE (ACTIVE RECORD)"
    end
  end
  pdf.start_new_page
end

