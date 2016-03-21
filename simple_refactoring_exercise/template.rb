module Template

  # Since the lines were repeated they are put in one function and the function is called with parameters, this removes repeatation of code.
  def templateParts(template_split_begin, template_split_end)
    template_part_one =
      String.new(template[0..(template_split_begin-1)])
    template_part_two =
      String.new(template[template_split_end..template.length])
      return (template_part_one, template_part_two)


  def template(source_template, req_id)
    template = String.new(source_template)

    # Substitute for %CODE%
    template_split_begin = template.index("%CODE%")
    template_split_end = template_split_begin + 6
    
    template_part_one, template_part_two = templateParts(template_split_begin, template_split_end)
    
    code = String.new(req_id)
    template = String.new(template_part_one + code + template_part_two)

    # Substitute for %ALTCODE%
    template_split_begin = template.index("%ALTCODE%")
    template_split_end = template_split_begin + 9
    
    template_part_one, template_part_two = templateParts(template_split_begin, template_split_end)

    altcode = code[0..4] + "-" + code[5..7]
    template_part_one + altcode + template_part_two
  end
end
