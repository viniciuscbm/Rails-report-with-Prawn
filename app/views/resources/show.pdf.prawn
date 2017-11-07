prawn_document do |pdf|

  pdf.repeat(:all) do # Repete em todas as páginas
    # Cabeçalho
    pdf.bounding_box([0, pdf.cursor], :width => 500, :height => 70) do
      pdf.font_size(15) { pdf.text "NOME DA INSTITUIÇÃO (ACTIVE RECORD)", :style => :bold }
      pdf.font_size(12) { pdf.text "Sistema de Ouvidoria (e-SIC)" }
      pdf.font_size(12) { pdf.text "Histórico da Solicitação" }
      pdf.font_size(12) {pdf.text "Data da Emissão:#{Time.current.to_s(:show)}"}
      pdf.move_down 5
      pdf.stroke_horizontal_rule
    end

    # Rodapé
    pdf.bounding_box([0, 35], :width => 500, :height => 60) do
      pdf.stroke_horizontal_rule
      pdf.move_down 5
      pdf.text "Rua: NOME DA RUA (ACTIVE RECORD), n° NÚMERO (ACTIVE RECORD), COMPLEMENTO (ACTIVE RECORD)"
      pdf.text "Bairro: BAIRRO (ACTIVE RECORD), CEP: ZIPCODE (ACTIVE RECORD)"
      pdf.text "Telefone Ouvidoria: TELEFONE (ACTIVE RECORD)"
    end
  end

  # Body
  pdf.bounding_box([pdf.bounds.left, pdf.bounds.top - 100], :width  => pdf.bounds.width, :height => pdf.bounds.height - 140) do
    
    pdf.text "Identificação da solicitação", :style => :bold
    pdf.stroke_horizontal_rule
    
    pdf.move_down 5
    pdf.text "Registrado em:#{@resource.created_at.to_s(:show)}", :align => :right, :style => :bold
    pdf.stroke_horizontal_rule
    
    pdf.move_down 10
    pdf.font_size(11) { pdf.text "Mensagem: #{@resource.description}"}
  end

end
